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
<script type="text/javascript" src="jquery/jquery.min.js"></script>
<script type="text/javascript" src="js/back/admin/dept/dept_add.js"></script>
<script type="text/javascript" src="js/common/mldn_util.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
</head>
<%!
	private static final String DEPT_ADD_DO_URL="pages/back/admin/dept/dept_add_do.jsp";
	private static final String DEPT_LIST_URL="pages/back/admin/dept/dept_list.jsp";
%>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<form action="<%=DEPT_ADD_DO_URL %>" method="post" class="form-horizontal" id="deptForm">
					<fieldset>
						<legend>
							<label>增加新部门</label>
						</legend>
						<div class="form-group" id="deptnoDiv">
							<label class="col-md-2 control-label" for="deptno">部门编号：</label>
							<div class="col-md-5">
								<input type="text" id="deptno" name="deptno"
									class="form-control input-sm">
							</div>
							<span class="col-md-5" id="deptnoSpan">*</span>
						</div>
						<div class="form-group" id="dnameDiv">
							<label class="col-md-2 control-label" for="dname">部门名称：</label>
							<div class="col-md-5">
								<input type="text" id="dname" name="dname" class="form-control">
							</div>
							<span class="col-md-5" id="dnameSpan">*</span>
						</div>
						<div class="form-group" id="locDiv">
							<label class="col-md-2 control-label" for="loc">部门位置：</label>
							<div class="col-md-5">
								<input type="text" id="loc" name="loc" class="form-control">
							</div>
							<span class="col-md-5" id="locSpan">*</span>
						</div>
						<div class="form-group">
							<div class="col-md-3 col-md-offset-3">
								<input type="submit" value="提交" class="btn btn-primary">
								<input type="reset" value="重置" class="btn btn-warning">
								<a href="<%=DEPT_LIST_URL%>" class="btn btn-link">查看部门信息</a>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>