<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>



<div class="container p-5">

    <h5 class="text-center">Çalışan Güncelle</h5>
    <a class="float-right" href="/user/employees">Geri Dön</a>

    <form:form id="form" method="post" action="/user/updateEmployee/${user.id}" modelAttribute="user" >

        <div class="form-group">
            <label for="name">Name</label>
            <form:input class="form-control" path="name"  placeholder="Name" id="name" />
            <form:errors path="name"  cssClass="error"/>
        </div>

        <div class="form-group">
            <label for="surname">Surname</label>
            <form:input class="form-control" path="surname" placeholder="Surname" id="surname" />
            <form:errors path="surname" cssClass="error"/>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <form:input class="form-control" path="email"  placeholder="email" id="email" />
            <form:errors path="email" cssClass="error"/>
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <form:input class="form-control" path="phone" placeholder="phone" id="phone" />
            <form:errors path="phone" cssClass="error" />
        </div>

        <div class="form-group">
            <label>Departman</label>
            <form:select class="form-control" path="department" action = "select">
                <c:forEach items="${departments}" var="deps">
                    <form:option value="${deps.id}" label="${deps.name}"/>
                </c:forEach>
            </form:select>
        </div>

        <button type="submit" class="btn btn-success float-right">Kaydet</button>

    </form:form>


</div>







</body>
</html>