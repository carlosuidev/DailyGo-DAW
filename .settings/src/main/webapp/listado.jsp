<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tablas.Clientes"%>
<%@ page import="com.control.Controller"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Listado de clientes dailyGo</title>
</head>
<body>
	<div class="container mt-3">
		<h1>Listado de clientes</h1>
		<table class="table table-striped">
			<thead class="table-dark">
				<tr>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Teléfono</th>
					<th>Mail</th>
					<th>Contraseña</th>
				</tr>
			</thead>
			<tbody>
				<%
				LinkedList<Clientes> lista = Controller.getClientes();
				for (int i = 0; i < lista.size(); i++) {
					if (i % 2 == 0) {
						out.println("<tr class='table-primary'>");
					} else {
						out.println("<tr class='table-success'>");
					}
					out.println("<td>" + lista.get(i).getNom_cli() + "</td>");
					out.println("<td>" + lista.get(i).getApe_cli() + "</td>");
					out.println("<td>" + lista.get(i).getTlf_cli() + "</td>");
					out.println("<td>" + lista.get(i).getMail_cli() + "</td>");
					out.println("<td>" + lista.get(i).getPsw_cli() + "</td>");
					out.println("</tr>");
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>