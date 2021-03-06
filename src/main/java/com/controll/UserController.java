package com.controll;

import java.io.IOException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.base.BaseSet;
import com.entity.User;
import com.service.UserService;

/**
 * 用户登录相关
 * @author lijie
 *
 */
@Controller
@RequestMapping("/user")  
public class UserController {
	@Resource  
    private UserService userService;  
    
	private static Logger logger = Logger.getLogger(UserController.class);
	
    private UserController(){
    	
    }
    /**
     * 校验
     */
    @RequestMapping("/checkLogin")
    @ResponseBody
    public int checkLogin(HttpServletRequest req,@RequestParam("name")String name,@RequestParam("pass")String pass){ 
    	HttpSession session=req.getSession();
        return checkLogin(session,name,pass);
    }
    /**
     * 登录
     */
    @RequestMapping("/index")
    public String index(HttpServletRequest req,@RequestParam(value = "username", required = false)String name,@RequestParam(value ="password", required = false)String pass){ 
    	HttpSession session=req.getSession();
    	User user=(User)session.getAttribute(BaseSet.USER);
    	
    	if (null!=user&&(boolean)session.getAttribute(BaseSet.LOGIN_FLAG)) {//会话有登录信息，返回成功
    		logger.info(user.getName()+"已经登陆  sessionId:"+session.getId());
    		return "welcome";
		}
    	if (1==checkLogin(req.getSession(),name,pass)) {
    		logger.info(name+"登录成功");
    		return "welcome";
		}else {
			return "err";
		}
    }
    /**
     * 退出登录
     */
    @RequestMapping("/loginOut")
    @ResponseBody
    public String loginOut(HttpServletRequest req, HttpServletResponse res){ 
        HttpSession s=req.getSession();
        User user=(User)s.getAttribute(BaseSet.USER);
        logger.info("loginOut:"+user.getName()+"退出登录");
        s.removeAttribute(BaseSet.USER);
        s.setAttribute(BaseSet.LOGIN_FLAG, false);
        s.invalidate();
        try {
			res.sendRedirect(req.getContextPath() + "/login.jsp");
		} catch (IOException e) {
			logger.error("跳转登录失败");
		}
        return "success";
    }
    /**
     * 欢迎页
     */
    @RequestMapping("/welcome")
    public String welcome(){ 
        return "welcome";
    }
    /**
     * 欢迎页
     */
    @RequestMapping("/checkOrderWord")
    public String checkOrderWord(@RequestParam("name")String name){ 
        return "welcome";
    }
    /**
     *校验登录信息
     */
    private int checkLogin(HttpSession session,String name,String pass){
        if (null==this.userService.selectByName(name)) {
        	logger.error("login:没有此用户，请先注册");
        	return BaseSet.ERR_USER;
		}
        User user = this.userService.checkPassword(name,pass);
        if (null==user) {
        	logger.error("login:密码错误");
        	return BaseSet.ERR_PASSWORD;
		}
        session.setAttribute(BaseSet.USER, user);
        session.setAttribute(BaseSet.LOGIN_FLAG, true);
        return BaseSet.SUCCESS_LOGIN;
    }
}
