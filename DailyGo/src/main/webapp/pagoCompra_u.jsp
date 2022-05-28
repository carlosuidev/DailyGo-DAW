<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tablas.Productos"%>
<%@ page import="com.control.Controller"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="com.tablas.Clientes"%>
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
	<!--Fin de la navbar de arriba-->

	<!--Empiece de la barra de progresión-->

	<div class="d-flex" style="margin-top: 100px !important">
		<a href="#" class="opacity-50 text-decoration-none ms-5 me-2 pe-none">Carrito
			de compra</a> <a href="#" class="text-decoration-none ms-2 me-2"
			aria-disabled="true" tabindex="-1">Datos de pago</a> <a href="#"
			class="opacity-50 text-decoration-none ms-2 me-2 pe-none"
			aria-disabled="true" tabindex="-1">Confirmación</a>
	</div>
	<div class="progress mt-4">
		<div class="progress-bar bg-warning" role="progressbar"
			aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
			style="width: 66.6%">
			<span class="sr-only"></span>
		</div>
	</div>
	<!--Fin progresión-->

	<!--Empiece de la section del body-->
	<section class="min-vh-100">
		<h3 class="ms-5 mt-5">Datos de pago y entrega</h3>
		<hr class="mt-2 ms-5 me-5 opacity-100">
<form action="ServletForm" method="POST" class="form">
		<div class="row w-100 ps-5 mt-5">
			<div class="col-md-7 col-sm-12">
				<div class="row">
					<div class="col-6">
						<label for="direccionEntrega" class="form-label">Dirección
							de la entrega</label> <input type="text" class="form-control"
							name="direccionEntrega" id="direccionEntrega" required>
					</div>
				</div>
				<div class="mb-3 mt-4 col-8">
					<label for="comentariosRider" class="form-label">Comentarios
						al Rider</label>
					<textarea name="comentariosRider" class="form-control"
						style="resize: none" id="comentariosRider" rows="6"></textarea>
				</div>
			</div>
			<hr class="mt-3 mb-3 opacity-25">

			<div class="row w-100">
				<div class="form-row align-items-center col-md-7 col-sm-12 mt-4 mb-5">
					
						<div class="col-12">
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">Número de tarjeta (16
										números)</div>
								</div>
								<input type="text" class="form-control" id="tarjeta"
									pattern="[0-9]{16}" required>
							</div>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">Caducidad (mm/yy)</div>
								</div>
								<input type="text" class="form-control" id="caducidad"
									pattern="^\d{2}/\d{2}$" required>

								<div class="input-group-prepend">
									<div class="input-group-text">Código de seguridad/CVV2</div>
								</div>
								<input type="text" class="form-control" id="cvv"
									pattern="[0-9]{3}" required>
							</div>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">Titular de la tarjeta</div>
								</div>
								<input type="text" class="form-control" id="titular"
									pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+" required>
								<div class="col-6"></div>
								<button type="submit" class="btn btn-secondary mt-5 w-50">PAGAR</button>
							</div>
					</form>
				</div>
			</div>
			<div class="col-md-4 col-sm-10 mt-3 ms-5">
				<img class="img-fluid" src="svg/pagoMetodos.svg"></img>
			</div>
		</div>

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