package ttc.bean;
public class CommunityBean implements Bean{
  private String id;
  private String nanme;
  private String profile;
  private String iconPath;
  private String headPath;
  private String createDate;
  private ArrayList members;


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
	* Returns value of nanme
	* @return
	*/
	public String getNanme() {
		return nanme;
	}

	/**
	* Sets new value of nanme
	* @param
	*/
	public void setNanme(String nanme) {
		this.nanme = nanme;
	}

	/**
	* Returns value of profile
	* @return
	*/
	public String getProfile() {
		return profile;
	}

	/**
	* Sets new value of profile
	* @param
	*/
	public void setProfile(String profile) {
		this.profile = profile;
	}

	/**
	* Returns value of iconPath
	* @return
	*/
	public String getIconPath() {
		return iconPath;
	}

	/**
	* Sets new value of iconPath
	* @param
	*/
	public void setIconPath(String iconPath) {
		this.iconPath = iconPath;
	}

	/**
	* Returns value of headPath
	* @return
	*/
	public String getHeadPath() {
		return headPath;
	}

	/**
	* Sets new value of headPath
	* @param
	*/
	public void setHeadPath(String headPath) {
		this.headPath = headPath;
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
	* Returns value of members
	* @return
	*/
	public ArrayList getMembers() {
		return members;
	}

	/**
	* Sets new value of members
	* @param
	*/
	public void setMembers(ArrayList members) {
		this.members = members;
	}
}
