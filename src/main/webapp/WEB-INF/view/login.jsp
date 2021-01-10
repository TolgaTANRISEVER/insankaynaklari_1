<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/resources/css/login.css">
    <title>Login</title>
</head>
<body  class="text-center">



          <div class="container">
              <c:if test="${param.error != null}">
                  <p class="text-danger text-center"> Hatalı şifre veya mail adresi .</p>
              </c:if>


              <form:form id="form" class="form-signin" method="post" action="/loginUser"  >

                  <img class="mb-4" src="/resources/img/bnner.png" alt="" width="72" height="72">

                  <h1 class="h3 mb-3 font-weight-normal">Giriş Yap</h1>
                  <div class="form-group">
                      <input type="text" name="email" placeholder="email" class="form-control">
                  </div>

                  <div class="form-group">
                      <input type="password" name="password" placeholder="password" class="form-control" >
                  </div>

                  <button type="submit" class="btn btn-lg btn-primary btn-block">Login</button>

              </form:form>

          </div>










</body>
</html>