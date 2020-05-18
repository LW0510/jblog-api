package com.jblog;

import com.jblog.project.blog.article.mapper.ArticleMapper;
import com.jblog.project.blog.category.mapper.CategoryMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MybatisPlusTest {

    @Autowired
    private ArticleMapper articleMapper;
    @Autowired
    private CategoryMapper categoryMapper;

    @Test
    public void testArticleMapper(){
//        Integer list = articleMapper.selectCount(null);
//        System.out.println(list);
    }
}
