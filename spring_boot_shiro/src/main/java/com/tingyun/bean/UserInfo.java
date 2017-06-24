package com.tingyun.bean;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by spark on 17-6-11.
 */
@Entity
public class UserInfo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    private long uid;//用户id;

    @Column(unique = true)
    private String username;//账号.

    private String name;//名称（昵称或者真实姓名，不同系统不同定义）

    private String password; //密码;

    /**
     * 在这里salt主要是用来进行密码加密的，当然也可以使用明文进行编码测试，实际开发中还是建议密码进行加密。
     */
    private String salt;//加密密码的盐
    //用户状态,0:创建未认证（比如没有激活，没有输入验证码等等）--等待验证的用户 , 1:正常状态,2：用户被锁定.
    private byte state;
    // 一个用户具有多个角色
    @ManyToMany(fetch = FetchType.EAGER)//立即从数据库中进行加载数据;
    @JoinTable(name = "SysUserRole", joinColumns = {@JoinColumn(name = "uid")},
            inverseJoinColumns = {@JoinColumn(name = "roleId")})
    private List<SysRole> roleList;

    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public byte getState() {
        return state;
    }

    public void setState(byte state) {
        this.state = state;
    }

    public List<SysRole> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<SysRole> roleList) {
        this.roleList = roleList;
    }

    /**
     * 密码盐
     */
    public String getCredentialsSalt() {
        return this.username + this.salt;
    }

    @Override

    public String toString() {
        return "UserInfo [uid=" + uid + ", username=" + username + ", name=" + name + ", password=" + password
                + ", salt=" + salt + ", state=" + state + "]";
    }
}
