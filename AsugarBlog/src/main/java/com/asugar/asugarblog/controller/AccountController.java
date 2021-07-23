package com.asugar.asugarblog.controller;

import com.asugar.asugarblog.common.Result;
import com.asugar.asugarblog.entity.MUser;
import com.asugar.asugarblog.service.IMUserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class AccountController {

    @Autowired
    IMUserService userService;

    /**
     * 用户登陆
     * @param user
     * @return
     */
    @PostMapping("login")
    public Result login(@Validated @RequestBody MUser user){
        // 数据库中查询
        MUser people = userService.getOne(new QueryWrapper<MUser>().eq("username", user.getUsername()));
        // 用户不存在抛出异常
        if(people==null) return Result.fail("用户不存在",null);
        // 密码错误抛出异常
        if (!people.getPassword().equals(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()))){
            return Result.fail("账号或密码错误",null);
        }
        // 封装用户账号信息
        Map<String,String> data = new HashMap<>();
        data.put("id",people.getId());
        data.put("username",people.getUsername());
        data.put("email",people.getEmail());
        data.put("avatar",people.getAvatar());
        data.put("status",people.getStatus().toString());
        data.put("created",people.getCreated().toString());
        data.put("lastLogin",people.getLastLogin().toString());
        // 登陆成功返回数据
        return Result.success("登陆成功",data);
    }

    @RequestMapping("logout")
    public Result logout(){
        return Result.success("退出成功",null);
    }
}

