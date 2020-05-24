package com.jblog.project.blog.utils;


import com.github.pagehelper.PageHelper;
import com.jblog.common.utils.StringUtils;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
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



    /**
     * 分页结果集
     */
    @Getter
    @Setter
    public static class TableDataInfo extends HashMap<String, Object> {
        private static final long serialVersionUID = 1L;
        /** 消息状态码 */
        private static final int code = 200;
        /** 消息内容 */
        private static final String msg = "操作成功";
        /** 当前页数 */
        private int pageNum;
        /** 每页记录数 */
        private int pageSize;
        /** 总记录数 */
        private int totalCount;
        /** 总页数 */
        private int totalPage;
        /** 列表数据 */
        private List<?> rows;



        /**
         * 分页
         *
         * @param rows       列表数据
         * @param totalCount 总记录数
         */
        public TableDataInfo(List<?> rows, int totalCount) {
            super.put("code",code);
            super.put("msg",msg);
            if(rows == null || rows.size() == 0){
                super.put("rows", Collections.emptyList());
            }else{
                super.put("rows", rows);
            }
            super.put("totalCount",totalCount);
        }

        /**
         * 分页
         *
         * @param rows       列表数据
         * @param totalCount 总记录数
         * @param pageSize   每页记录数
         * @param pageNum   当前页数
         */
        public TableDataInfo(List<?> rows, int totalCount, int pageSize, int pageNum) {
            super.put("code",code);
            super.put("msg",msg);
            if(rows == null || rows.size() == 0){
                super.put("rows", Collections.emptyList());
            }else{
                super.put("rows", rows);
            }
            super.put("totalCount",totalCount);
            super.put("pageSize",pageSize);
            super.put("pageNum",pageNum);
            super.put("totalCount",totalCount);
            super.put("totalPage",(int) Math.ceil((double) totalCount / pageSize));
        }
    }




    /**
     * PageConditionForm 可被接收排序参数的类继承
     */
    @Getter
    @Setter
    public static class PageConditionForm{
        /** 当前页*/
        private Integer pageNum;
        /** 页大小*/
        private Integer pageSize;
        /** 排序字段（如 name,age）*/
        private String orderField;
        /** 排序关键字 desc、asc */
        private String order;

        /** 是否有指定字段排序条件（默认false）*/
        private boolean orderFlag;
        /** 构造的 orderBy 语句 */
        private String orderByStatement;
    }



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
    private static PageConditionForm generatePageCondition(Map params){
        PageConditionForm pageVo = new PageConditionForm();
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
        PageConditionForm pageConditionForm = generatePageCondition(params);
        if(pageConditionForm.isOrderFlag()){
            PageHelper.startPage(pageConditionForm.getPageNum(),
                    pageConditionForm.getPageSize(), pageConditionForm.getOrderByStatement());
        }else{
            PageHelper.startPage(pageConditionForm.getPageNum(), pageConditionForm.getPageSize());
        }
    }
}
