package com.control;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import com.tablas.Clientes;
import com.tablas.Proveedores;
import com.tablas.Riders;
import com.bbdd.ConexionBBDD;

public class Controller {
	private static String sConsultaClientes = "SELECT NOM_CLI, APE_CLI, TLF_CLI, MAIL_CLI, PW_CLI, IMG_CLI FROM clientes;";

	private static String sConsultaTotalProveedores = "SELECT * FROM proveedores;";
	
	//metodo que te devuelve una lista entera de todos los clientes
	public static LinkedList<Clientes> getClientes() {
//Objeto con la lista de clientes
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
			System.out.println("Número de jugadores=" + listaClientes.size());
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaClientes;
	}
	
	//metodo que te devuelve una lista completa de todos los proveedores
	public static LinkedList<Proveedores> getProveedor() {
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
			System.out.println("Número de restaurantes encontrado=" + listaProveedor.size());
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return listaProveedor;
	}
	
	//metodo que da de alta nuevos clientes en la base de datos
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
	
	//metodo para dar de alta nuevos proveedores
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

	//metodo para dar de alta nuevos riders
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
			System.out.println("Resultado de insertar el proveedor=" + iRes);
		} catch (SQLException sqlex) {
			System.out.println("Error en insertar ryders: " + sqlex.getMessage());
			sqlex.printStackTrace();
			bRes = false;
		} finally {
			miConexion.desconectar();
		}

		return bRes;
	}
	
	//metodo que te devuelve true si el cliente tiene la contraseña y el correo correctos
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

	//metodo que te devuelve true si el rider tiene la contraseña y el correo correctos
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
		return riderCorrecto;
	}
	
	
	//metodo que te devuelve true si la contraseña y el correo pertenecen a la misma persona de la base de datos
	//y false si no
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
				provCorrecto = true;
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return provCorrecto;

	}

	//método que busca los proveedores por nombre
	public static Proveedores getProveedorS(String sNombreProveedor) {
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		//
		String sBuscaProveedor = "SELECT * FROM proveedores" + " where RAZSOC = '" + sNombreProveedor + "' ;";
		System.out.println("select que va a enviarse a conexion bbdd " + sBuscaProveedor);
		Proveedores proveedor = null;
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaProveedor);

			// Si hay resultado recuperamos los datos (como un FETCH de un CURSOR)
			while (rsResultado.next()) {
				// Creamos un objeto jugador por cada fila de la tabla (cadajugador)
				proveedor = new Proveedores(rsResultado.getString("CIF_PROV"), rsResultado.getString("RAZSOC"),
						rsResultado.getString("DIR_PROV"), String.valueOf(rsResultado.getInt("TLF_PROV")),
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
	
	public static Clientes getClienteS(String sEmailCliente) {
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		//
		String sBuscaProveedor = "SELECT * FROM clientes" + " where MAIL_CLI = '" + sEmailCliente + "' ;";
		System.out.println("select que va a enviarse a conexion bbdd " + sBuscaProveedor);
		Clientes cliente = null;
		try {
			miConexion.conectar();
			// Lanzamos la consulta
			ResultSet rsResultado = miConexion.ejecutarConsulta(sBuscaProveedor);

			// Si hay resultado recuperamos los datos (como un FETCH de un CURSOR)
			while (rsResultado.next()) {
				// Creamos un objeto jugador por cada fila de la tabla (cadajugador)
				cliente = new Clientes(rsResultado.getString("NOM_CLI"), rsResultado.getString("APE_CLI"), 
						rsResultado.getInt("TLF_CLI"), rsResultado.getString("MAIL_CLI"), rsResultado.getString("PW_CLI"), rsResultado.getString("IMG_CLI"));
			}
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
			sqlex.printStackTrace();
		} finally {
			miConexion.desconectar();
		}
		return cliente;
	}
	
	public static boolean editarPerfilUsuario(Clientes clienteEditado, Clientes clienteAeditar) {
		boolean bRes = true;
		// Primero conectamos a la BBDD
		ConexionBBDD miConexion = new ConexionBBDD();
		String updateUsuarios = "update clientes set nom_cli='"+clienteEditado.getNom_cli()
		+"', ape_cli='"+clienteEditado.getApe_cli()+"', tlf_cli="+clienteEditado.getTlf_cli()
		+", mail_cli='"+clienteEditado.getMail_cli()
		+"', pw_cli='"+clienteEditado.getPsw_cli()+"' where mail_cli='"+clienteAeditar.getMail_cli()+"';";
		try {
			miConexion.conectar();
			Integer iRes = miConexion.ejecutarUpdate(updateUsuarios);
			System.out.println("Resultado de insertar el cliente=" + iRes);
			//0 cuando el update no se ha realizado bien
			if(iRes==0) {
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

}
