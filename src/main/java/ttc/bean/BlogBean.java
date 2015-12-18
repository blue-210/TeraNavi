package ttc.bean;
public class BlogBean implements Bean{
  private String blogId;
  private String headPhotoPath;
  private String title;
  private ArrayList articles;


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
	* Returns value of headPhotoPath
	* @return
	*/
	public String getHeadPhotoPath() {
		return headPhotoPath;
	}

	/**
	* Sets new value of headPhotoPath
	* @param
	*/
	public void setHeadPhotoPath(String headPhotoPath) {
		this.headPhotoPath = headPhotoPath;
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
	* Returns value of articles
	* @return
	*/
	public ArrayList getArticles() {
		return articles;
	}

	/**
	* Sets new value of articles
	* @param
	*/
	public void setArticles(ArrayList articles) {
		this.articles = articles;
	}
}
