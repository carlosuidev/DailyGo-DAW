<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tablas.Proveedores"%>
  <%@ page import="com.tablas.Productos"%>
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
			<a href="inicio_p.html" class="navbar-brand"> <img
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
		<div class="d-flex align-items-center flex-wrap">
			<h2 class="me-4">Gestiona tus productos</h2>
			<!-- Button to Open the Modal -->
			<button type="button" class="btn btn-success text-white"
				data-bs-toggle="modal" data-bs-target="#myModalAdd">
				<i class="fa-solid fa-plus"></i> AGREGAR PRODUCTO
			</button>
		</div>
		<hr>



		<!-- The Modal -->
		<div class="modal fade " id="myModalAdd">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Nuevo producto</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form action = "ServletForm" method="POST" class="was-validated mt-3">
							<div class="form-group mb-2">
								<label class="mb-2" for="productoNombreInsert">Producto</label> <input
									type="text" name="productoNombreInsert" id="productoNombreInsert"
									class="form-control" placeholder="Inserte el producto"
									pattern="[a-zA-Z0-9]+{1,50}" required>
								<div class="invalid-feedback">Use un nombre válido</div>
								<div class="valid-feedback">Válido.</div>
							</div>
							<div class="form-group mb-2">
								<label for="productoPrecioInsert" class="for-label mb-2">Precio</label>
								<input type="text" name="productoPrecioInsert" id="productoPrecioInsert"
									class="form-control" placeholder="Inserte su precio" required
									pattern="[0-9]{1,3}[.][0-9]{2}">
								<div class="invalid-feedback">Use un precio válido.</div>
								<div class="valid-feedback">Válido.</div>
							</div>
							<div class="mb-2">
								<label for="imagenProductInsert" class="form-label">Imagen de
									producto</label> <input placeholder="URL de la imagen" pattern="^(https?|ftp|file)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]" class="form-control" type="text" name ="imagenProductInsert" id="imagenProductInsert"
								 required>
							</div>

							<button type="submit" name="emailProvInserProd" value="<%proveedor.getCif_prov();%>" class=" mt-3 btn btn-secondary w-100">AÑADIR
								PRODUCTO</button>
						</form>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger w-100 text-white"
							data-bs-dismiss="modal">CANCELAR</button>
					</div>

				</div>
			</div>
		</div>


		<!-- The Modal -->
		<div class="modal fade " id="myModalEdit">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Editar producto</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<form method="post" action="ServletForm" class="was-validated mt-3">
							<div class="form-group mb-2">
								<label class="mb-2" for="productoNombre">Producto</label> <input
									type="text" name="productoNombre" id="productoNombre"
									class="form-control" placeholder="Inserte el producto"
									pattern="[A-Za-z0-9]+{1,20}" required>
								<div class="invalid-feedback">Use un nombre válido</div>
								<div class="valid-feedback">Válido.</div>
							</div>
							<div class="form-group mb-2">
								<label for="productoPrecio" class="for-label mb-2">Precio</label>
								<input type="text" name="productoPrecio" id="productoPrecio"
									class="form-control" placeholder="Inserte su precio" required
									pattern="[0-9]{1,3}[.][0-9]{2}">
								<div class="invalid-feedback">Use un precio válido.</div>
								<div class="valid-feedback">Válido.</div>
							</div>
							<div class="mb-2">
								<label for="formFileU" class="form-label">Imagen de
									producto</label> <input class="form-control" type="text" id="formFileU" placeholder="Inserte un link" required>
							</div>

							<button type="submit" name ="a" value="<% proveedor.getCif_prov();%>" class=" mt-3 btn btn-secondary w-100">GUARDAR
								PRODUCTO</button>
						</form>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger w-100 text-white"
							data-bs-dismiss="modal">CANCELAR</button>
					</div>

				</div>
			</div>
		</div>


		<div class="table-responsive mt-3 col-md-6 col-sm-12">
			<table class="table table">
				<thead>
					<tr>
						<th>Producto</th>
						<th>Precio ud.</th>
					</tr>
				</thead>
				<tbody>
				<%
				HttpSession sesion = request.getSession();
				LinkedList<Productos> lista = Controller.getProducto(proveedor.getCif_prov());
				for (int i = 0; i < lista.size(); i++) {
					out.println("<tr>");
					out.println("<td>"+lista.get(i).getDEN_PROD()+"</td>");
					out.println("<td>"+lista.get(i).getPU_PROD()+" &euro;</td>");
					out.println("<td><button type='button' class='btn btn-warning btn-sm' data-bs-toggle='modal' data-bs-target='#myModalEdit'><i class='fa-solid fa-pen-to-square'></i></button></td>");
					out.println("<td><button class='btn btn-danger btn-sm'><i class='fa-solid fa-ban'></i></button></td>");
					out.println("</tr>");
				}
				%>
				</tbody>
			</table>
		</div>
	</div>

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