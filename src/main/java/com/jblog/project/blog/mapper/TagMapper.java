package com.jblog.project.blog.mapper;

import com.jblog.project.blog.entity.TagEntity;
import com.jblog.project.blog.vo.TagVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 标签表
 */
@Mapper
public interface TagMapper {
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
     * 查询标签列表
     * @return
     */
    List<TagEntity> selectList();


    Integer insert(TagEntity tag);

    Integer updateById(TagEntity tag);

    Integer deleteBatchIds(List<Integer> asList);

    List<TagEntity> queryTagList(Map<String, Object> params);

}

