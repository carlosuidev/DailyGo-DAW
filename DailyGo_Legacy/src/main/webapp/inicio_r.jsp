<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tablas.Riders"%>
<%@ page import="com.control.Controller"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>DailyGo | Pedidos rápidos a domicilio</title>
<link rel="shortcut icon" href="svg/Favicon.ico" type="image/x-icon">
</head>
<!--TODO
1-PONER LAS IMAGENES RESTANTES
2-VER POSIBLES FALLOS-->

<body>
	<%
	HttpSession misesion = request.getSession();
	Riders rider = (Riders) misesion.getAttribute("emailIR");
	if (rider == null) {
		response.sendRedirect("iniciar_sesion_r.html");
	}
	%>
	<!-- NAVBAR -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light shadow-sm fixed-top ps-5 pe-5">
		<div class="container-fluid p-2">
			<a href="#" class="navbar-brand"> <img
				src="svg/Logotype.svg" alt="DailyGO" />
			</a>
			<button type="button" class="navbar-toggler"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">

				<div class="navbar-nav ms-auto">
					<a href="perfil_r.jsp" class="nav-item nav-link"> <img
						src="svg/bici_Rider_Negra.svg" alt="">
					</a>
				</div>
			</div>
		</div>
	</nav>

	<!--Pedidos para el Rider-->
	<div id="LandingU" class="p-5 min-vh-100"
		style="padding-top: 13vh !important;">
		<h2 class="text-primary mb-4">Pedido/s actual/es</h2>
		<hr>
		<section class="ms-5 min-vh-100 mt-5"
			style="margin-top: 50px !important">
			<div class="row">
				<div
					class="col-lg-5 col-md-12 col-xs-12 mb-5 shadow rounded p-5 h-100 me-5">
					<form>
						<h3>Detalles del pedido</h3>
						<h5>Nº Pedido 032135XLF</h5>

						<p>
							<b>Precio total:</b> 25,55€
						</p>
						<p>
							<b>Lugar de recogida:</b> Mc Donald's Puerta Real 141
						</p>
						<p>
							<b>Estado del reparto:</b><span class="text-success"> en
								preparación</span>
						</p>
						<div class="container shadow rounded p-4">
							<h5>Detalles del cliente</h5>
							<hr>
							<p>
								<b>Nombre del cliente:</b> Jose luis
							</p>
							<p>
								<b>Teléfono:</b> 677740729
							</p>
							<p>
								<b>Dirección:</b> Calle Maria del Carmen 7, primero
							</p>
							<p>
								<b>Comentarios:</b>
							</p>
						</div>
						<button type="submit" class="mt-4 btn btn-secondary w-100">CONFIRMAR
							ENTREGA</button>
					</form>
				</div>
				<div
					class="col-lg-5 col-md-12 col-xs-12 mb-5 shadow rounded p-5 h-100 me-5">
					<form>
						<h3>Detalles del pedido</h3>
						<h5>Nº Pedido 08542234ABC</h5>

						<p>
							<b>Precio total:</b> 12,55€
						</p>
						<p>
							<b>Lugar de recogida:</b> Mc Donald's Puerta Real 141
						</p>
						<p>
							<b>Estado del reparto:</b><span class="text-success"> de
								camino a entregar</span>
						</p>
						<div class="container shadow rounded p-4">
							<h5>Detalles del cliente</h5>
							<hr>
							<p>
								<b>Nombre del cliente:</b> Laura Pausini
							</p>
							<p>
								<b>Teléfono:</b> 66640759
							</p>
							<p>
								<b>Dirección:</b> Athos 12, primero izq
							</p>
							<p>
								<b>Comentarios:</b> El timbre no funciona, por favor llamar al
								tlf al llegar. Muchas gracias por su paciencia, que Dios le
								bendiga. Salomon 12:4
							</p>
						</div>
						<button type="submit" class="mt-4 btn btn-secondary w-100">CONFIRMAR
							ENTREGA</button>
					</form>
				</div>
				<div
					class="col-lg-5 col-md-12 col-xs-12 mb-5 shadow rounded p-5 h-100 me-5">
					<form>
						<h3>Detalles del pedido</h3>
						<h5>Nº Pedido 08542234ABC</h5>

						<p>
							<b>Precio total:</b> 12,55€
						</p>
						<p>
							<b>Lugar de recogida:</b> Mc Donald's Puerta Real 141
						</p>
						<p>
							<b>Estado del reparto:</b><span class="text-success"> de
								camino a entregar</span>
						</p>
						<div class="container shadow rounded p-4">
							<h5>Detalles del cliente</h5>
							<hr>
							<p>
								<b>Nombre del cliente:</b> Laura Pausini
							</p>
							<p>
								<b>Teléfono:</b> 66640759
							</p>
							<p>
								<b>Dirección:</b> Athos 12, primero izq
							</p>
							<p>
								<b>Comentarios:</b> El timbre no funciona, por favor llamar al
								tlf al llegar. Muchas gracias por su paciencia, que Dios le
								bendiga. Salomon 12:4
							</p>
						</div>
						<button type="submit" class="mt-4 btn btn-secondary w-100">CONFIRMAR
							ENTREGA</button>
					</form>
				</div>
			</div>

		</section>
	</div>
	<!--Fin de pedidos Rider-->

	<!--Empiece de relleno Rider-->
	<hr class=" border border-1 ms-5 me-5">
	<div class="container-fluid p-5 mb-5">
		<div class="row">
			<div class="col-lg-6">



				<img class="mb-5" src="svg/contactoRiderEmoticono.svg"
					alt="emoticonosvg">


				<h3 class="text-primary mb-4">¿Hay algun problema con la
					recogida? ¡Contacta con el restaurante!</h3>
				<p class="text-primary mb-4">Si tienes algun problema con el
					restaurante, llame e informales del problema.</p>
				<a
					href="https://www.google.com/search?client=opera&q=telefonos+restaurantes&sourceid=opera&ie=UTF-8&oe=UTF-8"
					target="_blank" class="btn btn-warning text-primary">LLAMAR <i
					class="fa-solid fa-arrow-right-long ms-3"></i></a>


			</div>
			<div class="col-lg-6">

				<img class="mb-5" src="svg/nominaRider.svg" alt="emoticonosvg">

				<h3 class="text-primary mb-4">¿Quieres ver el historial de
					nóminas? ¡Ahora es más sencillo!</h3>
				<p class="text-primary mb-4">Haciendo click en el botón de abajo
					podras ir a tu historial de nóminas</p>
				<a href="nominas.jsp" class="btn btn-warning text-primary">VER
					NÓMINAS<i class="fa-solid fa-arrow-right-long ms-3"></i>
				</a>
			</div>

		</div>
	</div>
	<!--Footer-->
	<div>
		<footer class="bg-secondary text-center text-lg-start text-white">
			<div class="container p-3">
				<div class="row my-5">
					<div class="col-lg-2 col-md-6 mb-4 mb-md-0 pt-3"></div>
					<div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-4 ps-5">
						<h5 class="text-uppercase mb-4">De interés</h5>
						<ul class="list-unstyled">
							<li class="mb-2"><a href="#"
								class="text-white  text-decoration-none">Inicio</a></li>
							<li class="mb-2"><a href="perfil_r.jsp"
								class="text-white text-decoration-none">Perfil</a></li>
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
