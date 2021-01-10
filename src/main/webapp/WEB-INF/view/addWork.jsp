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

<style>
    .error {color: #ff0f49;list-style-type: circle}
</style>


            <div class="container p-5">
                <h5 class="text-center">Görev Ekle</h5>
                <a class="float-right" href="/work/works">Geri Dön</a>

                <form:form id="form" method="post" action="/work/addWork" modelAttribute="work" >

                    <div class="form-group">
                        <label>Başlık</label>
                        <form:input class="form-control" path="title"  placeholder="Görev Başlığı" id="title" />
                        <form:errors path="title" cssClass="error"/>
                    </div>

                    <div class="form-group">
                        <label>Açıklama</label>
                        <form:input class="form-control" path="description" placeholder="Görev Tanımı" id="description" />
                        <form:errors path="description" cssClass="error" />
                    </div>


                    <div class="form-group">
                        <label>Çalışanlar</label>
                        <form:select class="form-control" path="user" action = "select">
                            <form:option value="" label="Seçiniz"/>
                            <form:option value="" label="Daha Sonra Atama Yap"/>
                            <c:forEach items="${users}" var="usr">
                                <form:option value="${usr.id}" label="${usr.name} ${usr.surname} / ${usr.department.name}"/>
                            </c:forEach>
                        </form:select>
                    </div>

                    <button type="submit"  class="btn btn-success float-right">Kaydet</button>

                </form:form>

            </div>









</body>
</html>