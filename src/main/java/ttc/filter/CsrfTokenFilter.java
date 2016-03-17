package ttc.filter;

import java.io.IOException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.FilterConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.Filter;
import javax.servlet.FilterChain;


public class CsrfTokenFilter implements Filter{
  public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain){
    try{


           // セッションが存在しない場合NULLを返す
           HttpSession session = ((HttpServletRequest)req).getSession();
		   String token = null;
		   String paramToken = null;

		   try{
				//パラメータからトークンを取得する際にトークンがないと
				//ぬるぽが出る気がするのでtry-catchをつけてます。なくてもいいかも
				token = (String)session.getAttribute("token");
				paramToken = req.getParameter("token");

                System.out.println("token="+token+"  paramToken="+paramToken);

               if(token.equals(paramToken)){
                   // session内のトークンとパラメータとして送られてきたトークンを比較
    			   //トークンが一致したときのみ正しい送り先へrequestを跳ばす
                   chain.doFilter(req, res);
               }else{

                   RequestDispatcher dispatcher = req.getRequestDispatcher("/index");
                   dispatcher.forward(req,res);
               }
           }catch(NullPointerException e){
               //パラメータが無かった場合の処理
               RequestDispatcher dispatcher = req.getRequestDispatcher("/index");
               dispatcher.forward(req,res);
           }


    }catch (ServletException se){
    }catch (IOException e){
    }

  }
  public void init(FilterConfig config) throws ServletException{}
  public void destroy(){}
}
