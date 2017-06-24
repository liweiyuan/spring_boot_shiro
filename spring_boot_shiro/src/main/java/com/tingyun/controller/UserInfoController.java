package com.tingyun.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by spark on 17-6-11.
 */
@Controller
@RequestMapping(value = "/userInfo")
public class UserInfoController {

    @RequestMapping("/userList")
    public String userList(){
        return "userInfo";
    }

    @RequestMapping("/userAdd")
    @RequiresPermissions(value = "userInfo:add")//权限管理
    public String userAdd(){
        return "userInfoAdd";
    }

    /**
     * 用户删除;
     * @return
     */
    @RequestMapping("/userDel")
    @RequiresPermissions("userInfo:del")//权限管理;
    public String userDel(){
        return "userInfoDel";
    }
}
