<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="cn.mldn.util.factory.Factory"%>
<%@page import="cn.mldn.service.IDeptService"%>
<%@page import="cn.mldn.vo.Dept"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<%
	String basePath = request.getScheme() + "://" + 
		request.getServerName() + ":" + request.getServerPort() + 
		request.getContextPath() + "/" ;
	request.setAttribute("basePath",basePath) ;
%>
<base href="<%=basePath%>"/>
<%!
	private static final String DEPT_LIST_URL="pages/back/admin/dept/dept_list.jsp";
%>
<title>部门管理</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<script type="text/javascript" src="jquery/jquery.min.js"></script>
<script type="text/javascript" src="js/back/admin/dept/dept_add.js"></script>
<script type="text/javascript" src="js/common/mldn_util.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String ids =request.getParameter("ids");
		String [] result = ids.split(",");
		Set<Integer> setIds =new HashSet<Integer>();
		for(int x =0 ;x <result.length; x++){
			setIds.add(Integer.parseInt(result[x]));
		}
		
		IDeptService deptService =Factory.getServiceInstance("dept.service");
		String msg ="删除失败";
		 if(deptService.deleteBatch(setIds)){
			msg ="删除成功！";
		} 
	%>

<jsp:include page="/pages/plugins/forward.jsp">
	<jsp:param name="msg" value="<%=msg %>" />
	<jsp:param name="url" value="<%=DEPT_LIST_URL %>" />
</jsp:include>
</body>
</html>