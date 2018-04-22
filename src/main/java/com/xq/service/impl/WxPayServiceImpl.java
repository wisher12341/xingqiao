package com.xq.service.impl;

import com.xq.dao.MessageDao;
import com.xq.dao.OrderDao;
import com.xq.interceptor.WxInterceptor;
import com.xq.model.Message;
import com.xq.model.Order;
import com.xq.service.WxPayService;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import com.xq.util.HttpRequestor;
import com.xq.wxpay.config.WxConfig;
import com.xq.wxpay.config.WxSendData;
import com.xq.wxpay.sdk.WXPayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by netlab606 on 2017/11/10.
 */
@Service
public class WxPayServiceImpl implements WxPayService{

    @Autowired
    OrderDao orderDao;
    @Autowired
    MessageDao messageDao;

    public WxSendData pay(String oid, HttpServletRequest request) {
        Order order=orderDao.getOrderPayByOid(oid);
        String out_trade_no = order.getId();
        String subject="康复项目"+order.getRecoverOb();
        Double total=order.getTotalpay();
        String openid= CookieUtil.checkCookie(request, Const.OPENID_PARENT);
//        String openid="123";
//        openid="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
        WxSendData wxSendData=wx_pay(subject,out_trade_no,openid,request,total);
        return wxSendData;
    }

    public WxSendData wx_pay(String body, String out_trade_no, String openid, HttpServletRequest request, Double total){
        WxSendData wxSendData=new WxSendData();
        wxSendData.setAppID(WxConfig.APPID);
        wxSendData.setMchID(WxConfig.MCHID);
        wxSendData.setOpenid(openid);
        wxSendData.setNonceStr(WXPayUtil.generateNonceStr());
        try {
            wxSendData.setBody(new String(body.getBytes("ISO-8859-1") ,"UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        wxSendData.setOutTradeNo(out_trade_no);
        wxSendData.setTotalFee((int) (total*100));//总金额以分为单位，不带小数点
        wxSendData.setSpbillCreateIp(request.getRemoteAddr());//订单生成的机器 IP
        wxSendData.setNotifyUrl(WxConfig.NOTIFY_URL);
        wxSendData.setTradeType("JSAPI");


        // 参数名ASCII码从小到大排序（字典序） 最后拼接上key key设置路径：微信商户平台(pay.weixin.qq.com)-->账户设置-->API安全-->密钥设置
        SortedMap<String,String> parameters = new TreeMap<String,String>();
        parameters.put("appid", wxSendData.getAppID());
        parameters.put("body", wxSendData.getBody());
        parameters.put("mch_id", wxSendData.getMchID());
        parameters.put("nonce_str", wxSendData.getNonceStr());
        parameters.put("notify_url", wxSendData.getNotifyUrl());
        parameters.put("openid", wxSendData.getOpenid());
        parameters.put("out_trade_no", wxSendData.getOutTradeNo());
        parameters.put("spbill_create_ip", wxSendData.getSpbillCreateIp());
        parameters.put("total_fee", wxSendData.getTotalFee().toString());
        parameters.put("trade_type", wxSendData.getTradeType());

        String sign= "";
        String xml="";
        try {
            sign = WXPayUtil.generateSignature(parameters, WxConfig.PAY_KEY);
            wxSendData.setSign(sign);
            parameters.put("sign",wxSendData.getSign());
            xml=WXPayUtil.mapToXml(parameters);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //进行转码
//        try {
//            xml=new String(xml.getBytes("UTF-8"), "ISO-8859-1");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }

        String result=new HttpRequestor().postXml(WxConfig.PAY_URL,xml);
//        WxInterceptor.logger.info(result);
        Map<String,String> resullt_map;
        String prepay_id="";
        String paySign="";//要重新生成 新的签名
        try {
            resullt_map=WXPayUtil.xmlToMap(result);
            prepay_id=resullt_map.get("prepay_id");

            wxSendData.setPrepayId(prepay_id);
            wxSendData.setTimeStamp(new Date().getTime()+"");

            SortedMap<String,String> parameters_h5 = new TreeMap<String,String>();
            parameters_h5.put("appId", wxSendData.getAppID());
            parameters_h5.put("nonceStr", wxSendData.getNonceStr());
            parameters_h5.put("package", "prepay_id="+wxSendData.getPrepayId());
            parameters_h5.put("signType", "MD5");
            parameters_h5.put("timeStamp", wxSendData.getTimeStamp());

            paySign = WXPayUtil.generateSignature(parameters_h5, WxConfig.PAY_KEY);

            wxSendData.setPaySign(paySign);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return wxSendData;
    }


    @Transactional
    public String notufy_url(HttpServletRequest request, HttpServletResponse response) throws ParseException {

        String out_trade_no = "";//商户订单号
        String transaction_id = "";//微信支付订单号
        StringBuffer sb=new StringBuffer();
        try {
            InputStream inputStream = request.getInputStream(); String s;
            BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
            while ((s = in.readLine()) != null) {
                sb.append(s);
//                System.out.println(s);
            }
            String data=sb.toString();
            Map<String,String> map=WXPayUtil.xmlToMap(data);

            out_trade_no = map.get("out_trade_no");
            transaction_id = map.get("transaction_id");
        } catch (Exception e) {
            e.printStackTrace();
        }

        Order order=orderDao.getOrderPayByOid(out_trade_no);
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        String dateNowStr = sdf.format(d);
        if(order.getTradeNoWx()==null||order.getTradeNoWx().equals("")){
            order.setStatusP(3);
            order.setStatusT(3);
            order.setPayWay("微信");
            order.setTradeNoWx(transaction_id);
            order.setTrace("#"+dateNowStr+"@支付成功");
            order.setRealpay(order.getTotalpay());

            Message messageP=new Message();
            messageP.setTime(dateNowStr);
            messageP.setUserId(order.getUidP());
            messageP.setMessage("<p>\n" +
                    "<span style=\"color:red;\">系统消息：</span>\n" +
                    "</p>\n" +
                    "<p>\n" +
                    "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                    "    您的预约单（"+out_trade_no+"），已支付。"+
                    "</p>");

            messageDao.addMessage(messageP);

            Message messageT=new Message();
            messageT.setTime(dateNowStr);
            messageT.setUserId(order.getUidT());
            messageT.setMessage("<p>\n" +
                    "<span style=\"color:red;\">系统消息：</span>\n" +
                    "</p>\n" +
                    "<p>\n" +
                    "<span style=\"background-color: rgb(255, 255, 255);\"></span>\n" +
                    "    您的预约单（"+out_trade_no+"），家长已支付。"+
                    "</p>");

            messageDao.addMessage(messageT);

            orderDao.orderPay(order);
        }


        SortedMap<String,String> parameters = new TreeMap<String,String>();
        parameters.put("return_code", "SUCCESS");
        parameters.put("return_msg", "OK");
        String xml="";
        try {
            xml=WXPayUtil.mapToXml(parameters);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            response.getWriter().write("<xml><return_code><![CDATA[SUCCESS]]></return_code></xml>");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return xml;
    }
}
