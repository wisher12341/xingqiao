package com.xq.wxpay.config;

/**
 * 存储微信公众号信息
 * Created by netlab606 on 2017/9/18.
 */
public class WxConfig {

    public static String APPID="wx41aea10976e1038a";
    public static String REDIRECT_URI="";
    public static String APPSECRET="0d301b2f8efda8e27379fe2354c776b9";
    public static String ACCESS_TOKEN_URL="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+APPID+"&secret="+APPSECRET;
    public static String ACCESS_TOKEN="";
    public static String UPLOADIMG="https://api.weixin.qq.com/cgi-bin/media/uploadimg?access_token=";//上传图文消息内的图片获取URL
    public static String UPLOADNEWS="https://api.weixin.qq.com/cgi-bin/media/uploadnews?access_token=";  //上传图文消息素材  群发
    public static String ADD_NEWS="https://api.weixin.qq.com/cgi-bin/material/add_news?access_token=";//新增永久素材
    public static String MEDIA_ID="";//存储 最新的新增的永久素材ID  供活动公告使用

    public static String PIC_URL="";//存储 向微信新上传的图片路径

//    public static String THUMB_MEDIA_ID="";

    public static String ADD_MATERIAL="https://api.weixin.qq.com/cgi-bin/material/add_material?type=thumb&access_token=";//获取上传图文素材的 thumb_media_id  永久素材用
    public static String UPLOAD="http://file.api.weixin.qq.com/cgi-bin/media/upload?type=thumb&access_token=";//获取上传图文素材的 thumb_media_id  群发用

    public static String MENU="https://api.weixin.qq.com/cgi-bin/menu/create?access_token=";//自定义菜单

    public static String SEND_NEWS_MEDIA_ID;//存储  需要群发的  消息的 medi_id
    public static String SENDALL="https://api.weixin.qq.com/cgi-bin/message/mass/sendall?access_token=";//群发


    //微信公众号支付
    public static String NOTIFY_URL="http://www.aa.com/wx/order/wxpay/notify_url";//微信公众号支付 异步通知回调
    public static String PAY_URL="https://api.mch.weixin.qq.com/pay/unifiedorder";
    public static String MCHID="1449388802";//微信支付分配的商户号
    public static String PAY_KEY="shanghaisibeikejiyouxiangongsi17";//公众号支付时 生成前面用到的KEY  key设置路径：微信商户平台(pay.weixin.qq.com)-->账户设置-->API安全-->密钥设置


    public static String SEND="https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=";//客服发送消息

}
