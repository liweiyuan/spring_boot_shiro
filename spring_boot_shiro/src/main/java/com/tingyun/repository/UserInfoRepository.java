package com.tingyun.repository;

import com.tingyun.bean.UserInfo;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by spark on 17-6-11.
 */
public interface UserInfoRepository extends CrudRepository<UserInfo, Long> {
    /**
     * 通过username查找用户信息
     */
    public UserInfo findByUsername(String username);
}
