
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
public class class_addGame {
       private static Connection con= null;
      private static Statement stm= null;
      private static ResultSet rset= null;
      
      public static boolean addGame(String name,String price,String Tags,String platform,String realeseDate,String story,String requiments,String image){
       boolean insertSucsses=false;
       try{
           con=DBConnect.getConnection();
           stm= con.createStatement();
           String sql="INSERT INTO game(id, name, price, Tags, platform, realeseDate, story, requiments, image) VALUES(0,'"+name+"','"+price+"','"+Tags+"','"+platform+"','"+realeseDate+"','"+story+"','"+requiments+"','"+image+"')";
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
      
      public static int deleteGame(String id){
       int updateSucsses=0;
       try{
           Connection con = DBConnect.getConnection();
           Statement stm = con.createStatement();
           String sql="DELETE FROM game WHERE id='"+id+"'";
           int rs= stm.executeUpdate(sql);
           
           if(rs>0){
               updateSucsses = 1;
           }
           else{
                updateSucsses = 0;
           }
       }catch(Exception e){
           e.printStackTrace();
           
       }
        return updateSucsses;   
    }
      
   public static int updateGame(String id,String name,String price,String Tags,String platform,String realeseDate,String story,String requiments,String image){
       int updateSucsses=0;
       try{
           Connection con = DBConnect.getConnection();
           Statement stm = con.createStatement();
           String sql="UPDATE game SET  name='"+name+"',price='"+price+"',Tags='"+Tags+"',platform='"+platform+"',realeseDate='"+realeseDate+"',story='"+story+"',requiments='"+requiments+"',image='"+image+"' WHERE id='"+id+"'";
           int rs= stm.executeUpdate(sql);
           
           if(rs>0){
               updateSucsses = 1;
           }
           else{
                updateSucsses = 0;
           }
       }catch(Exception e){
           e.printStackTrace();
           
       }
        return updateSucsses;   
    }
   public static boolean addGameDate(String gameId){
       boolean insertSucsses=false;
       try{
           con=DBConnect.getConnection();
           stm= con.createStatement();
           String sql="INSERT INTO gamedone(id, gameId) VALUES(0,'"+gameId+"')";
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
   
   public static int updatePlayer(String id,int match,int score){
       int updateSucsses=0;
       try{
           Connection con = DBConnect.getConnection();
           Statement stm = con.createStatement();
           String sql="UPDATE user SET  matchCount="+match+",score="+score+" WHERE id='"+id+"'";
           int rs= stm.executeUpdate(sql);
           
           if(rs>0){
               updateSucsses = 1;
           }
           else{
                updateSucsses = 0;
           }
       }catch(Exception e){
           e.printStackTrace();
           
       }
        return updateSucsses;   
    }
}
