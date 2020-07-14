/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Francisco
 */
public class Dba {

    private Connection conexion;
    public Statement query;

    public static void main(String[] args) {
        Dba obconeccion = new Dba();
        obconeccion.Conectar();
        
    }

    public Connection getConexion() {
        return conexion;
    }

    public void setConexion(Connection conexion) {
        this.conexion = conexion;
    }

    public Dba Conectar() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            String BaseDeDatos = "jdbc:oracle:thin:@localhost:1521:XE";
            
            //poner usuario y contraseña
            conexion = DriverManager.getConnection(BaseDeDatos, "proList_db", "vanguardia2020");
            query = conexion.createStatement();
            if (conexion != null) {
                System.out.println("Conexion exitosa!!");
            } else {
                System.out.println("Conexion fallida");
            }
        } catch (ClassNotFoundException | SQLException e) {
        }
        return this;
    }

    public void desconectar() {
        try {
            query.close();
            conexion.close();
        } catch (Exception e) {
        }
    }

    public void commit() {
        try {
            conexion.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
