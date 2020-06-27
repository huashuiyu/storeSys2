package action;
import DAO.DBconn;
import com.opensymphony.xwork2.ActionSupport;
import model.User;
import model.item;
import model.tradeLog;
import model.BuyHistory;
import org.apache.struts2.interceptor.SessionAware;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

public class GetAction extends ActionSupport implements SessionAware
{
    private Connection conn;
    private Statement stmt;
    private ResultSet rs;

    private ArrayList<item> items = new ArrayList<item>();
    private ArrayList<BuyHistory> history = new ArrayList<BuyHistory>();

    public String execute() throws SQLException {

        User user = (User) LoginAction.session.get("user");

        String sql = "select * from store,price where price.itemId = store.itemId";
        String sql1 = "select * from buy_history where username='"+user.getUsername()+"'";
        System.out.println(sql1);

        conn = DBconn.getConnection();
        stmt=conn.createStatement();
        rs = stmt.executeQuery(sql);
        System.out.println("conn ok");
        while (rs.next())
        {
            item i = new item();
            i.setBasePrice(rs.getString("baseprice"));
            i.setItem(rs.getString("item"));
            i.setItemId(rs.getString("itemId"));
            i.setNumber(rs.getString("number"));
            i.setOutPrice(rs.getString("outprice"));
            i.setStoreName(rs.getString("storeName"));
            i.setUrl(rs.getString("url"));
            items.add(i);
        }
        LoginAction.session.put("items",items);
        rs = stmt.executeQuery(sql1);
        while (rs.next())
        {
            BuyHistory bh = new BuyHistory();
            bh.setStore(rs.getString("store"));
            bh.setPay(rs.getFloat("pay"));
            bh.setUsername(rs.getString("username"));
            bh.setItem(rs.getString("item"));
            bh.setCount(rs.getInt("count"));
            bh.setDate(rs.getString("date"));
            history.add(bh);
        }
        LoginAction.session.put("history",history);
        return "success";
    }

    @Override
    public void setSession(Map<String, Object> map) {

    }
}
