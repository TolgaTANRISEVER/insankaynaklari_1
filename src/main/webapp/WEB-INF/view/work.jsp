<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

            <h5 class="text-center">Görevler</h5>
            <a href="/work/addWork" class="btn btn-success btn-sm mb-2">Görev Oluştur</a>

            <div class="row">
                <div class="col-md-12">
                    <table class="table table-striped">
                        <thead >
                        <tr>
                            <th>Görev Başlığı</th>
                            <th>Görev Tanımı</th>
                            <th>Görev Durumu</th>
                            <th>Oluşturulma Tarihi</th>
                            <th>Bitiş Tarihi</th>
                            <th>Çalışan Adı Soyadı</th>
                            <th>Çalışan Departmanı</th>
                            <th>İşlem</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${works}" var="work">
                            <tr>
                                <td>${work.title}</td>
                                <td>${work.description}</td>
                                <td>
                                    <c:if test="${work.isCompleted == 0}">
                                        <span class="badge badge-danger">Tamamlanmadı</span>
                                    </c:if>
                                    <c:if test="${work.isCompleted == 1}">
                                        <span class="badge badge-success">Tamamlandı</span>
                                    </c:if>

                                </td>
                                <td><fmt:formatDate type="both" value="${work.createdDate}" /></td>
                                <td><c:if test="${work.completedDate != null}">
                                    <fmt:formatDate type="both" value="${work.completedDate}" />
                                </c:if>
                                    <c:if test="${work.completedDate == null}">
                                        <span class="badge badge-danger">Tamamlanmadı</span>
                                </c:if>
                                </td>
                                <td>${work.user.name} ${work.user.surname}</td>
                                <td>${work.user.department.name}</td>
                                <td>
                                    <c:if test="${work.user == null}">
                                        <a href="/work/assignWork/${work.id}" class="btn btn-success btn-sm text-left float-left">Personel Ata</a>
                                    </c:if>
                                    <c:if test="${work.user != null}">
                                        <a class="btn btn-info btn-sm text-left float-left">DOLU</a>
                                    </c:if>
                                    <a href="/work/deleteWork/${work.id}" class="btn btn-danger btn-sm text-left float-left">Sil</a>
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