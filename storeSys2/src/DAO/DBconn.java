package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBconn {
    private static String url;
    private static String user;
    private static String password;
    static Connection conn = null;
    static Statement stmt = null;
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        url = "jdbc:mysql://localhost:3306/仓库管理?serverTimezone=UTC&useSSL=false&useUnicode=true&characterEncoding=utf-8";
        user = "root";
        password ="123456";
        if (conn == null)
            conn = DriverManager.getConnection(url,user,password);
        return conn;
    }


}


