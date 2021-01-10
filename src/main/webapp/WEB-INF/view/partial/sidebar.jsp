<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/dashbord.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" rel="stylesheet" type="text/css" />
</head>
<body>


<c:if test="${pageContext.request.userPrincipal.name == 'tolga@gmail.com' }">
    <nav class="col-md-2 d-none d-md-block sidebar" style="background-color:#0063ff">
        <div class="sidebar-sticky">
            <ul class="nav flex-column">

                <li class="nav-item text-white" style="margin-top: -10px">
                   <h5 class="text-center">İnsan Kaynakları Yönetim Sistemi</h5>
                    <hr style="  height: 2px;background-color: #ccc;border: none;">
                </li>


                <li class="nav-item">
                    <a class="nav-link text-white" href="/">
                        <i class="fa fa-home"></i>
                        Anasayfa
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-white" href="/user/employees">
                        <i class="fa fa-user"></i>
                        Çalışanlar
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/work/works">
                        <i class="fa fa-briefcase"></i>
                        Görevler
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/department/">
                        <i class="fa fa-layer-group"></i>
                        Departmanlar
                    </a>
                </li>
                <li class="nav-item">
                    <hr style="  height: 2px;background-color: #ccc;border: none;">
                    <a class="nav-link text-white" href="/logout">
                        <i class="text-danger fa fa-sign-out-alt"></i>
                        Çıkış Yap
                    </a>
                </li>

            </ul>
        </div>
    </nav>

</c:if>

<c:if test="${pageContext.request.userPrincipal.name != 'tolga@gmail.com'}">
    <nav class="col-md-2 d-none d-md-block sidebar" style="background-color:#0063ff">
        <div class="sidebar-sticky">
            <ul class="nav flex-column">


                <li class="nav-item text-white" style="margin-top: -10px">
                    <h5 class="text-center">İnsan Kaynakları Yönetim Sistemi</h5>
                    <hr style="  height: 2px;background-color: #ccc;border: none;">
                </li>

                <li class="nav-item">
                    <a class="nav-link text-white" href="/">
                        <i class="fa fa-home"></i>
                        Anasayfa
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/assignedworks">
                        <i class="fa fa-wrench"></i>
                        Atanan Görevler
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/completedworks">
                        <i class="fa fa-check"></i>
                        Biten Görevler
                    </a>
                </li>

                <li class="nav-item">
                    <hr style="  height: 2px;background-color: #ccc;border: none;">
                    <a class="nav-link text-white" href="/logout">
                        <i class="text-danger fa fa-sign-out-alt"></i>
                        Çıkış Yap
                    </a>
                </li>

            </ul>

        </div>
    </nav>
</c:if>

</body>
</html>