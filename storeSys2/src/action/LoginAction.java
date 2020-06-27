package action;

import DAO.DBconn;
import com.opensymphony.xwork2.ActionSupport;
import model.User;
import org.apache.struts2.interceptor.SessionAware;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

public class LoginAction extends ActionSupport implements SessionAware
{
    User user; //模型驱动
    private Connection conn;
    private Statement stmt;

    private ResultSet rs;

    public static Map<String, Object> session;

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }

    public void setSession(Map<String, Object> session) {
        this.session=session ;
    }

    public String execute() throws SQLException {
        String x = "0";
        String sql = "select * from user";
        conn = DBconn.getConnection();
        stmt=conn.createStatement();
        rs = stmt.executeQuery(sql);
        System.out.println("conn ok");
        while (rs.next())
        {
            if (user.getUsername().equals(rs.getString("username")) && user.getPassword().equals(rs.getString("password")))
            {
                user.setPower(rs.getString("power"));
                user.setMoney(rs.getFloat("money"));
                x=rs.getString("power");
            }
            session.put("user",user);
        }

        if(!x.equals("0"))
            return x;
        else
            return "error";
    }

}
