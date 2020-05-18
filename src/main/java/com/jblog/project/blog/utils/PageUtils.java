package com.jblog.project.blog.utils;


import com.github.pagehelper.PageHelper;
import com.jblog.common.utils.StringUtils;
import com.jblog.project.blog.vo.PageCondition;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * 分页工具类
 *
 * @author shadow
 * @email shadow@163.com
 * @date 2016年11月4日 下午12:59:00
 */
public class PageUtils implements Serializable {
    private static final long serialVersionUID = 1L;
    //总记录数
    private int totalCount;
    //每页记录数
    private int pageSize;
    //总页数
    private int totalPage;
    //当前页数
    private int currPage;
    //列表数据
    private List<?> list;

    /**
     * 分页
     *
     * @param list       列表数据
     * @param totalCount 总记录数
     * @param pageSize   每页记录数
     * @param currPage   当前页数
     */
    public PageUtils(List<?> list, int totalCount, int pageSize, int currPage) {
        this.list = list;
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.currPage = currPage;
        this.totalPage = (int) Math.ceil((double) totalCount / pageSize);
    }

    /**
     * 分页
     */
//    public PageUtils(Page<?> page) {
//        this.list = page.getRecords();
//        this.totalCount = page.getTotal();
//        this.pageSize = page.getSize();
//        this.currPage = page.getCurrent();
//        this.totalPage = page.getPages();
//    }


    /**
     * 构造分页条件：
     * 1. 构造基本分页参数 pageNum、pageSize
     * 2. 构造 order by 语句（orderFlag = true 表示开启字段排序）
     *
     * @param Integer pageNum
     * @param Integer pageSize
     * @param String orderField
     * @param String order
     * @return
     */
    private static PageCondition generatePageCondition(Map params){
        PageCondition pageVo = new PageCondition();
        //设置分页参数
        Object pageNumObj = params.get("pageNum");
        Object pageSizeObj = params.get("pageSize");
        if(pageNumObj == null || ((Integer)pageNumObj) == 0){
            pageVo.setPageNum(1);
        }else{
            pageVo.setPageNum((Integer)pageNumObj);
        }
        if(pageSizeObj == null || ((Integer)pageSizeObj) == 0){
            pageVo.setPageSize(10);
        }else{
            pageVo.setPageSize((Integer)pageSizeObj);
        }


        Object orderObj = params.get("order");
        Object orderFieldObj = params.get("orderField");

        if(orderObj == null || StringUtils.isEmpty((String)orderObj)){
            pageVo.setOrder("desc");
        }else{
            pageVo.setOrder((String)orderObj);
        }

        if(orderFieldObj != null &&  StringUtils.isNotEmpty((String)orderFieldObj)){
            pageVo.setOrderField((String)orderFieldObj);
            pageVo.setOrderByStatement(pageVo.getOrderField() + " " + pageVo.getOrder());

            //设置字段排序标志
            pageVo.setOrderFlag(true);
        }
        return pageVo;
    }


    /**
     * 开启分页
     */
    public static void startMyPage(Map params){
        PageCondition pageCondition = generatePageCondition(params);
        if(pageCondition.isOrderFlag()){
            PageHelper.startPage(pageCondition.getPageNum(),
                    pageCondition.getPageSize(),pageCondition.getOrderByStatement());
        }else{
            PageHelper.startPage(pageCondition.getPageNum(), pageCondition.getPageSize());
        }
    }
}
