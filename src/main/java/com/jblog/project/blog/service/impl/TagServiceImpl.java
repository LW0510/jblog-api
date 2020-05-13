package com.jblog.project.blog.service.impl;


import com.jblog.project.blog.mapper.TagMapper;
import com.jblog.project.blog.entity.TagEntity;
import com.jblog.project.blog.service.TagService;
import com.jblog.project.blog.vo.TagVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 标签表
 *
 * @author liangfeihu
 * @email liangfhhd@163.com
 * @date 2018-07-04 15:00:54
 */
@Service("tagService")
public class TagServiceImpl implements TagService {

    @Autowired
    private TagMapper tagMapper;

    @Override
    public List<TagEntity> queryPage(Map<String, Object> params) {
//        Page<TagEntity> page = this.selectPage(
//                new Query<TagEntity>(params).getPage(),
//                new EntityWrapper<TagEntity>()
//        );
//
//        return new PageUtils(page);
        return tagMapper.queryTagList(params);
    }

    /**
     * 获取标签详情
     *
     * @param tagIds
     * @return
     */
    @Override
    public  List<TagEntity> queryHotTagDetails(Integer[] tagIds){
        if (tagIds == null || tagIds.length <= 0){
            return this.selectList();
        } else {
            return tagMapper.queryHotTagDetails(tagIds);
        }
    }

    /**
     * 查询标签详情
     *
     * @return
     */
    @Override
    public List<TagVo> queryTagDetails() {
        return tagMapper.queryTagDetails();
    }

    /**
     * 查询单条标签详情
     *
     * @return
     */
    @Override
    public TagVo queryOneTagDetail(Integer tagId) {
        return tagMapper.queryOneTagDetail(tagId);
    }


    /**
     * 获取标签列表
     * @return
     */
    @Override
    public List<TagEntity> selectList() {
        return tagMapper.selectList();
    }


    @Override
    public Integer insert(TagEntity tag) {
        return tagMapper.insert(tag);
    }

    @Override
    public Integer updateById(TagEntity tag) {
        return tagMapper.updateById(tag);
    }

    @Override
    public Integer deleteBatchIds(List<Integer> asList) {
        return tagMapper.deleteBatchIds(asList);
    }
}
