


import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author SJ
 */
public class DBConnect {
        private static String url="jdbc:mysql://localhost:3306/gameSystem";
        private static String user="root";
        private static String pass="sudewa1234"; 
        private static Connection con;
                
        public static Connection getConnection(){
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection(url, user, pass);
                
            }catch(Exception e){
                System.out.println("Database Connection not SUCCESS");
            }
            return con;
            
        }
}
