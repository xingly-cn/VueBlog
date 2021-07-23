package com.asugar.asugarblog.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

/**
 * @author Xiner
 * @since 2021-07-20
 */
@Data
@Accessors(chain = true)
@TableName("m_user")
public class MUser implements Serializable {

    @TableId(value = "id",type = IdType.AUTO)
    private String id;

    @NotBlank(message = "账户不能为空")
    private String username;

    @NotBlank(message = "密码不能为空")
    private String password;

    private String avatar;

    private Integer status;

    private LocalDateTime created;

    private LocalDateTime lastLogin;

    @Email(message = "邮箱格式不正确")
    @NotBlank(message = "邮箱不能为空")
    private String email;

}
