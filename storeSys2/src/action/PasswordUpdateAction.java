package action;

import DAO.DBconn;
import model.User;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.Map;

public class PasswordUpdateAction
{
    private User user; //模型驱动
    private Connection conn;
    private Statement stmt;
    private int rs=0;

    private String password2;

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public PasswordUpdateAction() throws ParseException {
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public String execute() throws SQLException {
        conn = DBconn.getConnection();
        stmt=conn.createStatement();
        String username = user.getUsername();

        if (user.getPassword().equals(password2) && !user.getPassword().equals(""))
        {
            System.out.println("1@1@1@1");
            String sql = "update user set password = '"+user.getPassword()+"' where username = '"+user.getUsername()+"'";

            rs = stmt.executeUpdate(sql);
            System.out.println("2@2@2@2\t"+rs);
            System.out.println("conn ok");

        }
        if (rs==1) {
            return "success";
        }
        else
            return "error";
    }
}
