package com.jblog.project.blog.tag.service;

import com.jblog.project.blog.tag.domain.TagEntity;
import com.jblog.project.blog.tag.domain.vo.TagVo;

import java.util.List;
import java.util.Map;

/**
 * 标签表
 *  *
 */
public interface TagService {

    List<TagEntity> queryPage(Map<String, Object> params);

    /**
     * 获取标签详情
     *
     * @param tagIds
     * @return
     */
    List<TagEntity> queryHotTagDetails(Integer[] tagIds);

    /**
     * 查询标签详情
     *
     * @return
     */
    List<TagVo> queryTagDetails();

    /**
     * 查询单条标签详情
     *
     * @return
     */
    TagVo queryOneTagDetail(Integer tagId);


    /**
     * 获取标签列表
     * @return
     * @param tagEntity
     */
    List<TagEntity> selectList(TagEntity tagEntity);


    Integer insert(TagEntity tag);

    Integer updateById(TagEntity tag);

    Integer deleteBatchIds(List<Integer> asList);

    TagEntity getTagById(Integer id);
}

