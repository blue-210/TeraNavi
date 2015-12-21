package ttc.context;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ttc.bean.UserBean;
import ttc.exception.PresentationException;

public class WebRequestContext implements RequestContext{
	private Map parameters;
	private HttpServletRequest request;

	public WebRequestContext(){}

	public String getCommandPath(){
		String servletPath = request.getServletPath();

		String commandPath = servletPath.substring(1);

		return commandPath;
	}

	public String[] getParameter(String key){
		return (String[])parameters.get(key);
	}

	public Object getRequest(){
		return request;
	}

	public void setRequest(Object request)throws PresentationException{
		this.request = (HttpServletRequest) request;

		parameters = this.request.getParameterMap();

		//セッションからユーザーIDをパラメーターに代入する処理-------------
		HttpSession session = this.request.getSession();
		UserBean ub = (UserBean)session.getAttribute("userId");
		String[] userId = new String[1];
		try{
			userId[0] = ub.getId();
		}catch(NullPointerException e){
			throw new PresentationException(e.getMessage(), e);
		}
		parameters.put("userId", userId);
		//--------------------------------------------------------

	}
}
