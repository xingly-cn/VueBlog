package com.asugar.asugarblog.service.impl;

import com.asugar.asugarblog.entity.MUser;
import com.asugar.asugarblog.mapper.MUserMapper;
import com.asugar.asugarblog.service.IMUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Xiner
 * @since 2021-07-20
 */
@Service
public class MUserServiceImpl extends ServiceImpl<MUserMapper, MUser> implements IMUserService {

}
