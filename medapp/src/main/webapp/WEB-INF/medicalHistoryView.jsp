<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!-- Me permite mostrar errores en las ediciones -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historial M�dico</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
        rel="stylesheet" />
</head>
<body class="bg-light">
    <div class="container-custom d-flex flex-column container-fluid">
        <div class="row justify-content-center m-5">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-body">
                        <h2 class="text-center mb-4">Historial M�dico de ${patient.firstName} ${patient.lastName}</h2>
                        <div class="mb-3 d-flex justify-content-center w-100 mt-2">
                            <table class="table table-bordered">
                                <thead>
                                    <tr class="custom-tr">
                                        <th>Fecha</th>
                                        <th>Especialidad</th>
                                        <th>Patolog�as</th>
                                        <th>Alergias</th>
                                        <th>Tratamientos</th>
                                        <th>Observaciones</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="content" items="${contents}">
                                        <tr>
                                            <td class="text-center">${content.date}</td> 
                                            <td class="text-center">${content.contentSpeciality.name}</td>       
                                            <td class="text-center">${content.familyHistory}</td>
                                            <td class="text-center">${content.allergies}</td>
                                            <td class="text-center">${content.treatment}</td>
                                            <td class="text-center">${content.observations}</td>
                                            <td class="text-center">
                                                <c:if test="${content.contentSpeciality.name == doctor.doctorSpeciality.name}">
													<form action="/doctor/medicalHistory/${patient.id}/edit/${content.id}" method="GET">
													    <input type="hidden" name="contentId" value="${content.id}">
													    <input type="submit" class="btn btn-custom btn-sm" value="Edit">
													</form>		
                                                    	
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="text-center">
                                <a href="/doctor" class="p-2 btn btn-custom mt-4">Volver</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
