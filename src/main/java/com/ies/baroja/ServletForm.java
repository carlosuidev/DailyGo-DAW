package com.ies.baroja;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.Controller;
import com.tablas.Clientes;
import com.tablas.Proveedores;
import com.tablas.Riders;

/**
 * Servlet implementation class ServletForm
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
		//Distintas string que pongo en el dopost para redireccionarlo a un metodo o a otro
		String correoIU = null;
		String correoIR = null;
		String correoIP = null;
		String nombreRestau = null;
		String editarPerfil = null;
		correoIU = request.getParameter("correoIU");
		correoIP = request.getParameter("correoIP");
		correoIR = request.getParameter("correoIR");
		nombreRestau = request.getParameter("restauranteNombre");
		editarPerfil = request.getParameter("nombreEU");
		try {
			//En este caso comprueba si el correo de la pagina de inicio de sesion esta nulo o no para meterle al login
			if (correoIP != null || correoIU != null || correoIR != null) {
				loginUsuario(request, response);
			} else if(nombreRestau != null) {
				buscarRestaurante(request, response);
			} else if(editarPerfil != null){
				editarPerfilUsuario(request, response);
			} else {
				registrarUsuario(request, response);
			}
		} catch (Exception e) {

		}

	}
	
	//metodo para registrar cualquier usuario
	protected void registrarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String altaCli = null;
		String altaProv = null;
		String altaRid = null;
		altaCli = request.getParameter("nombreRU");
		altaProv = request.getParameter("razonRP");
		altaRid = request.getParameter("apellidoRR");
		System.out.println("razonRP " + altaProv);
		if (altaCli != null) {
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
		} else if (altaProv != null) {
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
		} else if (altaRid != null) {
			// Creamos un objeto Rider de la clase Riders, y en ella metemos los parametros
			// en orden
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
			response.sendRedirect("index.html");
		}
	}

	//metodo para el login de cualquier usuario
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
			System.out.println(sesion.getAttribute("emailIU"));
			
			// && sesion.getAttribute("emailIU") == null
			if (Controller.comprobarInicioSesionCliente(inicioSesCli, sPwd) == true) {
				// si coincide email y password y además no hay sesión iniciada
				sesion.setAttribute("emailIU", inicioSesCli);
				// redirijo a página con información de login exitoso
				Clientes cliente = Controller.getClienteS(inicioSesCli);
				sesion.setAttribute("emailIU", cliente);
				response.sendRedirect("inicio_u.html");
			} else {
				response.sendRedirect("iniciar_sesion_u.html");
			}
		} else if (inicioSesRid != null) {
			HttpSession sesion = request.getSession();
			String sPwd = request.getParameter("passwordIR");
			System.out.println(sesion.getAttribute("emailIR"));
			// && sesion.getAttribute("emailIU") == null
			if (Controller.comprobarInicioSesionRider(inicioSesRid, sPwd) == true) {
				// si coincide email y password y además no hay sesión iniciada
				sesion.setAttribute("emailIU", inicioSesRid);
				// redirijo a página con información de login exitoso
				response.sendRedirect("inicio_r.html");
			} else {
				response.sendRedirect("iniciar_sesion_r.html");
			}
		} else if (inicioSesProv != null) {
			HttpSession sesion = request.getSession();
			String sPwd = request.getParameter("passwordIP");
			// && sesion.getAttribute("emailIU") == null
			if (Controller.comprobarInicioSesionProv(inicioSesProv, sPwd) == true) {
				// si coincide email y password y además no hay sesión iniciada
				sesion.setAttribute("emailIP", inicioSesProv);
				// redirijo a página con información de login exitoso
				response.sendRedirect("inicio_p.html");
			} else {
				response.sendRedirect("iniciar_sesion_p.html");
			}
	}
}	
	//metodo para buscar el restaurante y te lo muestre en la pagina tienda.jsp
	private static void buscarRestaurante(HttpServletRequest request, HttpServletResponse response) throws Exception {
	String sNombreRestau = request.getParameter("restauranteNombre");
	// en el caso de no ponga nombre la persona y solo le de a buscar salen todos los restaurantes que hay
	if (!sNombreRestau.equals(null)) {
		
		System.out.println("Nombre restaurante cuando vale distinto de null hace esto");
		Proveedores proveedor = Controller.getProveedorS(sNombreRestau);
		HttpSession sesion = request.getSession();
		sesion.setAttribute("Proveedor", proveedor);
		response.sendRedirect("tienda_u.jsp");
		
	} else {
		
		response.sendRedirect("tienda_u.jsp");
	}
	
	System.out.println("LLega todo a la busqueda del restaurante");
	}
	
	private static void editarPerfilUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession misesion = request.getSession();
	 	Clientes cliente = (Clientes) misesion.getAttribute("emailIU");
		Clientes clienteEditado = new Clientes(request.getParameter("nombreEU"), request.getParameter("apellidoEU"), 
				Integer.parseInt(request.getParameter("telEU")), request.getParameter("correoEU"), 
				request.getParameter("passwordEU"), 
				request.getParameter("imagenEU"));
		// en el caso de no ponga nombre la persona y solo le de a buscar salen todos los restaurantes que hay
		boolean respuesta = Controller.editarPerfilUsuario(clienteEditado, cliente);
		if (respuesta == true){
			response.sendRedirect("iniciar_sesion_u.html");
		} else {
			response.sendRedirect("perfil_u.jsp");
		}
		System.out.println("LLega todo a la busqueda del restaurante");
		}
	}
