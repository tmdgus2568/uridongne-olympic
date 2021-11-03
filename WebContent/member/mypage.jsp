<%@page import="member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	$(function() {
		$('#user_state').val("${member.getUser_state() }").prop("selected",
				true);
	});
	
	$(function() {

		   var strData = "${member.getUser_interest() }";
		   var arrInterest = strData.split(", ");
		   
		   console.log(arrInterest[0]);

		    $('.user_interest').prop('checked', false); // �ϴ� ��� uncheck

		    for (var nArrCnt in arrInterest) {

		                    $("input[name=user_interest][value="+arrInterest[nArrCnt]+"]").prop("checked",true);

		    }    

		});
	
</script>
</head>
<body>
	
	<table>
		<tr>
			<td>���̵�</td>
			<td><input type="text" id="user_id" name="user_id"
				value="${member.getUser_id() }"></td>
			<td>
		</tr>
		<tr>
			<td>�̸�</td>
			<td><input type="password" id="user_name" name="user_name"
				value="${member.getUser_name() }"></td>
		</tr>
		<tr>
			<td>�������</td>
			<td><input type="text" id="date" name="date"
				value="${member.getUser_birth() }"></td>
		</tr>
		<tr>
			<td>�̸���</td>
			<td><input type="text" id="email" name="email"
				value="${member.getUser_email() }"></td>
		</tr>
		<tr>
			<td>��ȭ��ȣ</td>
			<td><input type="text" id="user_phone" name="user_phone"
				value="${member.getUser_phone() }"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" id="user_city" name="user_city"
				value="����Ư����" readonly="readonly"></td>
		</tr>
		<tr>
			<td>��</td>
			<td><select id="user_state" name="user_state">
					<option value="������">������</option>
					<option value="������">������</option>
					<option value="���ϱ�">���ϱ�</option>
					<option value="������">������</option>
					<option value="���Ǳ�">���Ǳ�</option>
					<option value="���Ǳ�">���Ǳ�</option>
					<option value="���α�">���α�</option>
					<option value="��õ��">��õ��</option>
					<option value="�����">�����</option>
					<option value="������">������</option>
					<option value="���빮��">���빮��</option>
					<option value="���۱�">���۱�</option>
					<option value="������">������</option>
					<option value="���빮��">���빮��</option>
					<option value="���ʱ�">���ʱ�</option>
					<option value="������">������</option>
					<option value="���ϱ�">���ϱ�</option>
					<option value="���ı�">���ı�</option>
					<option value="��õ��">��õ��</option>
					<option value="��������">��������</option>
					<option value="��걸">��걸</option>
					<option value="����">����</option>
					<option value="���α�">���α�</option>
					<option value="�߱�">�߱�</option>
					<option value="�߶���">�߶���</option>
			</select></td>
		</tr>
		<tr>
			<td>���� ����</td>
			<td><input type="checkbox" name="user_interest" id="��" value="��">��
				<input type="checkbox" name="user_interest" value="�豸">�豸 <input
				type="checkbox" name="user_interest" value="������">������ <input
				type="checkbox" name="user_interest" value="�߱�">�߱� <br>
				<input type="checkbox" name="user_interest" value="����">���� <input
				type="checkbox" name="user_interest" value="�౸">�౸ <input
				type="checkbox" name="user_interest" value="Ź��">Ź�� <input
				type="checkbox" name="user_interest" value="�״Ͻ�">�״Ͻ� <input
				type="checkbox" name="user_interest" value="ǲ��">ǲ��</td>
			<td>${member.getUser_interest() }</td>
		</tr>
	</table>
</body>
</html>