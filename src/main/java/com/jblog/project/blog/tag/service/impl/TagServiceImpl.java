package com.jblog.project.blog.tag.service.impl;


import com.jblog.common.utils.ip.AddressUtils;
import com.jblog.project.blog.tag.domain.TagEntity;
import com.jblog.project.blog.tag.domain.vo.TagVo;
import com.jblog.project.blog.tag.mapper.TagMapper;
import com.jblog.project.blog.tag.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 标签表
 *
 * @author shadow
 *
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
        String url = AddressUtils.getCurrApiAddress();
        List<TagVo> tagVoList = tagMapper.queryTagDetails();
        for(TagVo tagVo : tagVoList){
            tagVo.setAvatar(url+"avatar/"+tagVo.getAvatar());
        }
        return tagVoList;
    }

    /**
     * 查询单条标签详情
     *
     * @return
     */
    @Override
    public TagVo queryOneTagDetail(Integer tagId) {
        String url = AddressUtils.getCurrApiAddress();
        TagVo tag = tagMapper.queryOneTagDetail(tagId);
        tag.setAvatar(url+"avatar/"+tag.getAvatar());
        return tag;
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
