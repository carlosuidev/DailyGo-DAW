package com.control;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import com.tablas.Clientes;
import com.tablas.Mensajes;
import com.tablas.Pedidos;
import com.tablas.Productos;
import com.tablas.Proveedores;
import com.tablas.Riders;
import com.tablas.Ventas;
import com.tablas.detalleVentas;
import com.bbdd.ConexionBBDD;

/**
 * Clase que hace de intermediario entre la conexion y los servlets
 * 
 * @author IGT Y CAA
 * @since 28/05/2022
 */

public class Controller {
	/**
	 * getClientes
	 * 
	 * @param
	 * 
	 * @return listaClientes
	 */
	// metodo que te devuelve una lista entera de todos los clientes
	public static LinkedList<Clientes> getClientes() {
		String sConsultaClientes = "SELECT NOM_CLI, APE_CLI, TLF_CLI, MAIL_CLI, PW_CLI, IMG_CLI FROM clientes;";
		// Objeto con la lista de clientes
		LinkedList<Clientes> listaClientes = new LinkedList<Clientes>();
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaClientes);
			if (rsResultado != null) {
				// Si hay resultado recuperamos los datos (como un FETCHde un CURSOR)
				while (rsResultado.next()) {
					// Creamos un objeto jugador por cada fila de la tabla(cada jugador)
					Clientes cliente = new Clientes(rsResultado.getString("NOM_CLI"), rsResultado.getString("APE_CLI"),
							rsResultado.getInt("TLF_CLI"), rsResultado.getString("MAIL_CLI"),
							rsResultado.getString("PW_CLI"), rsResultado.getString("IMG_CLI"));
					// Lo insertamos en la lista
					listaClientes.add(cliente);
				}
			} else {
				System.out.println("La consulta no devuelve resultados");
			}
			System.out.println("Número de clientes=" + listaClientes.size());
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaClientes;
	}

	/**
	 * getProveedor
	 * 
	 * @param
	 * 
	 * @return listaProveedor
	 */
	// metodo que te devuelve una lista completa de todos los proveedores
	public static LinkedList<Proveedores> getProveedor() {
		String sConsultaTotalProveedores = "SELECT * FROM proveedores;";
		// Objeto con la lista de clientes
		LinkedList<Proveedores> listaProveedor = new LinkedList<Proveedores>();
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaTotalProveedores);
			if (rsResultado != null) {
				// Si hay resultado recuperamos los datos (como un FETCHde un CURSOR)
				while (rsResultado.next()) {
					// Creamos un objeto jugador por cada fila de la tabla(cada jugador)
					Proveedores proveedor = new Proveedores(rsResultado.getString("CIF_PROV"),
							rsResultado.getString("RAZSOC"), rsResultado.getString("DIR_PROV"),
							Integer.toString(rsResultado.getInt("TLF_PROV")), rsResultado.getString("MAIL_PROV"),
							rsResultado.getString("PW_PROV"), rsResultado.getString("IMG_PROV"));
					// Lo insertamos en la lista
					listaProveedor.add(proveedor);
				}
			} else {
				System.out.println("La consulta no devuelve resultados");
			}
			System.out.println("Número de restaurantes encontrados: " + listaProveedor.size());
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaProveedor;
	}

	/**
	 * getProducto
	 * 
	 * @param cifRestau
	 * @return listaProductos
	 */
	public static LinkedList<Productos> getProducto(String cifRestau) {
		// Objeto con la lista de clientes
		LinkedList<Productos> listaProductos = new LinkedList<Productos>();
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		String sConsultaDeProductos = "Select DEN_PROD, PU_PROD, IMG_PROD, RAZSOC from productos, PROVEEDORES where CIF_PROV_PROD=CIF_PROV AND CIF_PROV='"
				+ cifRestau + "';";

		try {
			miConexion.conectar();
			// Lanzamos la consulta;
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaDeProductos);
			System.out.println("Realiza la primera consulta");
			if (rsResultado != null) {

				// Si hay resultado recuperamos los datos (como un FETCHde un CURSOR)
				while (rsResultado.next()) {
					// Creamos un objeto jugador por cada fila de la tabla(cada jugador)
					Productos producto = new Productos(rsResultado.getString("DEN_PROD"),
							Double.valueOf(rsResultado.getString("PU_PROD")), rsResultado.getString("RAZSOC"),
							rsResultado.getString("IMG_PROD"));
					// Lo insertamos en la lista
					listaProductos.add(producto);
				}
			} else {
				System.out.println("La consulta no devuelve resultados");
			}
			System.out.println("Número de productos encontrados: " + listaProductos.size());
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaProductos;
	}

	/**
	 * getDetallesMostrar
	 * 
	 * @param codVen
	 * @return listaProductos
	 */
	public static LinkedList<detalleVentas> getDetallesMostrar(int codVen) {
		// Objeto con la lista de clientes
		LinkedList<detalleVentas> listaProductos = new LinkedList<detalleVentas>();
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		String sConsultaDeDetalle = "Select CANT_DET, DEN_PROD, PU_PROD, IMG_PROD, NUM_VEN_DET, COD_PROD_DET FROM detalle_ventas, productos where COD_PROD=COD_PROD_DET AND NUM_VEN_DET="
				+ codVen + ";";

		try {
			miConexion.conectar();
			// Lanzamos la consulta;
			ResultSet rsResultado = miConexion.ejecutarConsulta(sConsultaDeDetalle);
			System.out.println("Realiza la primera consulta");
			if (rsResultado != null) {

				// Si hay resultado recuperamos los datos (como un FETCHde un CURSOR)
				while (rsResultado.next()) {
					// Creamos un objeto jugador por cada fila de la tabla(cada jugador)
					detalleVentas detalle = new detalleVentas(Integer.valueOf(rsResultado.getString("NUM_VEN_DET")),
							Integer.valueOf(rsResultado.getString("COD_PROD_DET")),
							Integer.valueOf(rsResultado.getString("CANT_DET")), rsResultado.getString("DEN_PROD"),
							Double.valueOf(rsResultado.getString("PU_PROD")), rsResultado.getString("IMG_PROD"));
					// Lo insertamos en la lista
					listaProductos.add(detalle);
				}
			} else {
				System.out.println("La consulta no devuelve resultados");
			}
			System.out.println("Número de detalle de ventas encontrados: " + listaProductos.size());
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaProductos;
	}

	/**
	 * insertarClientes
	 * 
	 * @param cliente
	 * @return bRes
	 */
	// metodo que da de alta nuevos clientes en la base de datos
	public static boolean insertarCliente(Clientes cliente) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			int iRes = miConexion.insertarClientes(cliente);
			if (iRes == 0) {
				bRes = false;
			}
			System.out.println("Resultado de insertar el cliente=" + iRes);
		} catch (SQLException sqlex) {
			System.out.println("Error en insertar clientes: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * nuevoMensaje
	 * 
	 * @param mensaje
	 * @return bRes
	 */
	public static boolean nuevoMensaje(Mensajes mensaje) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			int iRes = miConexion.insertarMensajes(mensaje);
			if (iRes == 0) {
				bRes = false;
			}
			System.out.println("Resultado de insertar el mensaje=" + iRes);
		} catch (SQLException sqlex) {
			System.out.println("Error en insertar mensaje: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * insertarProveedor
	 * 
	 * @param proveedor
	 * @return bRes
	 */
	// metodo para dar de alta nuevos proveedores
	public static boolean insertarProveedor(Proveedores proveedor) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			int iRes = miConexion.insertarProveedores(proveedor);
			if (iRes == 0) {
				bRes = false;
			}
			System.out.println("Resultado de insertar el proveedor=" + iRes);
		} catch (SQLException sqlex) {
			System.out.println("Error en insertar proveedores: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * insertarRider
	 * 
	 * @param rider
	 * @return bRes
	 */
	// metodo para dar de alta nuevos riders
	public static boolean insertarRider(Riders rider) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			int iRes = miConexion.insertarRiders(rider);
			if (iRes == 0) {
				bRes = false;
			}
			System.out.println("Resultado de insertar el rider: " + iRes);
		} catch (SQLException sqlex) {
			System.out.println("Error en insertar riders: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * insertarProducto
	 * 
	 * @param producto
	 * @return bRes
	 */
	public static boolean insertarProducto(Productos producto) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			int iRes = miConexion.insertarProductos(producto);
			if (iRes == 0) {
				bRes = false;
			}
			System.out.println("Resultado de insertar el producto: " + iRes);
		} catch (SQLException sqlex) {
			System.out.println("Error en insertar productos: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * comprobarInicioSesionCliente
	 * 
	 * @param sEmailCliente, sPasswordCliente
	 * @return clienteCorrecto
	 */
	// metodo que te devuelve true si el cliente tiene la contraseña y el correo
	// correctos
	public static boolean comprobarInicioSesionCliente(String sEmailCliente, String sPasswordCliente) {
		// Primero conectamos a la BBDD
		boolean clienteCorrecto = false;
		ConexionBBDD miConexion = new ConexionBBDD();
		String sBuscaCliente = "SELECT * from clientes " + "where mail_cli = '" + sEmailCliente + "' and PW_CLI = '"
				+ sPasswordCliente + "' ;";
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaCliente);
			while (rsResultado.next()) {
				clienteCorrecto = true;
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return clienteCorrecto;

	}

	/**
	 * comprobarInicioSesionRider
	 * 
	 * @param sEmailRid, sPasswordRid
	 * @return riderCorrecto
	 */
	// metodo que te devuelve true si el rider tiene la contraseña y el correo
	// correctos
	public static boolean comprobarInicioSesionRider(String sEmailRid, String sPasswordRid) {
		// Primero conectamos a la BBDD
		boolean riderCorrecto = false;
		ConexionBBDD miConexion = new ConexionBBDD();
		String sBuscaRid = "SELECT * from riders " + "where mail_rid = '" + sEmailRid + "' and PW_rid = '"
				+ sPasswordRid + "' ;";
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaRid);
			while (rsResultado.next()) {
				riderCorrecto = true;
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		System.out.println(riderCorrecto);
		return riderCorrecto;
	}

	/**
	 * comprobarInicioSesionProv
	 * 
	 * @param sEmailProv, sPasswordProv
	 * @return provCorrecto
	 */
	// metodo que te devuelve true si la contraseña y el correo pertenecen a la
	// misma persona de la base de datos
	// y false si no
	public static boolean comprobarInicioSesionProv(String sEmailProv, String sPasswordProv) {
		// Primero conectamos a la BBDD
		boolean provCorrecto = false;
		ConexionBBDD miConexion = new ConexionBBDD();
		String sBuscaProv = "SELECT * from proveedores " + "where mail_prov = '" + sEmailProv + "' and PW_prov = '"
				+ sPasswordProv + "' ;";
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaProv);
			while (rsResultado.next()) {
				System.out.println("Se mete para cambiar a true");
				provCorrecto = true;
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		System.out.println(provCorrecto);
		return provCorrecto;

	}

	/**
	 * listaDeRestaurantes
	 * 
	 * @param sNombreProveedor
	 * @return listaRestaurante
	 */
	// método que busca los proveedores por nombre o por letra
	public static LinkedList<Proveedores> listaDeRestaurantes(String sNombreProveedor) {
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		//
		LinkedList<Proveedores> listaRestaurante = new LinkedList<Proveedores>();
		String sBuscaProveedor = "SELECT * FROM proveedores" + " where RAZSOC LIKE '%" + sNombreProveedor + "%' ;";
		System.out.println("select que va a enviarse a conexion bbdd en la lista de restaurantes: " + sBuscaProveedor);
		try {
			miConexion.conectar();
			// Lanzamos la consulta

			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaProveedor);
			// Si hay resultado recuperamos los datos (como un FETCH de un CURSOR)
			while (rsResultado.next()) {
				// Creamos un objeto jugador por cada fila de la tabla (cadajugador)
				Proveedores proveedor = new Proveedores(rsResultado.getString("CIF_PROV"),
						rsResultado.getString("RAZSOC"), rsResultado.getString("DIR_PROV"),
						String.valueOf(rsResultado.getInt("TLF_PROV")), rsResultado.getString("MAIL_PROV"),
						rsResultado.getString("PW_PROV"), rsResultado.getString("IMG_PROV"));
				listaRestaurante.add(proveedor);
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaRestaurante;
	}

	/**
	 * getPedidos
	 * 
	 * @param numeroVenta
	 * @return listaPedidos
	 */
	public static LinkedList<Pedidos> getPedidos(int numeroVenta) {
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		//
		LinkedList<Pedidos> listaPedidos = new LinkedList<Pedidos>();
		String sBuscaPedido = "SELECT V.NUM_VEN, R.NOM_RID, V.ESTADO_VEN, P.DEN_PROD, P.IMG_PROD, P.PU_PROD, D.CANT_DET FROM riders R, ventas v, detalle_ventas d, productos p WHERE R.DNI_RID=V.DNI_RID_VEN AND V.NUM_VEN=D.NUM_VEN_DET AND D.COD_PROD_DET=P.COD_PROD AND NUM_VEN='"
				+ numeroVenta + "'AND V.DIR_VEN IS NOT NULL AND V.ESTADO_VEN != 'Entregado' ORDER BY V.NUM_VEN;";
		System.out.println("select que va a enviarse a conexion bbdd en getPedidos: " + sBuscaPedido);
		try {
			miConexion.conectar();
			// Lanzamos la consulta

			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaPedido);
			// Si hay resultado recuperamos los datos (como un FETCH de un CURSOR)
			while (rsResultado.next()) {
				// Creamos un objeto jugador por cada fila de la tabla (cadajugador)
				Pedidos pedido = new Pedidos(rsResultado.getInt("NUM_VEN"), rsResultado.getString("NOM_RID"),
						rsResultado.getString("ESTADO_VEN"), rsResultado.getString("DEN_PROD"),
						rsResultado.getString("IMG_PROD"), rsResultado.getInt("PU_PROD"),
						rsResultado.getInt("CANT_DET"));
				listaPedidos.add(pedido);
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaPedidos;
	}

	/**
	 * getVentas
	 * 
	 * @param codigoCliente
	 * @return listaVentas
	 */
	public static LinkedList<Ventas> getVentas(int codigoCliente) {
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		//
		LinkedList<Ventas> listaVentas = new LinkedList<Ventas>();
		String sBuscarVenta = "SELECT * from ventas where DIR_VEN is not null and COD_CLI_VEN=" + codigoCliente + ";";
		System.out.println("select que va a enviarse a conexion bbdd en getVentas: " + sBuscarVenta);
		try {
			miConexion.conectar();
			// Lanzamos la consulta

			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscarVenta);
			// Si hay resultado recuperamos los datos (como un FETCH de un CURSOR)
			while (rsResultado.next()) {
				// Creamos un objeto jugador por cada fila de la tabla (cadajugador)
				Ventas venta = new Ventas(rsResultado.getInt("NUM_VEN"), rsResultado.getString("DNI_RID_VEN"),
						rsResultado.getString("DIR_VEN"), rsResultado.getString("FECH_VEN"),
						rsResultado.getString("ESTADO_VEN"), rsResultado.getString("COM_VEN"));
				listaVentas.add(venta);
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaVentas;
	}

	/**
	 * validarDNI
	 * 
	 * @param itDNI
	 * @return boolean
	 */
	public static boolean validarDNI(String itDNI) {
		String caracteres = "TRWAGMYFPDXBNJZSQVHLCKE";
		String intPartDNI = itDNI.trim().replaceAll(" ", "").substring(0, 8);
		System.out.println(intPartDNI);
		char ltrDNI = itDNI.charAt(8);
		System.out.println(ltrDNI);
		int valNumDni = Integer.parseInt(intPartDNI) % 23;
		System.out.println(valNumDni);
		if (caracteres.charAt(valNumDni) != ltrDNI) {
			return false;
		} else {
			return true;
		}

	}

	/**
	 * getClienteS
	 * 
	 * @param sEmailCliente
	 * @return cliente
	 */
	public static Clientes getClienteS(String sEmailCliente) {
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		//
		String sBuscaProveedor = "SELECT * FROM clientes where MAIL_CLI = '" + sEmailCliente + "' ;";
		System.out.println("select que va a enviarse a conexion bbdd en getClienteS " + sBuscaProveedor);
		Clientes cliente = null;
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaProveedor);

			// Si hay resultado recuperamos los datos (como un FETCH de un CURSOR)
			while (rsResultado.next()) {
				// Creamos un objeto jugador por cada fila de la tabla (cadajugador)
				cliente = new Clientes(rsResultado.getString("NOM_CLI"), rsResultado.getString("APE_CLI"),
						rsResultado.getInt("TLF_CLI"), rsResultado.getString("MAIL_CLI"),
						rsResultado.getString("PW_CLI"), rsResultado.getString("IMG_CLI"));
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return cliente;
	}

	/**
	 * getCodCliente
	 * 
	 * @param sEmailCliente
	 * @return codigoBuscado
	 */
	public static int getCodCliente(String sEmailCliente) {
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		//
		String sBuscaProveedor = "SELECT cod_cli FROM clientes where MAIL_CLI = '" + sEmailCliente + "' ;";
		System.out.println("select que va a enviarse a conexion bbdd en getCodCliente: " + sBuscaProveedor);
		int codigoBuscado = 0;
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaProveedor);

			// Si hay resultado recuperamos los datos (como un FETCH de un CURSOR)
			while (rsResultado.next()) {
				// Creamos un objeto jugador por cada fila de la tabla (cadajugador)
				codigoBuscado = rsResultado.getInt("COD_CLI");

			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return codigoBuscado;
	}

	/**
	 * getRiderS
	 * 
	 * @param sEmailRider
	 * @return rider
	 */
	public static Riders getRiderS(String sEmailRider) {
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		//
		String sBuscaRider = "SELECT * FROM riders" + " where MAIL_rid = '" + sEmailRider + "' ;";
		System.out.println("select que va a enviarse a conexion bbdd en getRiderS: " + sBuscaRider);
		Riders rider = null;
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaRider);

			// Si hay resultado recuperamos los datos (como un FETCH de un CURSOR)
			while (rsResultado.next()) {

				// Creamos un objeto jugador por cada fila de la tabla (cadajugador)
				rider = new Riders(rsResultado.getString("DNI_RID"), rsResultado.getString("NOM_RID"),
						rsResultado.getString("APE_RID"), String.valueOf(rsResultado.getInt("TLF_RID")),
						rsResultado.getString("MAIL_RID"), rsResultado.getString("PW_RID"),
						rsResultado.getString("IMG_RID"));
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return rider;
	}

	/**
	 * getRiderRandom
	 * 
	 * @param
	 * @return rider
	 */
	public static Riders getRiderRandom() {
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		//
		String sBuscaRider = "SELECT * FROM riders ORDER BY RAND();";
		System.out.println("select que va a enviarse a conexion bbdd en getRiderRandom:  " + sBuscaRider);
		Riders rider = null;
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaRider);

			// Si hay resultado recuperamos los datos (como un FETCH de un CURSOR)
			while (rsResultado.next()) {

				// Creamos un objeto jugador por cada fila de la tabla (cadajugador)
				rider = new Riders(rsResultado.getString("DNI_RID"), rsResultado.getString("NOM_RID"),
						rsResultado.getString("APE_RID"), String.valueOf(rsResultado.getInt("TLF_RID")),
						rsResultado.getString("MAIL_RID"), rsResultado.getString("PW_RID"),
						rsResultado.getString("IMG_RID"));
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return rider;
	}

	/**
	 * hayVenta
	 * 
	 * @param
	 * @return result
	 */
	public static Integer hayVenta() {
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		//
		int result = 0;
		String sBuscaVenta = "SELECT * FROM ventas WHERE dir_ven IS null;";
		System.out.println("select que va a enviarse a conexion bbdd en hay Venta: " + sBuscaVenta);
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaVenta);

			// Si hay resultado recuperamos los datos (como un FETCH de un CURSOR)
			while (rsResultado.next()) {
				result = rsResultado.getInt("NUM_VEN");
				// Creamos un objeto jugador por cada fila de la tabla (cadajugador)

			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		System.out.println(result);
		return result;
	}

	/**
	 * hayPorductosDetalle
	 * 
	 * @param codigoProduct
	 * @return result
	 */
	public static Integer hayPorductosDetalle(int codigoProduct) {
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		//
		int result = 0;
		String sBuscaProducto = "SELECT * FROM detalle_ventas WHERE cod_prod_det ='" + codigoProduct + "';";
		System.out.println("select que va a enviarse a conexion bbdd en hayProductosDetalle: " + sBuscaProducto);
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaProducto);

			// Si hay resultado recuperamos los datos (como un FETCH de un CURSOR)
			while (rsResultado.next()) {
				result = rsResultado.getInt("cod_prod_det");
				// Creamos un objeto jugador por cada fila de la tabla (cadajugador)

			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		System.out.println(result);
		return result;
	}

	/**
	 * getProveedorS
	 * 
	 * @param sEmailProveedor
	 * @return proveedor
	 */
	public static Proveedores getProveedorS(String sEmailProveedor) {
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		//
		String sBuscaProveedor = "SELECT * FROM Proveedores" + " where MAIL_prov = '" + sEmailProveedor + "' ;";
		System.out.println("select que va a enviarse a conexion bbdd en getProveedorS: " + sBuscaProveedor);
		Proveedores proveedor = null;
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaProveedor);
			// Si hay resultado recuperamos los datos (como un FETCH de un CURSOR)
			while (rsResultado.next()) {
				proveedor = new Proveedores(rsResultado.getString("CIF_PROV"), rsResultado.getString("RAZSOC"),
						rsResultado.getString("DIR_PROV"), String.valueOf(rsResultado.getString("TLF_PROV")),
						rsResultado.getString("MAIL_PROV"), rsResultado.getString("PW_PROV"),
						rsResultado.getString("IMG_PROV"));
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return proveedor;
	}

	/**
	 * editarPerfilUsuario
	 * 
	 * @param clienteEditado, clienteAeditar
	 * @return proveedor
	 */
	public static boolean editarPerfilUsuario(Clientes clienteEditado, Clientes clienteAeditar) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		String updateUsuarios = "update clientes set nom_cli='" + clienteEditado.getNom_cli() + "', ape_cli='"
				+ clienteEditado.getApe_cli() + "', tlf_cli=" + clienteEditado.getTlf_cli() + ", mail_cli='"
				+ clienteEditado.getMail_cli() + "', pw_cli='" + clienteEditado.getPsw_cli() + "' where mail_cli='"
				+ clienteAeditar.getMail_cli() + "';";
		try {
			miConexion.conectar();
			Integer iRes = miConexion.ejecutarUpdate(updateUsuarios);
			System.out.println("Resultado de updatear el usuario: " + iRes);
			// 0 cuando el update no se ha realizado bien
			if (iRes == 0) {
				bRes = false;
			}
		} catch (SQLException sqlex) {
			System.out.println("Error en editar clientes: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * finalizarCompra
	 * 
	 * @param direccion, comentario
	 * @return bRes
	 */
	public static boolean finalizarCompra(String direccion, String comentario) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		String updateVentas = "update ventas set dir_ven='" + direccion + "', com_ven='" + comentario
				+ "' where DIR_VEN IS null;";
		try {
			miConexion.conectar();
			Integer iRes = miConexion.ejecutarUpdate(updateVentas);
			System.out.println("Resultado de finalizarCompra: " + iRes);
			// 0 cuando el update no se ha realizado bien
			if (iRes == 0) {
				bRes = false;
			}
		} catch (SQLException sqlex) {
			System.out.println("Error en insertar clientes: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * updateDeProductosDetalle
	 * 
	 * @param codProd, numVen
	 * @return bRes
	 */
	public static boolean updateDeProductosDetalle(int codProd, int numVen) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		String updateProductosDetalleCompra = "update detalle_ventas set cant_det=cant_det+1 where num_ven_det='"
				+ numVen + "' and cod_prod_det='" + codProd + "';";
		try {
			miConexion.conectar();
			Integer iRes = miConexion.ejecutarUpdate(updateProductosDetalleCompra);
			System.out.println("Resultado de updatear productosDetalle: " + iRes);
			// 0 cuando el update no se ha realizado bien
			if (iRes == 0) {
				bRes = false;
			}
		} catch (SQLException sqlex) {
			System.out.println("Error en update Porductos detalle: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * editarPerfilRider
	 * 
	 * @param riderEditado, riderAeditar
	 * @return bRes
	 */
	public static boolean editarPerfilRider(Riders riderEditado, Riders riderAeditar) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		String updateUsuarios = "update riders set nom_rid='" + riderEditado.getNom_rid() + "', ape_rid='"
				+ riderEditado.getApe_rid() + "', tlf_rid=" + Integer.valueOf(riderEditado.getTlf_rid())
				+ ", mail_rid='" + riderEditado.getMail_rid() + "', pw_rid='" + riderEditado.getPw_rid()
				+ "' where mail_rid='" + riderAeditar.getMail_rid() + "';";
		try {
			miConexion.conectar();
			Integer iRes = miConexion.ejecutarUpdate(updateUsuarios);
			System.out.println("Resultado de editar perfil rider: " + iRes);
			// 0 cuando el update no se ha realizado bien
			if (iRes == 0) {
				bRes = false;
			}
		} catch (SQLException sqlex) {
			System.out.println("Error en editarPerfilRider: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * editarPerfilProveedores
	 * 
	 * @param proveedorEditado, proveerdorAeditar
	 * @return bRes
	 */
	public static boolean editarPerfilProveedores(Proveedores proveedorEditado, Proveedores proveerdorAeditar) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		String updateUsuarios = "update proveedores set dir_prov='" + proveedorEditado.getDir_prov() + "', tlf_prov="
				+ Integer.valueOf(proveedorEditado.getTlf_prov()) + ", mail_prov='" + proveedorEditado.getMail_prov()
				+ "', pw_prov='" + proveedorEditado.getPw_prov() + "' where mail_prov='"
				+ proveerdorAeditar.getMail_prov() + "';";
		try {
			miConexion.conectar();
			Integer iRes = miConexion.ejecutarUpdate(updateUsuarios);
			System.out.println("Resultado de editar el perfil del proveedor: " + iRes);
			// 0 cuando el update no se ha realizado bien
			if (iRes == 0) {
				bRes = false;
			}
		} catch (SQLException sqlex) {
			System.out.println("Error en editar proveedor: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * borrarPerfilUsuario
	 * 
	 * @param clienteAborrar
	 * @return bRes
	 */
	public static boolean borrarPerfilUsuario(Clientes clienteAborrar) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		String updateUsuarios = "delete from clientes where MAIL_CLI='" + clienteAborrar.getMail_cli() + "';";
		try {
			miConexion.conectar();
			Integer iRes = miConexion.ejecutarUpdate(updateUsuarios);
			System.out.println("Resultado de borrar perfil usuario: " + iRes);
			// 0 cuando el update no se ha realizado bien
			if (iRes == 0) {
				bRes = false;
			}
		} catch (SQLException sqlex) {
			System.out.println("Error en insertar clientes: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * borrarVentas
	 * 
	 * @param
	 * @return bRes
	 */
	public static boolean borrarVentas() {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		String updateUsuarios = "delete from ventas where DIR_VEN is null;";
		try {
			miConexion.conectar();
			Integer iRes = miConexion.ejecutarUpdate(updateUsuarios);
			System.out.println("Resultado de borrar ventas: " + iRes);
			// 0 cuando el update no se ha realizado bien
			if (iRes == 0) {
				bRes = false;
			}
		} catch (SQLException sqlex) {
			System.out.println("Error en borrar ventas: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * introducirDetalleCompra
	 * 
	 * @param nuevoDetalle
	 * @return bRes
	 */
	public static boolean introducirDetalleCompra(detalleVentas nuevoDetalle) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			int iRes = miConexion.insertarDetalle(nuevoDetalle);
			if (iRes == 0) {
				bRes = false;
			}
			System.out.println("Resultado de introducir detalle compra: " + iRes);
		} catch (SQLException sqlex) {
			System.out.println("Error en insertar detalle compra: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * introducirVentas
	 * 
	 * @param venta
	 * @return bRes
	 */
	public static boolean introducirVentas(Ventas venta) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		try {
			miConexion.conectar();
			int iRes = miConexion.insertarVenta(venta);
			if (iRes == 0) {
				bRes = false;
			}
			System.out.println("Resultado de insertar la venta: " + iRes);
		} catch (SQLException sqlex) {
			System.out.println("Error en insertar ventas: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}

	/**
	 * sacarIdProducto
	 * 
	 * @param nombreProducto
	 * @return codigoProd
	 */
	public static int sacarIdProducto(String nombreProducto) {
		// Primero conectamos a la BBDD
		int codigoProd = 0;
		ConexionBBDD miConexion = new ConexionBBDD();
		String sBuscaCliente = "SELECT cod_prod from productos where den_prod = '" + nombreProducto + "';";
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaCliente);
			while (rsResultado.next()) {
				codigoProd = rsResultado.getInt("COD_PROD");
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return codigoProd;

	}

}

