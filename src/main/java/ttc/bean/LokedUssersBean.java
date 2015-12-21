package ttc.bean;
public class LokedUsersBean implements Bean{
  private userBean user;
  private String lockPeriod;


	/**
	* Returns value of user
	* @return
	*/
	public userBean getUser() {
		return user;
	}

	/**
	* Sets new value of user
	* @param
	*/
	public void setUser(userBean user) {
		this.user = user;
	}

	/**
	* Returns value of lockPeriod
	* @return
	*/
	public String getLockPeriod() {
		return lockPeriod;
	}

	/**
	* Sets new value of lockPeriod
	* @param
	*/
	public void setLockPeriod(String lockPeriod) {
		this.lockPeriod = lockPeriod;
	}
}
