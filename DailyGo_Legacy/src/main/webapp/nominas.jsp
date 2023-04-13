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
    <link rel="stylesheet" href="css/tienda.css">
    <link rel="stylesheet" href="styles.css">
    <title>DailyGo | Pedidos rápidos a domicilio</title>
    <link rel="shortcut icon" href="svg/Favicon.ico" type="image/x-icon">
</head>

<body>
	<%
	HttpSession misesion = request.getSession();
	Riders rider = (Riders) misesion.getAttribute("emailIR");
	if (rider == null) {
		response.sendRedirect("iniciar_sesion_r.html");
	}
	%>
    <!--Navbar de arriba--> 
    <nav class="navbar navbar-expand-lg navbar-light bg-light mb-5 shadow-sm fixed-top ps-5 pe-5">
        <div class="container-fluid p-2">
            <a href="inicio_r.jsp" class="navbar-brand">
                <img src="svg/Logotype.svg" alt="DailyGo">
            </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto">
                    <a href="perfil_r.jsp" class="nav-item nav-link">
                        <img src="svg/bici_Rider_Negra.svg" alt="fotoBicicleta">
                    </a>
                </div>
            </div>
        </div>
    </nav>
    <!--Fin de la navbar de arriba-->

    <!--Empiece de la section del body-->
    <section class="min-vh-100 mt-5 d-flex align-items-center justify-content-center">
        <div class="row col-12">
            <div class="col-3"></div>
            <div class="col-2"><img src="svg/personaLlorandoTiempo.svg" alt="en trabajo"></div>
            <div class="col-2"></div>
            <div class="col-3 d-flex align-items-start flex-column justify-content-center  ">
                <h2>Work in progress</h2>
                <p>Esta página web pertene a las nóminas pero por falta de recursos la realizaremos en otro momento, disculpen las molestias.</p>
            </div>
        </div>
           
       
    </section>
    <!--Fin de la section del body-->

    <!--div del footer-->
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
                                <a href="inicio_r.jsp" class="text-white  text-decoration-none">Inicio</a>
                            </li>
                            <li class="mb-2">
                                <a href="perfil_r.jsp" class="text-white text-decoration-none">Perfil</a>
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

    <!--Fin del footer-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
</body>

</html>