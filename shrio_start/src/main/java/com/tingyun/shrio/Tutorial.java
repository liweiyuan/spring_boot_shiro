package com.tingyun.shrio;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by spark on 17-5-24.
 */
public class Tutorial {

    private static final transient Logger logger = LoggerFactory.getLogger(Tutorial.class);

    public static void main(String[] args) {
        logger.info("My First Apache Shiro Application");

        //1
        Factory<SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro.ini");
        //2
        SecurityManager manager = factory.getInstance();
        //3
        SecurityUtils.setSecurityManager(manager);

        //4获取当前用户
        Subject currentUser = SecurityUtils.getSubject();

        //获取session
        Session session = currentUser.getSession();
        session.setAttribute("someKey", "someValue");

        String value = (String) session.getAttribute("someKey");
        if ("someValue".equals(value)) {
            logger.info("Retrieved the correct value! [" + value + "]");
        }
        // 登录当前用户检验角色和权限
        if (!currentUser.isAuthenticated()) {
            //收集用户的主要信息和凭据，来自GUI中的特定的方式
            //如包含用户名/密码的HTML表格，X509证书，OpenID，等。
            //我们将使用用户名/密码的例子因为它是最常见的。.
            UsernamePasswordToken token = new UsernamePasswordToken("lonestarr", "vespa");
            //支持'remember me' (无需配置，内建的!):
            token.setRememberMe(true);

            //有可能登陆失败
            try {
                currentUser.login(token);
            } catch (UnknownAccountException uae) {
                logger.info("There is no user with username of " + token.getPrincipal());
            } catch (IncorrectCredentialsException ice) {
                logger.info("Password for account " + token.getPrincipal() + " was incorrect!");
            } catch (LockedAccountException lae) {
                logger.info("The account for username " + token.getPrincipal() + " is locked.  " +
                        "Please contact your administrator to unlock it.");
            } catch (AuthenticationException ae) {
                //无定义?错误?
            }
            logger.info("User [" + currentUser.getPrincipal() + "] logged in successfully.");
        }

        //测试角色:
        if (currentUser.hasRole("schwartz")) {
            logger.info("May the Schwartz be with you!");
        } else {
            logger.info("Hello, mere mortal.");
        }

        //测试一个权限 (非（instance-level）实例级别)
        if (currentUser.isPermitted("lightsaber:weild")) {
            logger.info("You may use a lightsaber ring.  Use it wisely.");
        } else {
            logger.info("Sorry, lightsaber rings are for schwartz masters only.");
        }

        //一个(非常强大)的实例级别的权限:
        if (currentUser.isPermitted("winnebago:drive:eagle5")) {
            logger.info("You are permitted to 'drive' the winnebago with license plate (id) 'eagle5'.  " +
                    "Here are the keys - have fun!");
        } else {
            logger.info("Sorry, you aren't allowed to drive the 'eagle5' winnebago!");
        }

        //完成 - 退出t!
        currentUser.logout();

        System.exit(0);
    }

}

