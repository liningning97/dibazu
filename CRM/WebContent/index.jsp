<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js" ></script>
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js" ></script>
<script type="text/javascript" src="jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js" ></script>
<link rel="stylesheet" href="jquery-easyui-1.4.3/themes/default/easyui.css" />
<link rel="stylesheet" href="jquery-easyui-1.4.3/themes/icon.css" />
<script type="text/javascript">
   $(function(){
	   seachEmp();
   });
 //模糊查询
   function seachEmp(){
	   $("#tab").datagrid({
		   url:'selectAll',
		   method:'post',
		   pagination:true,
		   singleSelect:true,
		   queryParams:{
			   ename:$("#ename2").val(),
			   esex:$("#esex2").combobox("getValue"),
			   did:$("#did2").combobox("getValue"),
			   strEbirthday:$("#sebir2").val(),
			   endEbirthday:$("#eebir2").val()
		   }
	   });
   }
   //获取部门的数据
   function d(value,row,index){
	   return row.dept.dname;
   }
   function caozuo(value,row,index){
	   return "<a href='#' onclick='updateEmp("+index+")'>修改</a>  <a href='#' onclick='deleteEmp("+index+")'>删除</a>";
   }
   function deleteEmp(index){
	   var data=$("#tab").datagrid("getData");
	   var row=data.rows[index];
	   $.messager.confirm("提示","确定删除吗？",function(r){
		   if(r){
		   $.post(
					 "deleteEmp",
					 {
						 eid:row.eid
					 },function(res){
						 if(res>0){
							 $("#tab").datagrid("reload");
							 alert("删除成功");
						 }else{
							 alert("删除失败");
						 }
					 },'json'
				   );}
	   });
   }
   function updateEmp(index){
	   var data=$("#tab").datagrid("getData");
	   var row=data.rows[index];
	   $("#f").form("load",row);
	   $("#w").window("open");
   }
   function updateSave(){
	   var eid=$("#eid").val();
	   var ename=$("#ename1").val();
	   var eage=$("#eage1").val();
	   var esex=$("#esex1").combobox("getValue");
	   var did=$("#did1").combobox("getValue");
	   var ebirthday=$("#ebir1").val();
	   $.post(
		 "updateEmp",
		 {
			 eid:eid,
			 ename:ename,
			 eage:eage,
			 esex:esex,
			 ebirthday:ebirthday,
			 did:did 
		 },function(res){
			 if(res>0){
				 $("#w").window("close");
				 $("#tab").datagrid("reload");
				 alert("修改成功");
			 }else{
				 alert("修改失败");
			 }
		 },'json'
	   );
	   
   }
   function insertEmp() {
	   $("#win").window("open");
   }
   function insertSave(){
	   var ename=$("#ename").val();
	   var eage=$("#eage").val();
	   var esex=$("#esex").combobox("getValue");
	   var did=$("#did").combobox("getValue");
	   var ebirthday=$("#ebir").val();
	   $.post(
		 "insertEmp",
		 {
			 ename:ename,
			 eage:eage,
			 esex:esex,
			 ebirthday:ebirthday,
			 did:did 
		 },function(res){
			 if(res>0){
				 $("#win").window("close");
				 $("#tab").datagrid("reload");
				 alert("添加成功");
			 }else{
				 alert("添加失败");
			 }
		 },'json'
	   );
	   
   }
</script>
</head>
<body>
    <table id="tab" class="easyui-datagrid" data-options="fitColumns:true,singleSelect:true,toolbar:'#t'">   
    <thead>   
        <tr>   
            <th data-options="field:'eid',width:100">员工id</th>   
            <th data-options="field:'ename',width:100">员工姓名</th>   
            <th data-options="field:'esex',width:100">员工性别</th> 
            <th data-options="field:'eage',width:100">员工年龄</th>   
            <th data-options="field:'ebirthday',width:100">员工生日</th>   
            <th data-options="field:'d',width:100,formatter:d">部门名称</th>
            <th data-options="field:'caozuo',width:100,formatter:caozuo,align:'center'">操作</th>
        </tr>   
    </thead>   
</table>
<div id="t">
     员工姓名:<input class="easyui-textbox" id="ename2" name="ename" style="width:150px">
     员工性别: <select id="esex2" class="easyui-combobox" name="esex" style="width:150px;">   
					    <option value="">--请选择--</option>   
					    <option value="男">男</option>  
					    <option value="女">女</option>   
			</select> 
    员工生日:<input class="easyui-textbox" id="sebir2" name="strEbirthday" style="width:150px">-
          <input class="easyui-textbox" id="eebir2" name="endEbirthday" style="width:150px">
    部门名称:<select id="did2" class="easyui-combobox"  name="did" style="width:200px;">   
					    <option value="">--请选择--</option>  
					     <c:forEach items="${selectDepts}" var="dept">
					    	<option value="${dept.did}">${dept.dname}</option>  
					    </c:forEach> 
					</select> 
   <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-seach'" onclick="seachEmp()">搜索</a>
   <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="insertEmp()">添加</a>  
</div> 
<div id="win" class="easyui-window" title="添加数据" style="width:600px;height:400px"   
        data-options="closed:true,modal:true">  
	       <table>
	          <tr>
	             <td>员工姓名</td>
	             <td><input class="easyui-textbox" id="ename" name="ename" style="width:300px"></td>
	          </tr>
	          <tr>
	             <td>员工年龄</td>
	             <td><input class="easyui-textbox" id="eage" name="eage" style="width:300px"></td>
	          </tr>
	          <tr>
	             <td>员工性别</td>
	             <td>
	                <select id="esex" class="easyui-combobox" name="esex" style="width:200px;">   
					    <option value="">--请选择--</option>   
					    <option value="男">男</option>  
					    <option value="女">女</option>   
					</select> 
				 </td>
	          </tr>
	          <tr>
	             <td>员工生日</td>
	             <td><input class="easyui-textbox" id="ebir" name="ebirthday" style="width:300px"></td>
	          </tr>
	          <tr>
	             <td>部门名称</td>
	             <td>
	                 <select id="did" class="easyui-combobox" name="did" style="width:200px;">   
					    <option value="">--请选择--</option>  
					    <c:forEach items="${selectDepts}" var="dept">
					        <option value="${dept.did}">${dept.dname}</option>
					    </c:forEach> 
					</select> 
                 </td>
	          </tr>
	       </table>
	       <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="insertSave()">保存</a> 
	       <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no'" onclick="insertNo()">取消</a> 
</div> 
<div id="w" class="easyui-window" title="修改数据" style="width:600px;height:400px"   
        data-options="closed:true,modal:true">  
        <form id="f"> 
	       <table>
	          <input type="hidden" id="eid" name="eid"/>
	          <tr>
	             <td>员工姓名</td>
	             <td><input class="easyui-textbox" id="ename1" name="ename" style="width:300px"></td>
	          </tr>
	          <tr>
	             <td>员工年龄</td>
	             <td><input class="easyui-textbox" id="eage1" name="eage" style="width:300px"></td>
	          </tr>
	          <tr>
	             <td>员工性别</td>
	             <td>
	                <select id="esex1" class="easyui-combobox" name="esex" style="width:200px;">   
					    <option value="">--请选择--</option>   
					    <option value="男">男</option>  
					    <option value="女">女</option>   
					</select> 
				 </td>
	          </tr>
	          <tr>
	             <td>员工生日</td>
	             <td><input class="easyui-textbox" id="ebir1" name="ebirthday" style="width:300px"></td>
	          </tr>
	          <tr>
	             <td>部门名称</td>
	             <td>
	                 <select id="did1" class="easyui-combobox"  name="did" style="width:200px;">   
					    <option value="">--请选择--</option>  
					     <c:forEach items="${selectDepts}" var="dept">
					    	<option value="${dept.did}">${dept.dname}</option>  
					    </c:forEach> 
					</select> 
                 </td>
	          </tr>
	       </table>
	       <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="updateSave()">保存</a> 
	       <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-no'" onclick="updateNo()">取消</a> 
       </form>
</div> 
</body>
</html>