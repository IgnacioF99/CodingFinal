<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenidx!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link rel="stylesheet" href="/css/style.css" />
</head>

<body>
    <div class="container-fluid">
        <header class="d-flex justify-content-between align-items-center pb-0 pt-0 p-4">
            <img src="/img/logo2.png" alt="logoprincipal" class="logo p-2" />
            <span>Bienvenidx ${userInSession.firstName}!</span>
            <div>
                <a href="/logout" class="btn btn-custom">Cerrar Sesion</a>
                <a href="/patient/${userInSession.id}" class="p-4">
                    <img src="/img/profile.png" alt="Perfil" class="rounded-circle" width="50" height="50">
                </a>
            </div>
        </header>
        <main class="p-4">
            <div class="container">
                <h1 class="text-center mt-3">Agenda tu cita medica</h1>
                <form action="/patient/search" method="get">
                    <div class="form-group mt-5">
                        <label for="speciality" class="form-label">Selecciona una especialidad:</label>
                        <select id="speciality" name="speciality" class="form-select">
                            <option value="">Todas las especialidades</option>
                            <c:forEach items="${specialities}" var="speciality">
                                <option value="${speciality.id}">${speciality.name}</option>
                            </c:forEach>
                        </select>
                        <input type="submit" value="Buscar" class="btn btn-custom mt-4">
                    </div>
                </form>
                <c:if test="${noDoctorsFound}">
                    <div class="alert alert-danger mt-4">No se encontraron doctores con la especialidad
                        seleccionada.</div>
                </c:if>
            </div>
            <div class="container mt-5">
                <div class="row d-flex justify-content-center">
                    <c:forEach var="doctor" items="${doctors}">
                        <div class="col-md-4 mb-4 d-flex justify-content-center">
                            <div class="card doctor-card">
                                <div class="card-body">
                                    <h5 class="mb-3">${doctor.doctor.firstName}
                                        ${doctor.doctor.lastName}</h5>
                                    <p class="card-text mb-1"><span>Especialidad:</span>
                                        ${doctor.specialitiesDoctors}</p>
                                    <p class="card-text mb-1"><span>Matrícula:</span> ${doctor.license}
                                    </p>
                                    <p class="card-text mb-1"><span>Disponibilidad:</span>
                                        ${doctor.availability}</p>
                                    <p class="card-text mb-3"><span>Obra Social:</span>
                                        ${doctor.insurancesDoctor}</p>
                                    <a href="/patient/calendar/${doctor.id}" class="btn btn-custom d-block">Agendar</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </main>
        <footer class="text-center mt-auto">
            <p class="text-muted">&copy; 2024</p>
        </footer>
    </div>
</body>

</html>