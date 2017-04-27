window.onload = function() {
	listener("selectall","click",function(){
		checkboxSelectAll("selectall","deptno");
	}) ;
	
	listener("deleteBtn","click",function(){
	
		handleDelete("deptno",delUrl);
		
	});
	
}
function validateDeptno() {
	return validateRegex("deptno",/\d{1,3}/) ;
}
function validateDname() {
	return validateEmpty("dname") ;
}
function validateLoc() {
	return validateEmpty("loc") ;
}