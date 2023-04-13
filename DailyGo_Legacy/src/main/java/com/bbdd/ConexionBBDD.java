package com.bbdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tablas.Clientes;
import com.tablas.Mensajes;
import com.tablas.Productos;
import com.tablas.Proveedores;
import com.tablas.Riders;
import com.tablas.Ventas;
import com.tablas.detalleVentas;

/**
 * Clase que centraliza los métodos de acceso a BBDD
 * 
 * @author IGT Y CAA
 * @since 28/05/2022
 */

public class ConexionBBDD {

	Connection conexion; 
	
	int port = 3306;
	String host= "localhost";
	String db  = "DAILYGO";
	String user= "root";
	String password="";

	String url = String.format("jdbc:mysql://%s:%d/%s?useSSL=false", host, port, db);
	
	
	public void conectar() throws SQLException {
		System.out.println("LLega aqui");
		conexion =  DriverManager.getConnection(url, user, password);
	}	
	 
	
	public void desconectar() {
		try {
			conexion.close();
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
		}
	}
	
	/**
	 * ejecutarConsulta
	 * @param sentencia
	 * @return rsResultado
	 */
	public ResultSet ejecutarConsulta(String sentencia) {
		ResultSet rsResultado = null;
		try {
			System.out.println("Ejecutando: " + sentencia);
			PreparedStatement prepStatement = conexion.prepareStatement(sentencia);
			rsResultado = prepStatement.executeQuery();
			System.out.println(rsResultado);
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
		}
		return rsResultado;
	}	
	
	/**
	 * ejecutarUpdate
	 * @param sentencia
	 * @return rsResultado
	 */
	public Integer ejecutarUpdate(String sentencia) {
		int rsResultado = 0;
		try {
			System.out.println("Ejecutando: " + sentencia);
			PreparedStatement prepStatement = conexion.prepareStatement(sentencia);
			rsResultado = prepStatement.executeUpdate();
			System.out.println(rsResultado);
		} catch (SQLException sqlex) {
			System.out.println("Error: " + sqlex.getMessage());
		}
		return rsResultado;
	}	
	

	/**
	 * insertarCliente
	 * @param cliente
	 * @return iRes
	 */
	public int insertarClientes(Clientes cliente) {
		int iRes=0;
		String sInsert = "insert into clientes (NOM_CLI, APE_CLI, TLF_CLI, MAIL_CLI, PW_CLI, IMG_CLI)"
				+ "values (?, ?, ?, ?, ?, ?) ";		
		try {
			
			System.out.println("Ejecutando insert de clientes: "+sInsert);
			PreparedStatement prepStatement = conexion.prepareStatement(sInsert);
			prepStatement.setString(1, cliente.getNom_cli());
			prepStatement.setString(2, cliente.getApe_cli());			
			prepStatement.setInt(3, cliente.getTlf_cli());			
			prepStatement.setString(4, cliente.getMail_cli());
			prepStatement.setString(5, cliente.getPsw_cli());
			prepStatement.setString(6, cliente.getImg_cli());
			
			iRes = prepStatement.executeUpdate();
			
		}
		catch (SQLException sqlex) {
			System.out.println("iRes de clientes que nos da: "+ iRes);
			System.out.println("Error*"+sqlex.getMessage());
			sqlex.printStackTrace();
		}
		return iRes;
		
	}	
	
	
	/**
	 * insertarMensajes
	 * @param mensaje
	 * @return iRes
	 */
	public int insertarMensajes(Mensajes mensaje) {
		int iRes=0;
		
		String sInsert = "insert into mensajes (COD_CLI_MEN, ASU_MEN, MEN_MEN)"
				+ "values (?, ?, ?) ";		
		try {
			
			System.out.println("Ejecutando insert de mensajes: "+sInsert);
			PreparedStatement prepStatement = conexion.prepareStatement(sInsert);	
			prepStatement.setInt(1, mensaje.getCod_cli_men());
			prepStatement.setString(2, mensaje.getAsu_men());			
			prepStatement.setString(3, mensaje.getMen_men());			
			
			iRes = prepStatement.executeUpdate();
			
		}
		catch (SQLException sqlex) {
			System.out.println("iRes de mensajes que nos da: "+ iRes);
			System.out.println("Error*"+sqlex.getMessage());
			sqlex.printStackTrace();
		}
		
		System.out.println("iRes de mensaje: "+ iRes);
		return iRes;
		
	}	
	
	/**
	 * insertarDetalle
	 * @param detalle
	 * @return iRes
	 */
	public int insertarDetalle(detalleVentas detalle) {
		int iRes=0;
		
		String sInsert = "insert into detalle_Ventas values (?, ?, ?) ";		
		try {
			System.out.println("Ejecutando insert de detalle ventas: "+sInsert);
			PreparedStatement prepStatement = conexion.prepareStatement(sInsert);	
			prepStatement.setInt(1, detalle.getnum_ven_det());
			prepStatement.setInt(2, detalle.getCod_prod());
			prepStatement.setInt(3, detalle.getCantidadComprada());			
			iRes = prepStatement.executeUpdate();
			
		}
		catch (SQLException sqlex) {
			System.out.println("iRes de insertar detalle que nos da: "+ iRes);
			System.out.println("Error*"+sqlex.getMessage());
			sqlex.printStackTrace();
		}

		return iRes;
		
	}	
	
	/**
	 * insertarVenta
	 * @param venta
	 * @return iRes
	 */
	public int insertarVenta(Ventas venta) {
		int iRes=0;
		
		String sInsert = "insert into Ventas (COD_CLI_VEN, DNI_RID_VEN, DIR_VEN, FECH_VEN, ESTADO_VEN, COM_VEN)"
				+ "values (?, ?, ?, ?, ?, ?) ";		
		try {
			
			System.out.println("Ejecutando insert de ventas: "+sInsert);
			PreparedStatement prepStatement = conexion.prepareStatement(sInsert);	
			prepStatement.setInt(1, venta.getCod_cli_ven());
			prepStatement.setString(2, venta.getDNI_rid_ven());	
			prepStatement.setString(3, venta.getDir_vent());
			prepStatement.setString(4, venta.getFecha_ven());			
			prepStatement.setString(5, venta.getEstado_ven());
			prepStatement.setString(6, venta.getCom_ven());			
					
			
			iRes = prepStatement.executeUpdate();
			
		}
		catch (SQLException sqlex) {
			System.out.println("iRes de insertar ventas que nos da"+ iRes);
			System.out.println("Error*"+sqlex.getMessage());
			sqlex.printStackTrace();
		}

		return iRes;
		
	}	
	
	/**
	 * insertarProveedores
	 * @param proveedor
	 * @return iRes
	 */
	public int insertarProveedores(Proveedores proveedor) {
		int iRes=0;
		String sInsert = "insert into proveedores (CIF_PROV, RAZSOC, DIR_PROV, TLF_PROV, MAIL_PROV, PW_PROV, IMG_PROV)"
				+ "values (?, ?, ?, ?, ?, ?, ?) ";		
		try {
			
			System.out.println("Ejecutando insertar proveedore: "+sInsert);
			PreparedStatement prepStatement = conexion.prepareStatement(sInsert);
			prepStatement.setString(1, proveedor.getCif_prov());
			prepStatement.setString(2, proveedor.getRazsoc());			
			prepStatement.setInt(4, Integer.parseInt(proveedor.getTlf_prov()));			
			prepStatement.setString(3,proveedor.getDir_prov());
			prepStatement.setString(5, proveedor.getMail_prov());
			prepStatement.setString(6, proveedor.getPw_prov());
			prepStatement.setString(7, proveedor.getImg_prov());
			
			iRes = prepStatement.executeUpdate();
			
		}
		catch (SQLException sqlex) {
			System.out.println("iRes de insertar proveedores que nos da: "+ iRes);
			System.out.println("Error*"+sqlex.getMessage());
			sqlex.printStackTrace();
		}
		
		return iRes;
		
	}
	
	
	/**
	 * insertarProductos
	 * @param producto
	 * @return iRes
	 */
	public int insertarProductos(Productos producto) {
		int iRes=0;
		String sInsert = "insert into productos (DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD)"
				+ "values (?, ?, ?, ?) ";		
		try {
			
			System.out.println("Ejecutando insert de productos: "+sInsert);
			PreparedStatement prepStatement = conexion.prepareStatement(sInsert);
			prepStatement.setString(1, producto.getDEN_PROD());
			prepStatement.setDouble(2, producto.getPU_PROD());			
			prepStatement.setString(3, producto.getNOM_RES());			
			prepStatement.setString(4, producto.getImg_prod());
			iRes = prepStatement.executeUpdate();
		}
		catch (SQLException sqlex) {
			System.out.println("iRes que nos da insertar productos: "+ iRes);
			System.out.println("Error*"+sqlex.getMessage());
			sqlex.printStackTrace();
		}
		
		return iRes;
		
	}
	
	/**
	 * insertarRiders
	 * @param rider
	 * @return iRes
	 */
	public int insertarRiders(Riders rider) {
		int iRes=0;
		String sInsert = "insert into riders (DNI_RID, NOM_RID, APE_RID, TLF_RID, MAIL_RID, PW_RID, IMG_RID)"
				+ "values (?, ?, ?, ?, ?, ?, ?) ";		
		try {
			
			System.out.println("Ejecutando insert de Riders: "+sInsert);
			PreparedStatement prepStatement = conexion.prepareStatement(sInsert);
			prepStatement.setString(1, rider.getDni_rid());
			prepStatement.setString(2, rider.getNom_rid());			
			prepStatement.setInt(4, Integer.parseInt(rider.getTlf_rid()));			
			prepStatement.setString(3,rider.getApe_rid());
			prepStatement.setString(5, rider.getMail_rid());
			prepStatement.setString(6, rider.getPw_rid());
			prepStatement.setString(7, rider.getImg_rid());
			
			iRes = prepStatement.executeUpdate();
			
		}
		catch (SQLException sqlex) {
			System.out.println("Error*"+sqlex.getMessage());
			sqlex.printStackTrace();
		}
		
		return iRes;
		
	}

}
