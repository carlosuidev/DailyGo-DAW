
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tablas.Productos"%>
<%@ page import="com.control.Controller"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="com.tablas.Clientes"%>
<%@ page import="com.tablas.Pedidos"%>
<%@ page import="com.tablas.Ventas"%>
<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/tienda.css">
<link rel="stylesheet" href="styles.css">
<title>DailyGo | Pedidos rápidos a domicilio</title>
<link rel="shortcut icon" href="svg/Favicon.ico" type="image/x-icon">
</head>

<body>
	<%
	HttpSession misesionComprobar = request.getSession();
	Clientes cliente = (Clientes) misesionComprobar.getAttribute("emailIU");
	if (cliente == null) {
		response.sendRedirect("iniciar_sesion_u.html");
	}
	%>
	<!-- NAVBAR -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light shadow-sm fixed-top ps-5 pe-5">
		<div class="container-fluid p-2">
			<a href="inicio_u.jsp" class="navbar-brand"> <img
				src="svg/Logotype.svg" alt="DailyGO" />
			</a>
			<button type="button" class="navbar-toggler"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav">
					<a href="tienda_u.jsp" class="nav-item nav-link">Tienda</a> <a
						href="seguimientoPedido.jsp" class="nav-item nav-link">Pedidos</a>
					<a href="contacto_u.jsp" class="nav-item nav-link">Contacto</a>
				</div>
				<div class="navbar-nav ms-auto">
					<a href="carritoCompra_u.jsp" class="nav-item nav-link"> <img
						src="svg/Carrito_Navbar.svg" alt="">
					</a> <a href="perfil_u.jsp" class="nav-item nav-link"> <img
						src="svg/User_Icon_Navbar.svg" alt="">
					</a>
				</div>
			</div>
		</div>
	</nav>

	<!--Empiece de la section del body-->
	<section class="ms-5 min-vh-100 mt-5"
		style="margin-top: 100px !important">
		<h3 class="mt-5 ">Pedidos en curso</h3>
		<hr>
		<div class="row m-5">
				<%
				LinkedList<Pedidos> lista = new LinkedList<Pedidos>();
				LinkedList<Ventas> listaVentas = new LinkedList<Ventas>();
				listaVentas = Controller.getVentas((Controller.getCodCliente(cliente.getMail_cli())));
				try {
					for (int i = 0; i < listaVentas.size(); i++) {

						if (!listaVentas.get(i).getEstado_ven().equals("Entregado")) {

					lista = Controller.getPedidos(listaVentas.get(i).getCod_cli_ven());

					out.print("<form class ='col-lg-5 col-md-5 col-sm-12 border rounded p-5 mb-5 me-5 shadow-sm'>");
					out.print("<h5>Nº Pedido " + listaVentas.get(i).getCod_cli_ven() + "</h5>");
					out.print("<div class='d-flex'>");
					out.print("<p class='me-5'><b>Repartidor: </b>" + listaVentas.get(i).getDNI_rid_ven() + "</p>");
					out.print("<p class='ms-3'><b>Estado: </b><span class='text-success'>" + listaVentas.get(i).getEstado_ven()
							+ "</span></p>");
					out.print("</div>");
					out.print("<div class='table-responsive'>");
					out.print(" <table class='table-white'>");
					out.print("<tbody>");

					for (int j = 0; j < lista.size(); j++) {
						out.print("<tr>");
						out.print(
								"<th scope='row' class='p-2 me-5'><div class='border rounded d-flex justify-content-center' style='height:128px; width: 128px;'><img class='w-100' style='object-fit:cover;' src='"
										+ lista.get(j).getImg_prod_ped() + "'></div></th>");
						out.print("<td class='ps-2 pe-5 font-weight-bold'>" + lista.get(j).getNom_prod_ped() + "</td>");
						out.print("<td class='pe-5'>" + lista.get(j).getCant_ped() + " ud.</td>");
						out.print("</tr>");
					}
					out.print("</tbody>");
					out.print("</table>");
					out.print("</div>");
					if (listaVentas.get(i).getEstado_ven().equals("En reparto")) {
						out.print("<button type='submit' class='mt-4 btn btn-secondary w-100'>CONFIRMAR RECEPCIÓN</button>");
					}
					out.print("</form>");
						}
					}
				} catch (Exception e) {
					response.sendRedirect("inicio_u.jsp");
				}
				%>

		</div>

	</section>
	<!--Fin de la section del body-->

	<!--FOOTER-->
	<div>
		<footer class="bg-secondary text-center text-lg-start text-white">
			<div class="container p-3">
				<div class="row my-5 container-fluid mx-auto">
					<div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-3">
						<div
							class="shadow-1-strong d-flex align-items-center justify-content-center mb-4 mx-auto">
							<img src="svg/LOGOfooter.svg" height="40" alt="" loading="lazy" />
						</div>
						<p class="text-center small mb-4">
							Puedes seguirnos en el Twitter <br> de Carlos Almendros y en
							el <br> Instagram de Ignacio Gil
						</p>
						<ul class="list-unstyled d-flex flex-row justify-content-center">
							<li><a class="text-white px-2"
								href="https://www.twitter.com/design_c2a" target="_blank"> <img
									src="svg/twitter.svg"></img>
							</a></li>
							<li><a class="text-white px-2"
								href="https://www.instagram.com/arrobaladygaga" target="_blank">
									<img src="svg/instagram.svg"></img>
							</a></li>
						</ul>
					</div>
					<div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-4 ps-5">
						<h5 class="text-uppercase mb-4">De interés</h5>
						<ul class="list-unstyled">
							<li class="mb-2"><a href="inicio_u.jsp"
								class="text-white  text-decoration-none">Inicio</a></li>
							<li class="mb-2"><a href="tienda_u.jsp"
								class="text-white text-decoration-none">Tienda</a></li>
							<li class="mb-2"><a href="contacto_u.jsp"
								class="text-white text-decoration-none">Contacto</a></li>
							<li class="mb-2"><a href="sobre_nosotros.html"
								class="text-white text-decoration-none" target="_blank">Sobre
									nosotros</a></li>
						</ul>
					</div>
					<div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-4">
						<h5 class="text-uppercase mb-4">Servicios</h5>
						<ul class="list-unstyled">
							<li class="mb-2"><a href="#"
								class="text-white text-decoration-none">Pedidos</a></li>
							<li class="mb-2"><a href="#"
								class="text-white text-decoration-none">Riders</a></li>
							<li class="mb-2"><a href="#"
								class="text-white text-decoration-none">Venta de productos</a></li>
						</ul>
					</div>
					<div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-4">
						<h5 class="text-uppercase mb-4">Información</h5>

						<ul class="list-unstyled">
							<li class="mb-2"><a href="privacidad.html"
								class="text-white text-decoration-none" target="_blank">
									Politica de privacidad</a></li>
							<li class="mb-2"><a href="condiciones.html"
								class="text-white text-decoration-none" target="_blank">
									Condiciones de uso</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="text-center p-3"
				style="background-color: rgba(0, 0, 0, 0.2)">© 2022 DailyGo
				S.A.</div>
		</footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
		
	</script>
</body>

</html>