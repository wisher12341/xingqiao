package com.xq.interceptor;


import com.xq.dao.UserDao;
import com.xq.model.Teacher;
import com.xq.model.User;
import com.xq.util.Const;
import com.xq.util.CookieUtil;
import com.xq.wxpay.config.WxConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

/**
 *
 * 商城前台 拦截器
 * @author zh
 */
public class WxInterceptor extends HandlerInterceptorAdapter {
//	private final Logger log = LoggerFactory.getLogger(ShopInterceptor.class);

	@Autowired
	UserDao userDao;

	public static Logger logger;

	/*
	 * 利用正则映射到需要拦截的路径    
	 
    private String mappingURL;
    
    public void setMappingURL(String mappingURL) {    
               this.mappingURL = mappingURL;    
    }   
  */
    /** 
     * 在业务处理器处理请求之前被调用 
     * 如果返回false 
     *     从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链
     *     
     * 如果返回true 
     *    执行下一个拦截器,直到所有的拦截器都执行完毕 
     *    再执行被拦截的Controller 
     *    然后进入拦截器链, 
     *    从最后一个拦截器往回执行所有的postHandle() 
     *    接着再从最后一个拦截器往回执行所有的afterCompletion() 
     */
	//登录判定 先是Session再是Cookie
    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {

		if(logger==null){
            logger= Logger.getLogger("com.horstmann.corejava");
            FileHandler fh;
            try {
                File f=new File("log.txt");
                if(!f.exists()){
                    f.createNewFile();
                }

                fh = new FileHandler("log.txt",true);
              logger.addHandler(fh);//日志输出文件
                fh.setFormatter(new SimpleFormatter());//输出格式
            } catch (SecurityException e) {
               logger.log(Level.SEVERE, "安全性错误", e);
            } catch (IOException e) {
                System.out.println("IO异常");
                logger.log(Level.SEVERE, "读取文件日志错误", e);
            }
        }




		String redirect_url_parent="https://open.weixin.qq.com/connect/oauth2/authorize?appid="+ WxConfig.APPID+"&redirect_uri=http%3A%2F%2Fwww.yoocr.com%2Fwx%2fcallback%2Fopenid%2Fparent&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
		String redirect_url_teacher="https://open.weixin.qq.com/connect/oauth2/authorize?appid="+ WxConfig.APPID+"&redirect_uri=http%3A%2F%2Fwww.yoocr.com%2Fwx%2fcallback%2Fopenid%2Fteacher&response_type=code&scope=snsapi_base&state=123#wechat_redirect";


		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
//		request.getContextPath()返回项目根路径，也就是项目的名字,如果项目为根目录,则得到一个"",即空的字条串,
//		如果项目为abc, <%=request.getContextPath()% >/   将得到abc/
		String url = requestUri.substring(contextPath.length());

		request.getSession().setAttribute(Const.URL_BACK,url);

		//这里对拉入黑名单的ip进行处理【扩展】
//		log.info("来自 >>>>>>"+RequestUtil.getIpAddr(request)+" 请求访问。");
		User user;
		String openid_parent="";
		String openid_teacher="";
		//  /0/query用来过滤 在预约治疗师界面 查看治疗师成功案例 等详情
		if(url.contains("teacherCenter") && !url.contains("parent") && !url.contains("/0/query")){
//			治疗师登录
			openid_teacher= CookieUtil.checkCookie(request, Const.OPENID_TEACHER);
			if(openid_teacher==null){
				response.sendRedirect(redirect_url_teacher);
				return false;
			}
			user=userDao.getUserByOpenidStatus(openid_teacher,"1");
			if(user==null){
				response.sendRedirect(redirect_url_teacher);
				return false;
			}
		}else{
//			用户登录
			openid_parent=CookieUtil.checkCookie(request,Const.OPENID_PARENT);
//			openid_parent="oxsEYwlPAa-fVc9fVyzVBYBed9n8";
			if(openid_parent==null){
				response.sendRedirect(redirect_url_parent);
				return false;
			}
			user=userDao.getUserByOpenidStatus(openid_parent,"0");
			if(user==null){
				response.sendRedirect(redirect_url_parent);
				return false;
			}
		}
        return true;   
    }  
  
    /**
     * 在业务处理器处理请求执行完成后,生成视图之前执行的动作   
     * 可在modelAndView中加入数据，比如当前时间
     */
    @Override
    public void postHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
    }  
  
    /** 
     * 在DispatcherServlet完全处理完请求后被调用,可用于清理资源等  
     *  
     * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion() 
     */  
    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
    }  

}  
