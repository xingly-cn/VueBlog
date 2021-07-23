package com.asugar.asugarblog.controller;


import com.asugar.asugarblog.common.Result;
import com.asugar.asugarblog.entity.MBlog;
import com.asugar.asugarblog.service.IMBlogService;
import com.asugar.asugarblog.service.IMUserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;


/**
 *
 * @author Xiner
 * @since 2021-07-20
 */
@RestController
public class MBlogController{

    @Autowired
    IMBlogService blogService;

    @RequestMapping("blogs")
    public Result list(@RequestParam(defaultValue = "1") Integer curPage){
        // 分页插件 - 一页5篇文章
        Page page = new Page(curPage,5);
        // 查询文章列表,按创建时间倒序
        IPage created = blogService.page(page, new QueryWrapper<MBlog>().orderByDesc("created"));
        // 返回文章列表
        return Result.success("文章列表获取成功",created);
    }

    @RequestMapping("blog/{id}")
    public Result detail(@PathVariable(name = "id") Long id){
        // 查询文章
        MBlog blog = blogService.getById(id);
        // 文章不存在判断
        if(blog==null) return Result.fail("文章不存在",null);
        // 返回文章信息
        return Result.success("文章获取成功",blog);
    }

    @PostMapping("blog/edit")
    public Result edit(@Validated @RequestBody MBlog blog){
        // 临时Blog
        MBlog temp = null;
        // 新增
        if(blog.getId()==null){
            temp = new MBlog();
            temp.setUserId("1");
            temp.setTitle(blog.getTitle());
            temp.setDescription(blog.getDescription());
            temp.setContent(blog.getContent());
            temp.setCreated(LocalDateTime.now());
            temp.setStatus(0);
        }
        // 修改
        else{
            temp = blogService.getById(blog.getId());
        }
        // 对象复制
        BeanUtils.copyProperties(blog,temp,"id","userId","created","status");
        // 是否发布成功
        boolean isOK = blogService.saveOrUpdate(temp);
        // 成功返回
        return Result.success("发布成功",isOK);
    }
}
