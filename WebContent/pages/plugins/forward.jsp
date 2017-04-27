<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String msg =request.getParameter("msg");//提示信息
	String url =request.getParameter("url");
%>
<script type="text/javascript">
	
	window.onload=function(){
		goForward();
	}
	
	function goForward(){
		var spanObject =document.getElementById("countSpan");
		var count = parseInt(spanObject.innerHTML);	//取得当前计数的内容
		count--;
		if(count==0){// 进行跳转
			window.location="<%=url%>"; //跳转
		}else{
			spanObject.innerHTML=count;
			setTimeout(goForward,1000);
		}
		
	}
	
</script>

<div style="font-size: 50px;"><%=msg %></div>
<div style="font-size: 50px;"><span id="countSpan" style="color: red">3</span>秒后跳转到其他页面！！！</div>
<div style="font-size: 50px;">

<a href="<%=url%>" style="font-size: 50px">立即跳转到List页面</a>
</div>

