package ttc.bean;

import java.util.ArrayList;

public class ArticleBean implements Bean{
    private String articleId;
    private String title;
    private String articleBody;
    private String createdDate;
    private ArrayList tags;
    private ArrayList comments;


    /**
    * Returns value of articleId
    * @return
    */
    public String getArticleId() {
    	return articleId;
    }

    /**
    * Sets new value of articleId
    * @param
    */
    public void setArticleId(String articleId) {
    	this.articleId = articleId;
    }

    /**
    * Returns value of title
    * @return
    */
    public String getTitle() {
    	return title;
    }

    /**
    * Sets new value of title
    * @param
    */
    public void setTitle(String title) {
    	this.title = title;
    }

    /**
    * Returns value of articleBody
    * @return
    */
    public String getArticleBody() {
    	return articleBody;
    }

    /**
    * Sets new value of articleBody
    * @param
    */
    public void setArticleBody(String articleBody) {
    	this.articleBody = articleBody;
    }

    /**
    * Returns value of createdDate
    * @return
    */
    public String getCreatedDate() {
    	return createdDate;
    }

    /**
    * Sets new value of createdDate
    * @param
    */
    public void setCreatedDate(String createdDate) {
    	this.createdDate = createdDate;
    }

    /**
    * Returns value of tags
    * @return
    */
    public ArrayList getTags() {
    	return tags;
    }

    /**
    * Sets new value of tags
    * @param
    */
    public void setTags(ArrayList tags) {
    	this.tags = tags;
    }

    /**
    * Returns value of comments
    * @return
    */
    public ArrayList getComments() {
    	return comments;
    }

    /**
    * Sets new value of comments
    * @param
    */
    public void setComments(ArrayList comments) {
    	this.comments = comments;
    }
