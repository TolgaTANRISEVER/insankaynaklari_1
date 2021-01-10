<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/dashbord.css">
</head>
<body>


<div class="container-fluid">
    <div class="row">
        <jsp:include page="partial/sidebar.jsp">
            <jsp:param name="title" value="Main title" />
        </jsp:include>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

            <h5 class="p-3">${user.name} ${user.surname} 'in  Görevleri </h5>

            <div class="row">
                <div class="col-md-12">
                    <table class="table ">
                        <thead class="thead-dark">
                        <tr>
                            <th>Görev Başlığı</th>
                            <th>Görev Tanımı</th>
                            <th>Görev Durumu</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${user.works}" var="work">
                            <tr>
                                <td>${work.title}</td>
                                <td>${work.description}</td>
                                <td width="15%">
                                    <c:if test="${work.isCompleted == 1}">
                                        <span class="badge badge-success">Tamamlandı</span>
                                    </c:if>
                                    <c:if test="${work.isCompleted == 0}">
                                        <span class="badge badge-danger">Tamamlanmadı</span>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</div>



<jsp:include page="partial/footer.jsp">
    <jsp:param name="title" value="Main title" />
</jsp:include>

</body>
</html>