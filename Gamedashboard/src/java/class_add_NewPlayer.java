
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author User
 */
public class class_add_NewPlayer {
       private static Connection con= null;
      private static Statement stm= null;
      private static ResultSet rset= null;
      
      public static boolean addNewPlayer(String name,String Address,String tel,String age,String email,String game){
       boolean insertSucsses=false;
       try{
           con=DBConnect.getConnection();
           stm= con.createStatement();
           String sql="INSERT INTO user(id, name, Address, tel, age, email, game,matchCount, score) VALUES(0,'"+name+"','"+Address+"','"+tel+"','"+age+"','"+email+"','"+game+"',0,0)";
           int rs= stm.executeUpdate(sql);
           
           if(rs>0){
               insertSucsses = true;
           }
           else{
                insertSucsses = false;
           }
       }catch(Exception e){
           e.printStackTrace();
           
       }
        return insertSucsses;   
    }
}
