<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
    function back(){
    	 window.location.href="<%=path%>/doctorUser/doctor/right.jsp";
    }
    function edit(){	
    	 $('#name').attr("disabled",false);
    	  $('#sex').attr("disabled",false);
    	  $('#speciality').attr("disabled",false);
    	  $('#save').attr("disabled",false);
    }  
    function saveInfo(){
    	var name =document.getElementById('name').value;
  	    var sex =document.getElementById('sex').value;
  	  if(name==''){
		  alert("医生姓名不能为空");
		  return false;
	  }
	  if(!(sex=='男'||sex=='女')){
		  alert("医生性别格式不正确");
		  return false;
	  }
	  return true;
    }
   </script>
</head>

<body>
	<div style="float: left;">
		<form action="editDoctorInfo.action" method="post" id="form1" onsubmit="return saveInfo();">
		<div style="margin-left: 15px;">
			<font color=#65C0EE size=5><s:property
					value="doctor.hospital.name" />&nbsp;
		       <s:property value="doctor.department.name"/></font> <br>
				<font color=#818181 size=4>医生名字：</font> <input type="text"
					value="<s:property value="doctor.name"/>" id="name" name="name"
					style="width: 200px; height: 25px; border-radius: 5px; color: #EF972B; font-size: 15px;"
					disabled="true"><br> 
				 <font color=#818181 size=4>医生性别：</font>
				<input type="text" value="<s:property value="doctor.sex"/>"
					name="sex" id="sex"
					style="width: 200px; height: 25px; border-radius: 5px; color: #EF972B;  font-size: 15px;"
					disabled="true"><br> 				
				<font color=#818181 size=4>医生专长/简介：</font> <br>
				<textArea type="text" id="speciality" name="speciality"
					style="color: #EF972B; font-size: 15px;overflow-x:hidden;overflow-y:hidden; margin-top: 5px; width: 290px; height: 150px; border-radius: 5px;"
					disabled="true"><s:property value="doctor.speciality" />
		   </textArea><br>
				<input type="hidden" name="hospitalId"
					value="<s:property value="doctor.hospital.hospitalId"/>" />
					<input type="hidden" name="doctorId"
					value="<s:property value="doctor.doctorId"/>"  />
					<font color=red><s:property value="updateDoctorTip"/></font>
					
		</div>
		<div>
			<input type="button" value="编辑" onclick="edit();"
				style="background: #F7B52C; width: 40; height: 30; margin-left: 15px; margin-top: 10px; font-weight: bolder; font-size: 15px; border: 3px solid #0090DB; height: 30px; width: 100; position: absolute; background: #0090DB; color: #FFEDF1;"
				onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';" /> <input
				type="submit" value="保存" id="save" 
				style="background: #F7B52C; width: 40; height: 30; margin-left: 110px; margin-top: 10px; font-weight: bolder; font-size: 15px; border: 3px solid #0090DB; height: 30px; width: 100; position: absolute; background: #0090DB; color: #FFEDF1;"
				onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';" disabled="true"/> <input
				type="button" value="返回"
				onclick="back();"
				style="background: #F7B52C; width: 40; height: 30; margin-left: 210px; margin-top: 10px; font-weight: bolder; font-size: 15px; border: 3px solid #0090DB; height: 30px; width: 100; position: absolute; background: #0090DB; color: #FFEDF1;"
				onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';" />
				
		</div>
		</form>
			</div>
		
		<div style="color:red;display:none;" id="deptIDName">
			<s:iterator value="departmentLists" id="dept" status="item">
			       <s:property value="#dept.name"/>-><s:property value="#dept.departmentId"/>&nbsp;
			</s:iterator>
			</div>
	
</body>
</html>
