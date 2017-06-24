package com.tingyun.service;

import com.tingyun.bean.UserInfo;

/**
 * Created by spark on 17-6-11.
 */
public interface UserInfoService {
    /**通过username查找用户信息;*/

    public UserInfo findByUsername(String username);
}
