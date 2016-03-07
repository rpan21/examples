<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/css1.css">
<script type="text/javascript" src= "jslibs/jquery-1.12.1.js"></script> 
</head>
<body>
<%@include file="header.jsp" %>
	<div class="Location">
	Lab Code: <%=session.getAttribute("Location") %>
	</div>
<div class="menu">
		<%@include file="menu.jsp" %>
	</div>
	

<table>
		<tr>
			<td>OrderNumber</td>
			<td><input type= "text" id="odno"></td>
			<td>CollectionDate</td>
			<td><input type= "date" id="cdate"></td>
			<td>CollectionType</td>
			<td>
				Lab<input type= "radio" id= "collectionType" name= "type">
				Home<input type= "radio" id= "collectionType" name= "type">
			</td>
		</tr>
			<tr>
			<td>PatientCode</td>
			<td><input type= "text" id="pcode"></td>
			<td>PatientName</td>
			<td><input type= "text" id="pname"></td>
			<td>Age</td>
			<td><input type= "text" id="age"></td>
		</tr>
			<tr>
			<td>Hand Phone</td>
			<td><input type= "text" id="handphone"></td>
			<td>Email</td>
			<td><input type= "text" id="email"></td>
			<td>Gender</td>
			<td>
				Male<input type= "radio" id= "male" name= "gender">
				Female<input type= "radio" id= "female" name= "gender">
			</td>
		</tr>
			<tr>
			<td>DoctorCode</td>
			<td><input type= "text" id="dcode"></td>
			<td colspan= "2">DoctorName</td>
			<td colspan= "2"><input type= "text" id= "dname"></td>
		</tr>
	</table>
<h3 align="center">Test Details</h3>
<br>
<table class="doctors-list">
    
    <tr>
        <th>
            Test Code
        </th>
        <th>
            Test Name
        </th>
        <th>
            Amount
        </th>
    </tr>
    <tr>
        <td>
            <input type="text" name="TestCode" />
        </td>
        <td>
            <input type="text" name="TestName"/>
        </td>
        <td>
            <input type="text" name="Amount"/>
        </td>
    </tr>
</table>
<table>
<tr>
<th colspan="2">Total</th>
<td><input type="text" name="total">
</tr>
</table>
<a href="#" title="" class="add-doctor"><input type="button" value="Add Row" class="adder"></a>
	<br>
	<br>
	<br>
	<br>
	<footer>
	<%@include file="Footer.jsp" %>
	</footer>
</body>
<script type="text/javascript">
$(function(){
    var counter = 1;
    
    $('a.add-doctor').click(function(event){
        event.preventDefault();
        counter++;
        var newRow = $('<tr><td><input type="text" id="TestCode' +
            counter + '"/></td><td><input type="text" id="TestName' +
            counter + '"/></td><td><input type="text" id="Amount' +
            counter + '"/></td></tr>');
        alert();
        $('table.doctors-list').append(newRow);
    });
});

$(function(){ //Ready Handler
	
	$("#dcode").on('keyup',function(){
		var usrId = $(this).val();
		$.ajax({
			type: 'GET', 
            url: "data/doctor.json",
            dataType: "json",
            success: function(data) {
                var flag = false;
                /* var docArray  = $.parseJSON(data); */ 
                for (var i=0;i<data.length;++i) {
                	if(usrId == data[i].dcode) {
                		$("#dname").val(data[i].name);
                		flag = true;
                	}
                }
                if(!flag)
                	$("#dname").val("");
            }
		});
	});
	
});

$(function(){ //Ready Handler
	
	$("#odno").on('keyup',function(){
		var usrId = $(this).val();
		$.ajax({
			type: 'GET', 
            url: "data/order.json",
            dataType: "json",
            success: function(data) {
                var flag = false;
                /* var docArray  = $.parseJSON(data); */ 
                for (var i=0;i<data.length;++i) {
                	if(usrId == data[i].odno) {
                		$("#cdate").val(data[i].cdate);
                		flag = true;
                	}
                }
                if(!flag)
                	$("#cdate").val("");
            }
		});
	});
	
});


$(function(){ //Ready Handler
	
	$("#pcode").on('keyup',function(){
		var usrId = $(this).val();
		$.ajax({
			type: 'GET', 
            url: "data/patients.json",
            dataType: "json",
            success: function(data) {
                var flag = false;
                /* var docArray  = $.parseJSON(data); */ 
                for (var i=0;i<data.length;++i) {
                	if(usrId == data[i].pcode) {
                		$("#pname").val(data[i].pname);
                		$("#age").val(data[i].age);
                		$("#email").val(data[i].email);
                		$("#handphone").val(data[i].handphone);
                		flag = true;
                	}
                }
                if(!flag)
                	$("#cdate").val("");
            }
		});
	});
	
});

</script>



</html>