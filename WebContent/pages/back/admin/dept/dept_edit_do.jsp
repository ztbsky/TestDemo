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
		Dept vo =new Dept();	
		vo.setDeptno(Integer.parseInt(request.getParameter("deptno")));
		vo.setDname(request.getParameter("dname"));
		vo.setLoc(request.getParameter("loc"));
		
		IDeptService deptService =Factory.getServiceInstance("dept.service");
		String msg ="修改失败";
		if(deptService.edit(vo)){
			msg ="修改成功！";
		}
	%>

<jsp:include page="/pages/plugins/forward.jsp">
	<jsp:param name="msg" value="<%=msg %>" />
	<jsp:param name="url" value="<%=DEPT_LIST_URL %>" />
</jsp:include>
</body>
</html>