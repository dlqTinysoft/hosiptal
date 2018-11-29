package util;

import java.sql.*;
public class DBConn {
    static{
        try{
        	Class.forName("com.mysql.jdbc.Driver");
//        	Class.forName("com.mysql.jdbc.Driver"); 
//          Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        }catch(Exception ex){
            ex.printStackTrace();
        }

    }

    public static Connection getConn(){
        try{
        	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbgirl?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull","root","root");
//        	conn = DriverManager.getConnection("jdbc:mysql://localhost/fzshop","root","123");
//       	Connection conn=DriverManager.getConnection("jdbc:odbc:temp");
            return conn;
        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
    public static void close(Connection conn,Statement st,ResultSet rs){
    	if(rs!=null){
            try{
                rs.close();
            }catch(SQLException ex){
            }
       }
       if(st!=null){
           try {
               st.close();
           }catch(Exception ex){
           }
       }
       if(conn!=null){
           try{
               conn.close();
           }catch(Exception ex){
           }
       }
    }

}
