package com.service;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.dao.ArticleDao;
import com.entity.Article;

@Service("articleService")
public class ArticleService{
	@Resource  
    private ArticleDao articleDao;

	public List<Article> getArticlesByUserId(String uId) {
		return articleDao.getArticlesByUserId(uId);
	}

	public List<Article> selfArticleList(String uId) {
		return articleDao.selfArticleList(uId);
	}
	
	public Article openArticle(String id) {
		return articleDao.openArticle(id);
	}
	public void updateByPrimaryKeySelective(Article article) {
		articleDao.updateByPrimaryKeySelective(article);
	}
	
	public int insert(Article record) {
		return articleDao.insert(record);
	}

}
