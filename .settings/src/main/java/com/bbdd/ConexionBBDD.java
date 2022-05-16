package com.bbdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tablas.Clientes;
import com.tablas.Proveedores;
import com.tablas.Riders;

/**
 * Clase que centraliza los métodos de acceso a BBDD
 * 
 * @author JAGD
 * @since 27/05/2021
 */

public class ConexionBBDD {

	Connection conexion; 
	
	int port = 3306;
	String host= "localhost";
	String db  = "DailyGo";
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
	 * @return
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
	 * insertarcliente
	 * @param cliente
	 * @return
	 */
	public int insertarClientes(Clientes cliente) {
		int iRes=0;
		String sInsert = "insert into clientes (NOM_CLI, APE_CLI, TLF_CLI, MAIL_CLI, PW_CLI, IMG_CLI)"
				+ "values (?, ?, ?, ?, ?, ?) ";		
		try {
			
			System.out.println("Ejecutando "+sInsert);
			System.out.println("Datos a insertar: "+cliente);
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
			System.out.println("iRes que nos da"+ iRes);
			System.out.println("Error*"+sqlex.getMessage());
			sqlex.printStackTrace();
		}
		
		System.out.println("iRes que nos da dos"+ iRes);
		return iRes;
		
	}	
	
	public int insertarProveedores(Proveedores proveedor) {
		int iRes=0;
		String sInsert = "insert into proveedores (CIF_PROV, RAZSOC, DIR_PROV, TLF_PROV, MAIL_PROV, PW_PROV, IMG_PROV)"
				+ "values (?, ?, ?, ?, ?, ?, ?) ";		
		try {
			
			System.out.println("Ejecutando "+sInsert);
			System.out.println("Datos a insertar: "+proveedor);
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
			System.out.println("iRes que nos da"+ iRes);
			System.out.println("Error*"+sqlex.getMessage());
			sqlex.printStackTrace();
		}
		
		System.out.println("iRes que nos da dos"+ iRes);
		return iRes;
		
	}
	public int insertarRiders(Riders rider) {
		int iRes=0;
		String sInsert = "insert into riders (DNI_RID, NOM_RID, APE_RID, TLF_RID, MAIL_RID, PW_RID, IMG_RID)"
				+ "values (?, ?, ?, ?, ?, ?, ?) ";		
		try {
			
			System.out.println("Ejecutando "+sInsert);
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







