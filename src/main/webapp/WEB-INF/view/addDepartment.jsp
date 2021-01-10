<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

<style>
    .error {color: #ff0f49;list-style-type: circle}
</style>




    <div class="container p-5">

        <h5 class="text-center">Departman Ekle</h5>
        <a class="float-right" href="/department/">Geri Dön</a>

        <form:form  id="form" method="post" action="/department/addDepartment" modelAttribute="department" >


            <div class="form-group">
                <label>Departman Adı</label>
                <form:input class="form-control" path="name"  placeholder="Departman Adı" id="name" />
                <form:errors path="name" cssClass="error" />
            </div>


            <button type="submit" class="btn btn-sm float-right btn-success">Kaydet</button>

        </form:form>




    </div>






</body>
</html>