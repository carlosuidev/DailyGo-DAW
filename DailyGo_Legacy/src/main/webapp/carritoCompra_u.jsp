<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tablas.Productos"%>
<%@ page import="com.control.Controller"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="com.tablas.Clientes"%>
<%@ page import="com.tablas.detalleVentas"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.math.RoundingMode"%>

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
	 	if (cliente == null){
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

	<section class="min-vh-100 mb-5">
		<div class="d-flex" style="margin-top: 100px !important">
			<a href="#" class="text-decoration-none ms-5 me-2">Carrito de
				compra</a> <a href="#"
				class="opacity-50 text-decoration-none ms-2 me-2 pe-none"
				aria-disabled="true" tabindex="-1">Datos de pago</a> <a href="#"
				class="opacity-50 text-decoration-none ms-2 me-2 pe-none"
				aria-disabled="true" tabindex="-1">Confirmación</a>
		</div>
		<div class="progress mt-4">
			<div class="progress-bar bg-warning" role="progressbar"
				aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
				style="width: 33.3%">
				<span class="sr-only"></span>
			</div>
		</div>
		<h3 class="ms-5 mt-5">Carrito de compra</h3>
		<hr class="mt-2 ms-5 me-5 opacity-100">
		<div class="container-fluid">
			<div class="row me-5 ">
				<div class="col-md-8 col-sm-12 table-responsive ps-5">
					<table class="mt-5 mb-5 table-stripped">
						<tbody>
							<%
                        if (Controller.hayVenta() == 0){
                        	out.print("<td style='text-align: center;'>COMIENZA A COMPRAR!</td>");
                        }else {
                        	LinkedList<detalleVentas> lista = new LinkedList<detalleVentas>();
                        	lista = Controller.getDetallesMostrar(Controller.hayVenta());
                        	double calculoTotal = 0;
                        	double precioTotal = 0;
                        	for(int i = 0; i<lista.size() ;i++){
                        		out.print("<tr>");
                        		out.print("<td class='p-2 ps-5'><div class='border d-flex justify-content-center' style='height:128px; width: 128px;'><img class='w-100 rounded-3' style='object-fit:cover;' src='"+lista.get(i).getImg_det()+"'/></div></td>");
                        		out.print("<td class='ps-5'>"+lista.get(i).getNombreProd_det()+"</td>");
                        		out.print("<td class='ps-5'>"+lista.get(i).getPrecio_u_det()+" €</td>");
                        		out.print("<td class='ps-5'>"+lista.get(i).getCantidadComprada()+" ud.</td>");
                        		out.print("<td class='ps-5'><img src='svg/Cerrar.svg' style='cursor: pointer;'></td>");
                        		out.print("</tr>");
                        		
                        		calculoTotal = calculoTotal +(lista.get(i).getPrecio_u_det()*lista.get(i).getCantidadComprada());
                        		BigDecimal bd = new BigDecimal(calculoTotal).setScale(2, RoundingMode.HALF_DOWN);
                        		precioTotal = bd.doubleValue();
                        	}
                        	precioTotal = precioTotal+2;
                        %>
						</tbody>
					</table>
				</div>
				<form action="pagoCompra_u.jsp" class="mx-auto col-md-4 col-sm-12 mt-4 ps-5">
					<div>
						<div
							class="mb-3 shadow border rounded me-4  p-4 my-auto">
							<div class="table-responsive">
								<h4 class="text-center mb-3">Resumen del pedido</h4>
								<table class="table table-borderless">
									<tbody>
										<tr>
											<th>Subtotal</th>
											<td>
												<% out.print(precioTotal-2+" €");%>
											</td>
										</tr>
										<tr>
											<th>Envio</th>
											<td>2€</td>
										</tr>
										<tr>
											<th>Descuento</th>
											<td>0€</td>
										</tr>
										<tr>
											<th>Total</th>
											<% out.print("<td name='precioFinal'>"+precioTotal+" €</td>");}%>
										</tr>
									</tbody>
								</table>
								<hr>

								<button type="submit"
									class="btn btn-sm btn-secondary w-100">REALIZAR
									PEDIDO</button>

							</div>
						</div>

					</div>
				</form>
			</div>
		</div>
		

	</section>

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