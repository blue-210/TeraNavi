package ttc.bean;
public class AdminBean implements Bean{
  private String adminId;
  private String loginId;
  private UserBean user;


	/**
	* Returns value of adminId
	* @return
	*/
	public String getAdminId() {
		return adminId;
	}

	/**
	* Sets new value of adminId
	* @param
	*/
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	/**
	* Returns value of loginId
	* @return
	*/
	public String getLoginId() {
		return loginId;
	}

	/**
	* Sets new value of loginId
	* @param
	*/
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	/**
	* Returns value of user
	* @return
	*/
	public UserBean getUser() {
		return user;
	}

	/**
	* Sets new value of user
	* @param
	*/
	public void setUser(UserBean user) {
		this.user = user;
	}
}
