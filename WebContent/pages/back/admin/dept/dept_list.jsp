<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="cn.mldn.vo.Dept"%>
<%@page import="java.util.List"%>
<%@page import="cn.mldn.service.IDeptService"%>
<%@page import="cn.mldn.util.factory.Factory"%>
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
<title>部门管理</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<script type="text/javascript" src="js/common/mldn_util.js"></script>
<script type="text/javascript" src="js/back/admin/dept/dept_list.js"></script>
<script type="text/javascript" src="jquery/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
</head>

<%!
	public static final String DEPT_DELETE_DO_URL = "pages/back/admin/dept/dept_delete_do.jsp";
	public static final String DEPT_EDIT_URL = "pages/back/admin/dept/dept_edit.jsp";
%>
<script type="text/javascript">
	
	var delUrl ="<%=basePath%><%=DEPT_DELETE_DO_URL%>";
</script>

<%
	IDeptService deptService =Factory.getServiceInstance("dept.service");
	//List<Dept> all = deptService.list();
	Map<String,Object> map = deptService.listDetails();
	List<Dept> all = (List<Dept>)map.get("allDepts");
	Map<Integer,Map<String,Object>> stat =(Map<Integer,Map<String,Object>>)map.get("deptStats");
	
	Iterator<Dept> iter = all.iterator();
	
	
%>
<body>
	<div class="container">
		<div class="row">
			<div class="h1"><strong><span class="glyphicon glyphicon-th-list"></span>&nbsp;部门信息列表</strong></div>
		</div>
		<div class="row">
			<table class="table table-striped table-bordered table-hover">
				<tr>
					<td style="width:6%"><input type="checkbox" id="selectall"/>全选</td>
					<td>部门编号</td>
					<td>部门名称</td>
					<td>部门位置</td>
					<td>部门总人数</td>
					<td>平均工资</td>
					<td>最高工资</td>
					<td>最低工资</td>
					<td>平均服务年限</td>
					<td>操作</td>
				</tr>
				
			<%
				while(iter.hasNext()){
					Dept vo =iter.next();
					Map<String,Object> deptStat= stat.get(vo.getDeptno());
			%>
				<tr>
					<td><input type="checkbox" id="deptno" value="<%=vo.getDeptno()%>"/></td>
					<td><%=vo.getDeptno() %></td>
					<td><%=vo.getDname() %></td>
					<td><%=vo.getLoc() %></td>
					<td><%=deptStat==null?"":deptStat.get("count") %></td>
					<td><%=deptStat==null?"":deptStat.get("avg") %></td>
					<td><%=deptStat==null?"":deptStat.get("max") %></td>
					<td><%=deptStat==null?"":deptStat.get("min") %></td>
					<td><%=deptStat==null?"":deptStat.get("avgyear") %></td>
					<td ><a href="<%=DEPT_EDIT_URL%>?deptno=<%=vo.getDeptno() %>" class="btn btn-xs btn-info">
					<span class="glyphicon glyphicon-pencil"></span>&nbsp;编辑</a></td>
				</tr>		
			<%		
				}
			%>
				
				
			</table>
			<button id="deleteBtn" class="btn btn-danger btn-lg">
				<span class="glyphicon glyphicon-trash"></span>&nbsp;删除选中的信息
			</button>
		</div>
	</div>
</body>
</html>