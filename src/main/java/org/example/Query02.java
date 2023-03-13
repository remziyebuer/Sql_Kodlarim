package org.example;

import java.sql.*;

public class Query02 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        //1.
        Class.forName("org.postgresql.Driver");
        //2.
        Connection con = DriverManager.
                getConnection("jdbc:postgresql://localhost:5432/jdbc",
                        "postgres","1299");
        //3.
        Statement st = con.createStatement();
         //Soru 1; Region id ' si 1 olan country_name degerlerini cagiriniz.

        //****sasirdigim iki sey sorguyu String data turunde tanimlama ve ikinciside
        //column eger sorgu hepsi icinse  yani  * ise  kacinci kolon oldugunu yazdiriyoruz
        //eger sadece belli sütunlar ise kac tane oldugunu yaziyoruz.

        String sql01 = "select country_name from countries where region_id =1 ";
        //4.
        ResultSet veri1 = st.executeQuery(sql01);
        //5.
        while(veri1.next()){
            System.out.println("sql01; " + veri1.getString(1));
        }
        System.out.println("**********************************+");

     //2.yol
        String sql02 = "select * from countries where region_id =1 ";
        ResultSet veri2 = st.executeQuery(sql02);
        while(veri2.next()){
            System.out.println("sql02; " + veri2.getString(2));
        }

        System.out.println("**********************************+");
        //Soru 2:"region_id"nin 2'den büyük olduğu "country_id" ve "country_name"
        // değerlerini çağırın.

        String sql03= "select country_id , country_name from countries " +
                "where region_id > 2";
        ResultSet veri3 = st.executeQuery(sql03);
        while(veri3.next()){
            System.out.println("sql03; " + veri3.getString(1)
            + veri3.getString(2));
        }



        //Baglantilari Kapatma yogunluktan dolayi kitlenmesin diye yapilir.

        con.close();
        st.close();
        veri1.close();
        veri2.close();
        veri3.close();

    }
}
