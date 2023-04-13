<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.tablas.Clientes"%>
    <%@ page import="com.tablas.Pedidos"%>
    <%@ page import="com.tablas.Ventas"%>
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
            <a href="inicio_u.jsp" class="navbar-brand">
                <img src="svg/Logotype.svg" alt="DailyGO" />
            </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav">
                    <a href="tienda_u.jsp" class="nav-item nav-link">Tienda</a>
                    <a href="seguimientoPedido.jsp" class="nav-item nav-link">Pedidos</a>
                    <a href="contacto_u.jsp" class="nav-item nav-link">Contacto</a>
                </div>
                <div class="navbar-nav ms-auto">
                    <a href="carritoCompra_u.jsp" class="nav-item nav-link">
                        <img src="svg/Carrito_Navbar.svg" alt="">
                    </a>
                    <a href="perfil_u.jsp" class="nav-item nav-link">
                        <img src="svg/User_Icon_Navbar.svg" alt="">
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <section class="ps-5 pe-5 w-100 mb-5 min-vh-100" style="margin-top: 100px !important">
        <div class="d-flex flex-wrap">
            <img src="svg/perfil_u.svg" class="me-3">
            <h2 class="pt-1">Perfil</h2>
        </div>
        <hr>

        <div class="bg-white shadow-lg mb-5 p-4 row">
            <div class="col mb-3">
                <img src="img/user.png" class="rounded-circle" width="64" height="64">
            </div>
            <%
        	HttpSession misesion = request.getSession();
    	 	Clientes cliente = (Clientes) misesion.getAttribute("emailIU");
    	 	if (cliente == null){
    	 		response.sendRedirect("iniciar_sesion_u.html");
    	 	} else {
    	 	out.print("<div class='col-lg-10 col-md-10 col-sm-6'>");
    	 	out.print("<h3>"+ cliente.getNom_cli()+" "+ cliente.getApe_cli()+"</h3>");
    	 	out.print("<p class='opacity-50'>Usuario de DailyGo</p>");
    	 	out.print("<p class='font-weight-bold mt-4'>Información de contacto</p>");
    		out.print("<div class='d-flex flex-wrap'>");
    		out.print("<p class='me-3'>"+cliente.getTlf_cli()+"</p>");
    		out.print("<p>"+cliente.getMail_cli()+"</p>");
    		out.print("</div>");
    		out.print("</div>");
    	 	}
            %>
            
            <div class="col-1">
                <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#myModalUser">
                    <img src="svg/editar_cuenta.svg" alt="">
                </button>
               
                    <img data-bs-target="#myModalSalir" data-bs-toggle="modal" style="cursor:pointer" src="svg/salir.svg" alt="Salir cuenta">
               
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
                        <form method="POST" action="ServletForm" class="was-validated">
                            <div class="form-group mb-2">
                                <label class="mb-2" for="nombreEU">Nuevo nombre</label>
                                <input type="text" name="nombreEU" id="nombreEU" class="form-control"
                                    placeholder="Inserte su nombre" pattern="[A-Za-z]+{1,20}" required>
                                <div class="invalid-feedback">
                                    Por favor, escriba su nombre.
                                </div>
                                <div class="valid-feedback">
                                    Válido.
                                </div>
                            </div>
                            <div class="form-group mb-2">
                                <label class="mb-2" for="apellidoEU">Nuevos apellidos</label>
                                <input type="text" name="apellidoEU" id="apellidoEU" class="form-control"
                                    placeholder="Inserte sus apellidos" pattern="[A-Za-z]+{1,20}" required>
                                <div class="invalid-feedback">
                                    Por favor, use apellidos correctos.
                                </div>
                                <div class="valid-feedback">
                                    Válido.
                                </div>
                            </div>
                            <div class="form-group mb-2">
                                <label class="mb-2" for="correoEU">Nuevo correo electrónico</label>
                                <input type="mail" name="correoEU" id="correoEU" class="form-control"
                                    placeholder="Inserte su correo" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>
                                <div class="invalid-feedback">
                                    Por favor, use un correo válido.
                                </div>
                                <div class="valid-feedback">
                                    Válido.
                                </div>
                            </div>
                            <div class="form-group mb-2">
                                <label class="mb-2" for="telEU">Nuevo teléfono</label>
                                <input type="tel" name="telEU" id="telEU" class="form-control"
                                    placeholder="Inserte su teléfono" pattern="[0-9]{9}" required>
                                <div class="invalid-feedback">
                                    Por favor, use un teléfono válido.
                                </div>
                                <div class="valid-feedback">
                                    Válido.
                                </div>
                            </div>
                            <div class="form-group mb-2">
                                <label for="passwordEU" class="for-label mb-2">Nueva contraseña</label>
                                <input type="password" name="passwordEU" id="passwordEU" class="form-control"
                                    placeholder="Inserte su contraseña" pattern="[a-zA-Z0-9]{6,20}" required>
                                <div class="invalid-feedback">
                                    Por favor, inserte una contraseña.
                                </div>
                                <div class="valid-feedback">
                                    Válido.
                                </div>
                            </div>
                            
                            <div class="d-flex mt-4">
                                <button type="submit" class="btn btn-success w-50 me-3 text-white">GUARDAR CAMBIOS</button>
                                <button type="button" data-bs-toggle="modal" data-bs-target="#myModalDelete" class="btn btn-danger text-white w-50">BORRAR CUENTA</button>
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
        
        <!-- Modal para borrar cuenta -->
         <div class="modal fade" id="myModalDelete">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">¿Desea borrar el perfil?</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body ">
                        <form method="POST" action="ServletForm" class="was-validated">
                            
                            
                            <div class="d-flex mt-4">
                                <button type="submit" class="btn btn-danger w-50 me-3 text-white" value="borrar" name="borrarCuenta">SI</button>
                                 <button type="button" class="btn btn-outline-success w-50 me-3 "
                            data-bs-dismiss="modal">CANCELAR</button>
                            </div>
                        </form>
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
                                <button type="submit" class="btn btn-danger w-50 me-3 text-white" value="salir" name="salirCuenta">SI</button>
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
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Nº Pedido</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Cod. rider</th>
                        <th scope="col">Dirección</th>
                    </tr>
                </thead>
                <tbody>
                <% 
                LinkedList<Pedidos> lista = new LinkedList<Pedidos>();
				LinkedList<Ventas> listaVentas = new LinkedList<Ventas>();
				listaVentas = Controller.getVentas((Controller.getCodCliente(cliente.getMail_cli())));
				try{
					
				for (int i = 0; i < listaVentas.size(); i++) {
					if(listaVentas.get(i).getEstado_ven().equals("Entregado")){
					out.print("<tr>");
					out.print("<td scope='row'>"+listaVentas.get(i).getCod_cli_ven()+"</td>");
					out.print("<td>"+listaVentas.get(i).getFecha_ven()+"</td>");
					out.print("<td>"+listaVentas.get(i).getDNI_rid_ven()+"</td>");
					out.print("<td>"+listaVentas.get(i).getDir_vent()+"</td>");
					out.print("<tr>");}
				}
				}catch (Exception e){
					response.sendRedirect("inicio_u.jsp");
				}
                %>
                    
                </tbody>
            </table>
        </div>
    </section>

    <!--FOOTER-->
    <div>
        <footer class="bg-secondary text-center text-lg-start text-white">
            <div class="container p-3">
                <div class="row my-5 container-fluid mx-auto">
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-3">
                        <div class="shadow-1-strong d-flex align-items-center justify-content-center mb-4 mx-auto">
                            <img src="svg/LOGOfooter.svg" height="40" alt="" loading="lazy" />
                        </div>
                        <p class="text-center small mb-4">Puedes seguirnos en el Twitter <br> de Carlos Almendros y en
                            el <br> Instagram de Ignacio Gil</p>
                        <ul class="list-unstyled d-flex flex-row justify-content-center">
                            <li>
                                <a class="text-white px-2" href="https://www.twitter.com/design_c2a" target="_blank">
                                    <img src="svg/twitter.svg"></img>
                                </a>
                            </li>
                            <li>
                                <a class="text-white px-2" href="https://www.instagram.com/arrobaladygaga"
                                    target="_blank">
                                    <img src="svg/instagram.svg"></img>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-4 ps-5">
                        <h5 class="text-uppercase mb-4">De interés</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <a href="inicio_u.jsp" class="text-white  text-decoration-none">Inicio</a>
                            </li>
                            <li class="mb-2">
                                <a href="tienda_u.jsp" class="text-white text-decoration-none">Tienda</a>
                            </li>
                            <li class="mb-2">
                                <a href="contacto_u.jsp" class="text-white text-decoration-none">Contacto</a>
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
                                <a href="privacidad.html" class="text-white text-decoration-none" target="_blank"> Politica de
                                    privacidad</a>
                            </li>
                            <li class="mb-2">
                                <a href="condiciones.html" class="text-white text-decoration-none" target="_blank"> Condiciones de
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