package org.example;

import java.sql.*;

public class Query01 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        //1. Adım: Driver'a kaydol
        Class.forName("org.postgresql.Driver");//Java Database Connectivity-JDBC

        //2. Adım: Database'e bağlan
        Connection con = DriverManager.
                getConnection("jdbc:postgresql://localhost:5432/jdbc",
                        "postgres","1299");
        //3. Adım: Statement oluştur.
        Statement st = con.createStatement();

        //4.ResultSet
        ResultSet veri = st.executeQuery("select * from ogrenciler");

        //5.Datalari Al
        while(veri.next()){
            System.out.println(veri.getInt(1) +" "+ veri.getString(2)+" "
            +veri.getString(3)+" "+veri.getString(4));
        }

        //6.Baglantilari Kapatma

        con.close();
        st.close();
        veri.close();

    }

}
