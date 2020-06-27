package action;

import DAO.DBconn;
import model.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.Map;

public class RegisterAction
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

    public RegisterAction() throws ParseException {
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

        String sql1 = "select * from user";
        ResultSet rs1 = stmt.executeQuery(sql1);

        int flag=1;


        while (rs1.next())  //用户名查重
        {
            if (rs1.getString("username").equals(user.getUsername()))
                flag=0;
        }

        if (user.getPassword().equals(password2) && !user.getPassword().equals("") && !user.getUsername().equals("") && flag==1)
        {
            String sql = "insert into user(username,password,power) values('"+user.getUsername()+"','"+user.getPassword()+"','3')";
            //
            rs = stmt.executeUpdate(sql);
            System.out.println("conn ok");

        }
        if (flag==1)
            return "success";
        else
            return "error";
    }
}
