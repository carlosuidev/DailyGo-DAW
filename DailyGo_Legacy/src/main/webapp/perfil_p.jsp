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
    <link rel="stylesheet" href="css/tienda.css">
    <link rel="stylesheet" href="styles.css">
    <title>DailyGo | Pedidos rápidos a domicilio</title>
    <link rel="shortcut icon" href="svg/Favicon.ico" type="image/x-icon">
</head>

<body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm fixed-top ps-5 pe-5">
        <div class="container-fluid p-2">
            <a href="inicio_p.html" class="navbar-brand">
                <img src="svg/Logotype.svg" alt="DailyGO" />
            </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto">
                    <a href="productos_p.jsp" class="nav-item nav-link">
                        <img src="svg/TIenda_P.svg" alt="">
                    </a>
                    <a href="perfil_p.jsp" class="nav-item nav-link">
                        <img src="svg/User_Icon_Navbar.svg" alt="">
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <section class="ps-5 pe-5 w-100 mb-5 min-vh-100" style="margin-top: 100px !important">
        <div class="d-flex flex-wrap">
            <img src="svg/perfil_p.svg" alt="" class="me-3">
            <h2 class="pt-1">Perfil</h2>
        </div>
        <hr>
        <div class="bg-white shadow-lg mb-5 p-4 row">
            <div class="col mb-3">
                <img src="img/user.png" class="rounded-circle" width="64" height="64">
            </div>
		<%
		HttpSession misesion = request.getSession();
	 	Proveedores proveedor = (Proveedores) misesion.getAttribute("emailIP");
	 	if (proveedor == null){
	 		response.sendRedirect("iniciar_sesion_p.html");
	 	} else {
	 	out.print("<div class='col-lg-10 col-md-10 col-sm-6'>");
	 	out.print("<h3>"+ proveedor.getRazsoc()+"</h3>");
	 	out.print("<p class='opacity-50'>Proveedor en DailyGo</p>");
	 	out.print("<p class='font-weight-bold mt-4'>Información de contacto</p>");
		out.print("<div class='d-flex flex-wrap'>");
		out.print("<p class='me-3'>"+proveedor.getCif_prov()+"</p>");
		out.print("<p class='me-3'>"+Integer.valueOf(proveedor.getTlf_prov())+"</p>");
		out.print("<p class='me-3'>"+proveedor.getMail_prov()+"</p>");
		out.print("<p class='me-3'>"+proveedor.getDir_prov()+"</p>");
		out.print("</div>");
		out.print("</div>");
		}
		%>
		<div class="col">
                <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#myModalUser">
                    <img src="svg/editar_cuenta.svg" alt="">
                </button>
               <img data-bs-target="#myModalSalir" data-bs-toggle="modal" style="cursor:pointer" src="svg/salir.svg" alt="Borrar Cuenta">
            </div>
		</div>
		

        <!-- The Modal -->
        <div class="modal fade" id="myModalUser">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Editar perfil</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form class="was-validated" method="POST" action="ServletForm">
                            <div class="form-group mb-2">
                                <label class="mb-2" for="correoEP">Correo electrónico</label>
                                <input type="mail" name="correoEP" id="correoEP" class="form-control"
                                    placeholder="Inserte su correo" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>
                                <div class="invalid-feedback">
                                    Por favor, use un correo válido.
                                </div>
                                <div class="valid-feedback">
                                    Válido.
                                </div>
                            </div>
                            <div class="form-group mb-2">
                                <label class="mb-2" for="telEP">Teléfono</label>
                                <input type="tel" name="telEP" id="telEP" class="form-control"
                                    placeholder="Inserte su teléfono" pattern="[0-9]{9}" required>
                                <div class="invalid-feedback">
                                    Por favor, use un teléfono válido.
                                </div>
                                <div class="valid-feedback">
                                    Válido.
                                </div>
                            </div>
                            <div class="form-group mb-2">
                                <label for="direccionEP" class="for-label mb-2">Dirección</label>
                                <input type="text" name="direccionEP" id="direccionEP" class="form-control"
                                    placeholder="Inserte su dirección" pattern="[a-zA-Z0-9]+{20}" required>
                                <div class="invalid-feedback">
                                    Por favor, inserte una dirección.
                                </div>
                                <div class="valid-feedback">
                                    Válido.
                                </div>
                            </div>
                            <div class="form-group mb-2">
                                <label for="passwordEP" class="for-label mb-2">Contraseña</label>
                                <input type="password" name="passwordEP" id="passwordEP" class="form-control"
                                    placeholder="Inserte su contraseña" pattern="[a-zA-Z0-9]{6,20}" required>
                                <div class="invalid-feedback">
                                    Por favor, inserte una contraseña.
                                </div>
                                <div class="valid-feedback">
                                    Válido.
                                </div>
                            </div>
                            <div class="d-flex mt-4">
                                <button type="submit" class="btn btn-success w-100 me-3 text-white">GUARDAR CAMBIOS</button>
                            </div>
                        </form>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary w-100"
                            data-bs-dismiss="modal">CANCELAR</button>
                    </div>
                </div>
            </div>
        </div>
        
         <!-- Modal para salir -->
        <div class="modal fade" id="myModalSalir">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">¿Desea cerrar sesión?</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body ">
                        <form method="POST" action="ServletForm" class="was-validated">
                            
                            
                            <div class="d-flex mt-4">
                                <button type="submit" class="btn btn-danger w-50 me-3 text-white" value="salir" name="salirCuentaProveedor">SI</button>
                                 <button type="button" class="btn btn-outline-success w-50 me-3 "
                            data-bs-dismiss="modal">CANCELAR</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <h4>Pedidos realizados</h4>
        <hr>
        <div class="table-responsive">
            <table class="table table-striped table-responsive">
                <thead>
                    <tr>
                        <th scope="col">Nº Pedido</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Dirección</th>
                        <th scope="col">Producto</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Ganancias</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">13421</th>
                        <td>12/04/2022</td>
                        <td>C/ Av. General Díaz 8</td>
                        <td>Menú Big Mac</td>
                        <td>2</td>
                        <td>12€</td>
                    </tr>
                    <tr>
                        <th scope="row">13421</th>
                        <td>12/04/2022</td>
                        <td>C/ Av. General Díaz 8</td>
                        <td>Patatas</td>
                        <td>4</td>
                        <td>4€</td>
                    </tr>
                    <tr>
                        <th scope="row">234596</th>
                        <td>12/04/2022</td>
                        <td>C/ De la Luz 2</td>
                        <td>Menú Big Mac</td>
                        <td>1</td>
                        <td>6€</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>



    <!--Footer-->
    <div>
        <footer class="bg-secondary text-center text-lg-start text-white">
            <div class="container p-3">
                <div class="row my-5">
                    <div class="col-lg-2 col-md-6 mb-4 mb-md-0 pt-3">
                      
                    </div>
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-4 ps-5">
                        <h5 class="text-uppercase mb-4">De interés</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <a href="inicio_p.html" class="text-white  text-decoration-none">Inicio</a>
                            </li>
                            <li class="mb-2">
                                <a href="#" class="text-white text-decoration-none">Perfil</a>
                            </li>
                            <li class="mb-2">
                                <a href="sobre_nosotros.html" class="text-white text-decoration-none" target="_blank">Sobre nosotros</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-4">
                        <h5 class="text-uppercase mb-4">Servicios</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <a href="#" class="text-white text-decoration-none">Pedidos</a>
                            </li>
                            <li class="mb-2">
                                <a href="#" class="text-white text-decoration-none">Riders</a>
                            </li>
                            <li class="mb-2">
                                <a href="#" class="text-white text-decoration-none">Venta de productos</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-4">
                        <h5 class="text-uppercase mb-4">Información</h5>

                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <a href="privacidad.html" class="text-white text-decoration-none" target="_blank">
                                    Politica de
                                    privacidad</a>
                            </li>
                            <li class="mb-2">
                                <a href="condiciones.html" class="text-white text-decoration-none" target="_blank">
                                    Condiciones de
                                    uso</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
                © 2022 DailyGo S.A.
            </div>
        </footer>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
</body>

</html>