<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tablas.Proveedores"%>
<%@ page import="com.control.Controller"%>
<%@ page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="css/fondos.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>DailyGo | Pedidos rápidos a domicilio</title>
<link rel="shortcut icon" href="svg/Favicon.ico" type="image/x-icon">
</head>

<body>
	<%
	HttpSession misesion = request.getSession();
	Proveedores proveedor = (Proveedores) misesion.getAttribute("emailIP");
	if (proveedor == null) {
		response.sendRedirect("iniciar_sesion_p.html");
	}
	%>

	<!-- NAVBAR -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light shadow-sm fixed-top ps-5 pe-5">
		<div class="container-fluid p-2">
			<a href="inicio_p.jsp" class="navbar-brand"> <img
				src="svg/Logotype.svg" alt="DailyGO" />
			</a>
			<button type="button" class="navbar-toggler"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav ms-auto">
					<a href="productos_p.jsp" class="nav-item nav-link"> <img
						src="svg/TIenda_P.svg" alt="">
					</a> <a href="perfil_p.jsp" class="nav-item nav-link"> <img
						src="svg/User_Icon_Navbar.svg" alt="">
					</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="p-5 min-vh-100" style="padding-top: 125px !important;">
		<h2>Bienvenido a tu tienda</h2>
		<hr>
		<p class="mb-5">Estos son los pedidos diponibles:</p>

		<!--PEDIDO-->
		<div
			class="col-md-5 col-sm-12 bg-white border rounded p-4 w-100 mb-3 shadow-sm">
			<h5>12349</h5>
			<div class="d-flex flex-wrap">
				<p class="me-4">
					Pedido para: <span class="font-weight-bold">Clara González</span>
				</p>
				<p class="me-4">
					Entregar a: <span class="font-weight-bold">Julian López</span>
				</p>
				<p class="me-4">
					Estado: <span class="font-weight-bold text-success">En
						preparación</span>
				</p>
			</div>
			<div class="table-responsive mt-3">
				<table class="table table">
					<thead>
						<tr>
							<th>Producto</th>
							<th>Cantidad</th>
							<th>Precio ud.</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Menú Big Mac</td>
							<td>1</td>
							<td>2,00 €</td>
						</tr>
						<tr>
							<td>Patatas</td>
							<td>1</td>
							<td>1,00 €</td>
						</tr>
						<tr>
							<td>Sandy Chocolate</td>
							<td>2</td>
							<td>1,50 €</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="container-fluid mt-5">
				<div class="row">
					<div class="col-md-5 col-sm-12 me-5 mb-4">
						<a href="" class="btn btn-success w-100">LISTO</a>
					</div>
					<div class="col-md-6 col-sm-12">
						<h6>Notas:</h6>
						<p>Sin pepillos</p>
					</div>
				</div>
			</div>
		</div>

		<!--PEDIDO-->
		<div
			class="col-md-5 col-sm-12 bg-white border rounded p-4 w-100 mb-3 shadow-sm">
			<h5>12349</h5>
			<div class="d-flex flex-wrap">
				<p class="me-4">
					Pedido para: <span class="font-weight-bold">Clara González</span>
				</p>
				<p class="me-4">
					Entregar a: <span class="font-weight-bold">Julian López</span>
				</p>
				<p class="me-4">
					Estado: <span class="font-weight-bold text-success">En
						preparación</span>
				</p>
			</div>
			<div class="table-responsive mt-3">
				<table class="table table">
					<thead>
						<tr>
							<th>Producto</th>
							<th>Cantidad</th>
							<th>Precio ud.</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Menú Big Mac</td>
							<td>1</td>
							<td>2,00 €</td>
						</tr>
						<tr>
							<td>Patatas</td>
							<td>1</td>
							<td>1,00 €</td>
						</tr>
						<tr>
							<td>Sandy Chocolate</td>
							<td>2</td>
							<td>1,50 €</td>
						</tr>
					</tbody>
				</table>
				<div class="container-fluid mt-5">
					<div class="row">
						<div class="col-md-5 col-sm-12 me-5 mb-4">
							<a href="" class="btn btn-success w-100">LISTO</a>
						</div>
						<div class="col-md-6 col-sm-12">
							<h6>Notas:</h6>
							<p>Sin pepillos</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--PEDIDO-->
		<div
			class="col-md-5 col-sm-12 bg-white border rounded p-4 w-100 mb-3 shadow-sm">
			<h5>12349</h5>
			<div class="d-flex flex-wrap">
				<p class="me-4">
					Pedido para: <span class="font-weight-bold">Clara González</span>
				</p>
				<p class="me-4">
					Entregar a: <span class="font-weight-bold">Julian López</span>
				</p>
				<p class="me-4">
					Estado: <span class="font-weight-bold text-success">En
						preparación</span>
				</p>
			</div>
			<div class="table-responsive mt-3">
				<table class="table table">
					<thead>
						<tr>
							<th>Producto</th>
							<th>Cantidad</th>
							<th>Precio ud.</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Menú Big Mac</td>
							<td>1</td>
							<td>2,00 €</td>
						</tr>
						<tr>
							<td>Patatas</td>
							<td>1</td>
							<td>1,00 €</td>
						</tr>
						<tr>
							<td>Sandy Chocolate</td>
							<td>2</td>
							<td>1,50 €</td>
						</tr>
					</tbody>
				</table>
				<div class="container-fluid mt-5">
					<div class="row">
						<div class="col-md-5 col-sm-12 me-5 mb-4">
							<a href="" class="btn btn-success w-100">LISTO</a>
						</div>
						<div class="col-md-6 col-sm-12">
							<h6>Notas:</h6>
							<p>Sin pepillos</p>
						</div>
					</div>
				</div>
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
							<li class="mb-2"><a href="inicio_p.jsp"
								class="text-white  text-decoration-none">Inicio</a></li>
							<li class="mb-2"><a href="perfil_p.jsp"
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