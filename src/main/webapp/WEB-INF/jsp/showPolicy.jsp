<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>プライバシーポリシー</title>
    <!-- Latest compiled and minified CSS -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/TeraNavi/css/policy.css" rel="stylesheet" type="text/css">

</head>
<body class="hidden-md" data-spy="scroll">
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <jsp:include page="/WEB-INF/jsp/header.jsp"/>

	
	<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-10 col-md-offset-1">
			<h1>プライバシーポリシー最新版</h1>
          </div>
        </div>
      </div>
    </div>
	
	
	<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-md-offset-1">
            <div id="main">
				<h1>少々お待ちください</h1>
		   </div>
          </div>
          <div class="col-md-2">
            <div id="list">
				<ul>
				</ul>
		   </div>
          </div>
        </div>
      </div>
    </div>
	
	
    <jsp:include page="/WEB-INF/jsp/footer.jsp"/>

	<script>
		var ajaxSettings;
		var ajax;
		
		var nowId;
		
		$(function(){

			ajaxSettings = {
				type:'post',
				url:'/TeraNavi/front/TermsDisplay',
				dataType:'json',
				data:null
			};
			
			loadPolicy();

		});

		function loadPolicy(){

			ajaxSettings.data = {
				ajax:"true",
				target:"policy"
			};
			
			ajaxSettings.success = function(data){
					
					var main = $("#main");
					var list = $("#list ul");
					
					main.empty();
					list.empty();
		
					
					main.append("<p>"+data.main.date+"</p>");
					main.append("<p>"+data.main.body+"</p>");

					list.append("<h1>リスト</h1>");
					for(var i = 0;i < data.list.length;i++){
						var date = data.list[i].date.slice(0,10);
						list.append("<li><a onclick='loadPolicyId(\""+data.list[i].id+"\")'>"+date+"</a></li>");

					}
					
					$("#list ul li:first").css("border-style","groove");
				}

			ajax = $.ajax(ajaxSettings);
			
		}
		
		function loadPolicyId(id){


			nowId = id;
			ajaxSettings.data = {
				ajax:"true",
				target:"policy",
				id:id,
				where:" WHERE policy_id = ?"
			};
			
			ajaxSettings.success = function(data){
					
					var main = $("#main");
					var list = $("#list ul");
					
					main.empty();
					list.empty();
		
					
					main.append("<p>"+data.main.date+"</p>");
					main.append("<p>"+data.main.body+"</p>");

					list.append("<h1>リスト</h1>");
					for(var i = 0;i < data.list.length;i++){
						
						var date = data.list[i].date.slice(0,10);
						list.append("<li><a onclick='loadPolicyId(\""+data.list[i].id+"\")'>"+date+"</a></li>");
						if(data.list[i].id==nowId){
							$("#list ul li:last").css("border-style","groove");
						}
						
					}
				}
			
			ajax = $.ajax(ajaxSettings);
		}

	</script>

</body>
</html>
