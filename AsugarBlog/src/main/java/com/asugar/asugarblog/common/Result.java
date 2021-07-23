package com.asugar.asugarblog.common;

import lombok.Data;
import java.io.Serializable;

/**
 * 统一返回类型
 */
@Data
public class Result implements Serializable {

    private int code;
    private String msg;
    private Object data;


    /**
     * 成功 - 自定义msg
     */
    public static Result success(String msg,Object data){
        Result result = new Result();
        result.setCode(200);
        result.setMsg(msg);
        result.setData(data);
        return result;
    }

    /**
     * 失败 - 自定义msg
     */
    public static Result fail(String msg,Object data){
        Result result = new Result();
        result.setCode(500);
        result.setMsg(msg);
        result.setData(data);
        return result;
    }


}
