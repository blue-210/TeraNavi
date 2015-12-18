package ttc.bean;
public class UserBean implements Bean{
  private String id;
  private String name;
  private String nameKana;
  private String sex;
  private String sexShowOrNot;
  private String birthData;
  private String mailAddress;
  private String password;
  private SecretQuestionBean question;
  private String secretAnswer;
  private String headPhotoPath;
  private String iconPhotoPath;
  private BlogBean blog;


	/**
	* Returns value of id
	* @return
	*/
	public String getId() {
		return id;
	}

	/**
	* Sets new value of id
	* @param
	*/
	public void setId(String id) {
		this.id = id;
	}

	/**
	* Returns value of name
	* @return
	*/
	public String getName() {
		return name;
	}

	/**
	* Sets new value of name
	* @param
	*/
	public void setName(String name) {
		this.name = name;
	}

	/**
	* Returns value of nameKana
	* @return
	*/
	public String getNameKana() {
		return nameKana;
	}

	/**
	* Sets new value of nameKana
	* @param
	*/
	public void setNameKana(String nameKana) {
		this.nameKana = nameKana;
	}

	/**
	* Returns value of sex
	* @return
	*/
	public String getSex() {
		return sex;
	}

	/**
	* Sets new value of sex
	* @param
	*/
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	* Returns value of sexShowOrNot
	* @return
	*/
	public String getSexShowOrNot() {
		return sexShowOrNot;
	}

	/**
	* Sets new value of sexShowOrNot
	* @param
	*/
	public void setSexShowOrNot(String sexShowOrNot) {
		this.sexShowOrNot = sexShowOrNot;
	}

	/**
	* Returns value of birthData
	* @return
	*/
	public String getBirthData() {
		return birthData;
	}

	/**
	* Sets new value of birthData
	* @param
	*/
	public void setBirthData(String birthData) {
		this.birthData = birthData;
	}

	/**
	* Returns value of mailAddress
	* @return
	*/
	public String getMailAddress() {
		return mailAddress;
	}

	/**
	* Sets new value of mailAddress
	* @param
	*/
	public void setMailAddress(String mailAddress) {
		this.mailAddress = mailAddress;
	}

	/**
	* Returns value of password
	* @return
	*/
	public String getPassword() {
		return password;
	}

	/**
	* Sets new value of password
	* @param
	*/
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	* Returns value of question
	* @return
	*/
	public SecretQuestionBean getQuestion() {
		return question;
	}

	/**
	* Sets new value of question
	* @param
	*/
	public void setQuestion(SecretQuestionBean question) {
		this.question = question;
	}

	/**
	* Returns value of secretAnswer
	* @return
	*/
	public String getSecretAnswer() {
		return secretAnswer;
	}

	/**
	* Sets new value of secretAnswer
	* @param
	*/
	public void setSecretAnswer(String secretAnswer) {
		this.secretAnswer = secretAnswer;
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
	* Returns value of iconPhotoPath
	* @return
	*/
	public String getIconPhotoPath() {
		return iconPhotoPath;
	}

	/**
	* Sets new value of iconPhotoPath
	* @param
	*/
	public void setIconPhotoPath(String iconPhotoPath) {
		this.iconPhotoPath = iconPhotoPath;
	}

	/**
	* Returns value of blog
	* @return
	*/
	public BlogBean getBlog() {
		return blog;
	}

	/**
	* Sets new value of blog
	* @param
	*/
	public void setBlog(BlogBean blog) {
		this.blog = blog;
	}
}
