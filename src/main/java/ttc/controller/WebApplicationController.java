package ttc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import javax.servlet.http.HttpSession;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;
import ttc.context.WebRequestContext;
import ttc.context.WebResponseContext;
import ttc.command.AbstractCommand;
import ttc.util.CommandFactory;
import ttc.exception.PresentationException;

import com.google.gson.Gson;

import java.io.PrintWriter;
import java.util.Collection;

import ttc.bean.UserBean;
import ttc.bean.CommunityBean;

import java.util.Map;
import java.util.List;
import java.util.HashMap;
import java.util.ArrayList;

public class WebApplicationController implements ApplicationController{

	public RequestContext getRequest(Object request)throws PresentationException{

		RequestContext reqc = new WebRequestContext();

		reqc.setRequest(request);

		return reqc;
	}

	public ResponseContext handleRequest(RequestContext reqc)throws PresentationException{

		AbstractCommand command = CommandFactory.getCommand(reqc);
		command.init(reqc);

		ResponseContext resc = command.execute( new WebResponseContext() );

		return resc;
	}

	public void handleResponse(RequestContext reqc, ResponseContext resc)
        throws PresentationException
    {

		HttpServletRequest req = (HttpServletRequest) reqc.getRequest();
		HttpServletResponse res = (HttpServletResponse) resc.getResponse();

		req.setAttribute("result",resc.getResult());

		String path = reqc.getCommandPath();

		boolean flag = false;

		try{
			flag = req.getParameter("ajax").equals("true");
		}catch(Exception e){

		}

		if(flag){
			try{
				// 退会時と参加時にセッションの中身を書き換える
				if(path.equals("withDrawComm")){
					Map result = (Map)resc.getResult();
					HttpSession session = req.getSession(true);
					session.setAttribute("myCommunities",result.get("community"));

				}else if(path.equals("partiComm")){
					HttpSession session = req.getSession(true);

					Map result = (Map)resc.getResult();
					List communities = (List)session.getAttribute("myCommunities");
					communities.add(result.get("community"));
					session.setAttribute("myCommunities", communities);
				}else if(path.equals("deleteComm")){
					HttpSession session = req.getSession(true);
					Map result = (Map)resc.getResult();
					session.setAttribute("myCommunities", result.get("community"));
				}

				res.setContentType("application/json;charset=UTF-8");
				PrintWriter writer = res.getWriter();
				writer.print(new Gson().toJson(resc.getResult()));
			}catch(IOException e){
				throw new PresentationException((e.getMessage()), e);
			}
		}else{
			// 以下はsessionの中身を更新する必要があるコマンド群
			if(path.equals("login")){
				Map result = (Map)resc.getResult();
				HttpSession session = req.getSession(true);
				session.setAttribute("loginUser",result.get("user"));
				session.setAttribute("myCommunities",(Collection)result.get("community"));

			}else if(path.equals("createcomm")){

				HttpSession session = req.getSession(true);
				UserBean ub = (UserBean)resc.getResult();
				session.setAttribute("loginUser",ub);
				List communities = (List)session.getAttribute("myCommunities");
				communities.add(ub.getCommunity());
				session.setAttribute("myCommunities", communities);

			}else if(path.equals("signup")){
				HttpSession session = req.getSession(true);
				session.setAttribute("loginUser",resc.getResult());
				session.setAttribute("myCommunities",new ArrayList());
			}else if(path.equals("logout")||path.equals("withdraw")){
				HttpSession session = req.getSession(true);
				session.removeAttribute("loginUser");
				session.removeAttribute("myCommunities");
				session.invalidate();
			}else if(path.equals("blogCreate")){
				HttpSession session = req.getSession(true);
				UserBean user = (UserBean)session.getAttribute("loginUser");
				user.setBlogStatus("1");
				session.setAttribute("loginUser", user);

			}else if( path.equals("basic")) {
				HttpSession session = req.getSession(true);
				session.setAttribute("loginUser",resc.getResult());
			}else if(path.equals("mypage")){
//				マイページのロード時にセッションの中身をリフレッシュする

				HttpSession session = req.getSession(true);
				Map result = (HashMap)resc.getResult();
				Boolean loginFlag = (Boolean)result.get("loginFlag");

//				読み込むページがログインユーザ自身のページあった場合セッションをリフレッシュする
//				この判定を行わないと他人のマイページを見た際にそのユーザを乗っ取れてしまいます
				if(loginFlag){
					UserBean user = (UserBean)result.get("user");
					session.setAttribute("loginUser", user);
				}

			}else{
				req.setAttribute("result",resc.getResult());
			}

			RequestDispatcher rd = req.getRequestDispatcher(resc.getTarget());

			try{
				rd.forward(req,res);
			} catch(ServletException e){
				throw new PresentationException(e.getMessage(), e);
			} catch(IOException e){
				throw new PresentationException(e.getMessage(), e);
			}
		}
	}
}
