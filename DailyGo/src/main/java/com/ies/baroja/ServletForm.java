package com.ies.baroja;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.Controller;
import com.tablas.Clientes;
import com.tablas.Mensajes;
import com.tablas.Productos;
import com.tablas.Proveedores;
import com.tablas.Riders;
import com.tablas.Ventas;
import com.tablas.detalleVentas;

/**
 * Servlet implementation class ServletForm
 * @author IGT Y CAA
 * @since 28/05/2022
 */
@WebServlet("/ServletForm")
public class ServletForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// con el metodo dopost cogemos las cosas que escriba la persona buscandola con
	// el ID puesto en el HTML
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Distintas string que pongo en el dopost para redireccionarlo a un metodo o a
		// otro
		try {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			// En este caso comprueba si el correo de la pagina de inicio de sesion esta
			// nulo o no para meterle al login
			System.out.println(request.getParameter("direccionEntrega"));
			if (request.getParameter("correoIP") != null || request.getParameter("correoIU") != null
					|| request.getParameter("correoIR") != null) {
				System.out.println("Me cago");
				loginUsuario(request, response);
			} else if (request.getParameter("restauranteNombre") != null) {
				buscarRestaurante(request, response);
			} else if (request.getParameter("nombreEU") != null || request.getParameter("nombreRE") != null
					|| request.getParameter("correoEP") != null) {
				editarPerfilUsuario(request, response);
			} else if (request.getParameter("borrarCuenta") != null) {
				borrarPerfilUsuario(request, response);
			} else if (request.getParameter("salirCuenta") != null || request.getParameter("salirCuentaRider") != null
					|| request.getParameter("salirCuentaProveedor") != null) {
				salirCuenta(request, response);
			} else if (request.getParameter("motivoU") != null) {
				guardarMensaje(request, response);
			} else if (request.getParameter("buscarProductoTienda") != null) {
				buscarProductos(request, response);
			} else if (request.getParameter("anhadirCarrito") != null) {
				System.out.println("A = " + request.getParameter("anhadirCarrito"));
				carritoCompra(request, response);
			} else if (request.getParameter("productoNombreInsert") != null) {
				registrarProducto(request, response);
			}else if (request.getParameter("direccionEntrega") != null) {
				finalizarCompra(request, response);
			} else {
				registrarUsuario(request, response);
			}
		} catch (Exception e) {

		}

	}

	/**
	 * registrarUsuario
	 * 
	 * @param request, response
	 * 
	 * 
	 */
	protected void registrarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (request.getParameter("nombreRU") != null) {
			/** 1- recogida de datos */
			Clientes cliente = new Clientes(request.getParameter("nombreRU"), request.getParameter("apellidoRU"),
					Integer.parseInt(request.getParameter("telRU")), request.getParameter("correoRU"),
					request.getParameter("passwordRU"), "");
			/** 2- Insertar jugador en la base de datos */
			boolean bRes = Controller.insertarCliente(cliente);
			System.out.println("LLega hasta el bRes " + bRes);
			if (bRes) {
				response.sendRedirect("iniciar_sesion_u.html");
			} else {
				response.sendRedirect("registrarse_u.html");
			}
		} else if (request.getParameter("razonRP") != null) {
			/** 1- recogida de datos */
			Proveedores proveedor = new Proveedores(request.getParameter("cifRP"), request.getParameter("razonRP"),
					request.getParameter("direccionRP"), request.getParameter("telRP"),
					request.getParameter("correoRP"), request.getParameter("passwordRP"), "");
			/** 2- Insertar proveedor en la base de datos */
			boolean bRes = Controller.insertarProveedor(proveedor);
			if (bRes) {
				response.sendRedirect("iniciar_sesion_p.html");
			} else {
				response.sendRedirect("registrarse_p.html");
			}
		} else if (request.getParameter("apellidoRR") != null) {
			// Creamos un objeto Rider de la clase Riders, y en ella metemos los parametros
			// en orden
			boolean seguir = Controller.validarDNI(request.getParameter("dniRR"));
			System.out.println(seguir);
			if(seguir == true) {
			Riders rider = new Riders(request.getParameter("dniRR"), request.getParameter("nombreRR"),
					request.getParameter("apellidoRR"), request.getParameter("telRR"), request.getParameter("correoRR"),
					request.getParameter("passwordRR"), "");
			// Insertamos los datos en la tabla Riders
			boolean bRes = Controller.insertarRider(rider);
			if (bRes) {
				response.sendRedirect("iniciar_sesion_r.html");
			} else {
				response.sendRedirect("registrarse_r.html");
			}
			} else {
				response.sendRedirect("registrarse_r.html");
			}
		} else {
			response.sendRedirect("index.html");
		}
	}

	/**
	 * loginUsuario
	 * 
	 * @param request, response
	 * 
	 * 
	 */
	// metodo para el login de cualquier usuario
	private static void loginUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String inicioSesCli = null;
		String inicioSesProv = null;
		String inicioSesRid = null;
		inicioSesCli = request.getParameter("correoIU");
		inicioSesProv = request.getParameter("correoIP");
		inicioSesRid = request.getParameter("correoIR");
		// Podemos guardar información en la sesión del usuario
		if (inicioSesCli != null) {
			HttpSession sesion = request.getSession();
			String sPwd = request.getParameter("passwordIU");
			// **** deberíamos buscar el email en la base de datos, pero como es
			// un ejemplo lo escribimos en el mismo código
			

			// && sesion.getAttribute("emailIU") == null
			if (Controller.comprobarInicioSesionCliente(inicioSesCli, sPwd) == true
					&& sesion.getAttribute("emailIU") == null) {
				// si coincide email y password y además no hay sesión iniciada
				sesion.setAttribute("emailIU", inicioSesCli);
				request.setAttribute("errorInicio", "no");
				// redirijo a página con información de login exitoso
				Clientes cliente = Controller.getClienteS(inicioSesCli);
				sesion.setAttribute("emailIU", cliente);
				response.sendRedirect("inicio_u.jsp");
			} else {
				response.sendRedirect("error.html");
			}

		} else if (inicioSesRid != null) {
			HttpSession sesion = request.getSession();
			String sPwd = request.getParameter("passwordIR");
			// && sesion.getAttribute("emailIU") == null
			if (Controller.comprobarInicioSesionRider(inicioSesRid, sPwd) == true
					&& sesion.getAttribute("emailIR") == null) {
				// si coincide email y password y además no hay sesión iniciada
				Riders rider = Controller.getRiderS(inicioSesRid);
				sesion.setAttribute("emailIR", rider);
				// redirijo a página con información de login exitoso
				response.sendRedirect("inicio_r.jsp");
			} else {
				response.sendRedirect("error.html");
			}
		} else if (inicioSesProv != null) {
			HttpSession sesion = request.getSession();
			String sPwd = request.getParameter("passwordIP");
			// && sesion.getAttribute("emailIU") == null
			if (Controller.comprobarInicioSesionProv(inicioSesProv, sPwd) == true
					&& sesion.getAttribute("emailIP") == null) {
				// si coincide email y password y además no hay sesión iniciada
				Proveedores proveedor = Controller.getProveedorS(inicioSesProv);
				sesion.setAttribute("emailIP", proveedor);
				// redirijo a página con información de login exitoso
				response.sendRedirect("inicio_p.jsp");
			} else {
				response.sendRedirect("error.html");
			}
		}
	}

	/**
	 * buscarRestaurante
	 * 
	 * @param request, response
	 * 
	 * 
	 */
	// metodo para buscar el restaurante y te lo muestre en la pagina tienda.jsp
	private static void buscarRestaurante(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sNombreRestau = request.getParameter("restauranteNombre");
		// en el caso de no ponga nombre la persona y solo le de a buscar salen todos
		// los restaurantes que hay
		if (!sNombreRestau.equals(null) && !sNombreRestau.contains("'")) {
			System.out.println("Nombre restaurante cuando vale distinto de null viene por aquí");
			HttpSession sesion = request.getSession();
			sesion.setAttribute("ListaBuscar", sNombreRestau);
			response.sendRedirect("tienda_u.jsp");
		} else {
			response.sendRedirect("tienda_u.jsp");
		}
		System.out.println("LLega todo a la busqueda del restaurante");
	}

	/**
	 * editarPerfilUsuario
	 * 
	 * @param request, response
	 * 
	 * 
	 */
	private static void editarPerfilUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String editarPerfilUsuario = request.getParameter("nombreEU");
		String editarPerfilRider = request.getParameter("nombreRE");
		String editarPerfilProveedor = request.getParameter("correoEP");
		System.out.println(editarPerfilUsuario);
		if (editarPerfilUsuario != null) {
			HttpSession misesion = request.getSession();
			Clientes cliente = (Clientes) misesion.getAttribute("emailIU");
			Clientes clienteEditado = new Clientes(request.getParameter("nombreEU"), request.getParameter("apellidoEU"),
					Integer.parseInt(request.getParameter("telEU")), request.getParameter("correoEU"),
					request.getParameter("passwordEU"), request.getParameter("imagenEU"));
			// en el caso de no ponga nombre la persona y solo le de a buscar salen todos
			// los restaurantes que hay
			boolean respuesta = Controller.editarPerfilUsuario(clienteEditado, cliente);
			if (respuesta == true) {
				Clientes clienteEditadoGuardado = Controller.getClienteS(request.getParameter("correoEU"));
				misesion.setAttribute("emailIU", clienteEditadoGuardado);
				response.sendRedirect("perfil_u.jsp");

			} else {
				response.sendRedirect("iniciar_sesion_u.html");
			}
		} else if (editarPerfilRider != null) {
			HttpSession misesion = request.getSession();
			Riders rideraEditar = (Riders) misesion.getAttribute("emailIR");
			Riders riderEditado = new Riders(null, request.getParameter("nombreRE"), request.getParameter("apellidoRE"),
					request.getParameter("telRE"), request.getParameter("correoRE"), request.getParameter("passwordRE"),
					null);
			// en el caso de no ponga nombre la persona y solo le de a buscar salen todos
			// los restaurantes que hay
			boolean respuesta = Controller.editarPerfilRider(riderEditado, rideraEditar);
			if (respuesta == true) {
				Riders rider = Controller.getRiderS(request.getParameter("correoRE"));
				misesion.setAttribute("emailIR", rider);
				response.sendRedirect("perfil_r.jsp");

			} else {
				response.sendRedirect("iniciar_sesion_r.html");
			}

		} else if (editarPerfilProveedor != null) {
			HttpSession misesion = request.getSession();
			Proveedores ProveedoraEditar = (Proveedores) misesion.getAttribute("emailIP");
			Proveedores ProveedorEditado = new Proveedores(null, null, request.getParameter("direccionEP"),
					request.getParameter("telEP"), request.getParameter("correoEP"), request.getParameter("passwordEP"),
					null);
			// en el caso de no ponga nombre la persona y solo le de a buscar salen todos
			// los restaurantes que hay
			boolean respuesta = Controller.editarPerfilProveedores(ProveedorEditado, ProveedoraEditar);
			if (respuesta == true) {
				Proveedores proveedor = Controller.getProveedorS(request.getParameter("correoEP"));
				misesion.setAttribute("emailIP", proveedor);
				response.sendRedirect("perfil_p.jsp");

			} else {
				response.sendRedirect("iniciar_sesion_p.html");
			}

		}
	}

	/**
	 * borrarPerfilUsuario
	 * 
	 * @param request, response
	 * 
	 * 
	 */
	private static void borrarPerfilUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession misesion = request.getSession();
		Clientes cliente = (Clientes) misesion.getAttribute("emailIU");
		// en el caso de no ponga nombre la persona y solo le de a buscar salen todos
		// los restaurantes que hay
		boolean respuesta = Controller.borrarPerfilUsuario(cliente);
		if (respuesta == true) {
			misesion.setAttribute("emailIU", null);
			response.sendRedirect("iniciar_sesion_u.html");
			System.out.println("Se borra todo bien");
		} else {
			response.sendRedirect("perfil_u.jsp");
		}
		
	}

	/**
	 * salirCuenta
	 * 
	 * @param request, response
	 * 
	 * 
	 */
	private static void salirCuenta(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String salirRid = request.getParameter("salirCuentaRider");
		String salirProv = request.getParameter("salirCuentaProveedor");
		String salirUsu = request.getParameter("salirCuenta");
		// if varios para cada cerrar sesion
		if (salirUsu != null) {
			System.out.println("LLega a cerrar cuenta usuario");
			HttpSession misesion = request.getSession();
			// ponemos el httpssesion guardado al iniciar sesion en null para borrar el
			// inicio de sesion
			Controller.borrarVentas();
			misesion.setAttribute("emailIU", null);
			response.sendRedirect("iniciar_sesion_u.html");
		} else if (salirRid != null) {
			System.out.println("LLega a cerrar cuenta Rider");
			HttpSession misesion = request.getSession();
			misesion.setAttribute("emailIR", null);
			// en el caso de no ponga nombre la persona y solo le de a buscar salen todos
			// los restaurantes que hay
			response.sendRedirect("iniciar_sesion_r.html");
		} else if (salirProv != null) {
			System.out.println("LLega a cerrar cuenta Proveedor");
			HttpSession misesion = request.getSession();
			misesion.setAttribute("emailIP", null);
			response.sendRedirect("iniciar_sesion_p.html");
		}
	}

	/**
	 * guardarMensaje
	 * 
	 * @param request, response
	 * 
	 * 
	 */
	private static void guardarMensaje(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String motivo = request.getParameter("motivoU");
		String cuerpoMensaje = request.getParameter("descU");
		System.out.println("LLega a servletForm guardar mensaje");
		HttpSession misesion = request.getSession();
		Clientes cliente = (Clientes) misesion.getAttribute("emailIU");
		String emailBuscarClienteMen = cliente.getMail_cli();
		// Te envia a un metodo que te realiza una select del codigo del cliente con el
		// email guardado en la sesion
		int codigoBuscadoParaElMensaje = Controller.getCodCliente(emailBuscarClienteMen);
		// Te crea un objeto mensaje con el codigo, el motivo y el cuerpo del mensaje
		Mensajes mensaje = new Mensajes(codigoBuscadoParaElMensaje, motivo, cuerpoMensaje);
		// Metodo que envia el mensaje para insertarlo en la base de datos
		boolean bRes = Controller.nuevoMensaje(mensaje);
		if (bRes) {
			System.out.println("Esta todo correcto, mensaje insertado bien");
		} else {
			System.out.println("No se ha podido meter bien el mensaje");
		}

		response.sendRedirect("contacto_u.jsp");

	}

	/**
	 * buscarProductos
	 * 
	 * @param request, response
	 * 
	 * 
	 */
	private static void buscarProductos(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sNombreCifProveedor = request.getParameter("buscarProductoTienda");

		if (sNombreCifProveedor != null) {
			System.out.println("Codigo del restaurante cuando vale distinto de null hace esto");
			HttpSession sesion = request.getSession();
			sesion.setAttribute("CifProveedorRestaurante", sNombreCifProveedor);
			response.sendRedirect("producto_u.jsp");
			System.out.println("Busca bien todos los productos");
		} else {
			response.sendRedirect("tienda_u.jsp");
		}
		
	}

	/**
	 * carritoCompra
	 * 
	 * @param request, response
	 * 
	 * 
	 */
	private static void carritoCompra(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		System.out.println(formatter.format(date));
		String botonEnviarAlCarro = request.getParameter("anhadirCarrito");
		System.out.println("Boton enviar al carro" + botonEnviarAlCarro);
		HttpSession misesion = request.getSession();
		Clientes cliente = (Clientes) misesion.getAttribute("emailIU");
		System.out.println(Controller.hayVenta());
		int codigoProduct = Controller.sacarIdProducto(botonEnviarAlCarro);
		if (Controller.hayVenta() == 0) {
			System.out.println("No hay venta sin descripcion");
			// SE ME GUARDA EL VALOR DEL NOMBRE DEL PRODUCTO

			Ventas nuevaVenta = new Ventas(Controller.getCodCliente(cliente.getMail_cli()),
					Controller.getRiderRandom().getDni_rid(), null, formatter.format(date), "Preparándose", null);
			Controller.introducirVentas(nuevaVenta);
			detalleVentas nuevoDetalle = new detalleVentas(Controller.hayVenta(), codigoProduct, 1);
			Controller.introducirDetalleCompra(nuevoDetalle);
			response.sendRedirect("producto_u.jsp");
		} else if (Controller.hayPorductosDetalle(codigoProduct) != 0) {
			// 1 numero producto 2 cantidad comprada 3 nombre producto 4 precio unitario
			Controller.updateDeProductosDetalle(Controller.hayPorductosDetalle(codigoProduct), Controller.hayVenta());
			response.sendRedirect("producto_u.jsp");
		} else {
			detalleVentas nuevoDetalle = new detalleVentas(Controller.hayVenta(), codigoProduct, 1);
			Controller.introducirDetalleCompra(nuevoDetalle);
			response.sendRedirect("producto_u.jsp");
		}
	}

	/**
	 * registrarProducto
	 * 
	 * @param request, response
	 * 
	 * 
	 */
	protected void registrarProducto(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/** 1- recogida de datos */
		HttpSession misesion = request.getSession();
		Proveedores proveedor = (Proveedores) misesion.getAttribute("emailIP");
		Productos producto = new Productos(request.getParameter("productoNombreInsert"),
				Double.valueOf(request.getParameter("productoPrecioInsert")), proveedor.getCif_prov(),
				request.getParameter("imagenProductInsert"));
		Controller.insertarProducto(producto);
		response.sendRedirect("productos_p.jsp");
	}
	
	/**
	 * finalizarCompra
	 * 
	 * @param request, response
	 * 
	 * 
	 */
	protected void finalizarCompra(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/** 1- recogida de datos */
		boolean correccion = Controller.finalizarCompra(request.getParameter("direccionEntrega"), request.getParameter("comentariosRider"));
		if(correccion == true) {
			response.sendRedirect("pagoRealizado_u.jsp");
		} else {
			response.sendRedirect("pagoCompra_u.jsp");
		}
		
	}
}
