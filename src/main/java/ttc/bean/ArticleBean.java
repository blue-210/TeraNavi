package ttc.bean;
public class ArticleBean implements Bean{
  private String articleId;
  private String blogId;
  private String title;
  private String articleBody;
  private String createDate;
  private String tags;
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
	* Returns value of blogId
	* @return
	*/
	public String getBlogId() {
		return blogId;
	}

	/**
	* Sets new value of blogId
	* @param
	*/
	public void setBlogId(String blogId) {
		this.blogId = blogId;
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
	* Returns value of createDate
	* @return
	*/
	public String getCreateDate() {
		return createDate;
	}

	/**
	* Sets new value of createDate
	* @param
	*/
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	/**
	* Returns value of tags
	* @return
	*/
	public String getTags() {
		return tags;
	}

	/**
	* Sets new value of tags
	* @param
	*/
	public void setTags(String tags) {
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
}
