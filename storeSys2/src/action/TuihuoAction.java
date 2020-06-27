package action;

import DAO.DBconn;
import model.BuyHistory;
import model.User;
import model.item;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class TuihuoAction
{
    private static final long serialVersionUID = 1L;
    private BuyHistory buyhistory;
    private User user;
    private ArrayList<BuyHistory> buyhistories = new ArrayList<BuyHistory>();
    private ArrayList<item> items = new ArrayList<item>();
    public BuyHistory getBuyhistory() {
        return buyhistory;
    }
    public void setBuyhistory(BuyHistory buyhistory) {
        this.buyhistory = buyhistory;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    private Connection conn;
    private Statement stmt;

    public String execute() throws SQLException {
        conn = DBconn.getConnection();
        stmt = conn.createStatement();

        String sql = "delete from buy_history where username='"+user.getUsername()+"' and item='"+buyhistory.getItem()+"' and count='"+buyhistory.getCount()+"' and date='"+buyhistory.getDate()+"' and store='"+buyhistory.getStore()+"'";
        int rs = stmt.executeUpdate(sql);


        if (rs==1)
        {
            System.out.println("删除记录成功");
            sql="update user set money=money+"+buyhistory.getPay()+" where username='"+user.getUsername()+"'";
            rs=stmt.executeUpdate(sql);

            if (rs==1)
                System.out.println("用户退款成功");

            User u = (User) LoginAction.session.get("user");
            u.setMoney(u.getMoney()+buyhistory.getPay());

            buyhistories = (ArrayList<BuyHistory>) LoginAction.session.get("history");
            for (int i=buyhistories.size()-1;i>=0;i--)
            {
                if (buyhistories.get(i).getItem().equals(buyhistory.getItem()) && buyhistories.get(i).getStore().equals(buyhistory.getStore()) &&
                        buyhistories.get(i).getCount()==buyhistory.getCount() && buyhistories.get(i).getDate().equals(buyhistory.getDate()))
                {
                    buyhistories.remove(i);
                }
            }
            LoginAction.session.replace("history",buyhistories);

            buyhistories = (ArrayList<BuyHistory>) LoginAction.session.get("history");



            sql="update  user,store set money=money-"+buyhistory.getPay()+" where user.username=store.storeManager and storeName='"+buyhistory.getStore()+"'";

            rs=stmt.executeUpdate(sql);


            if (rs==1)
                System.out.println("商家退款成功");

            sql = "update store set number=number+"+buyhistory.getCount()+" where storeName='"+buyhistory.getStore()+"' and item='"+buyhistory.getItem()+"'";
            rs=stmt.executeUpdate(sql);

            if (rs==1)
                System.out.println("退货成功");
            items = (ArrayList<item>) LoginAction.session.get("items");
            for (int i=items.size()-1;i>=0;i--)
            {
                if (items.get(i).getItem().equals(buyhistory.getItem()) && items.get(i).getStoreName().equals(buyhistory.getStore()))
                {
                    items.get(i).setNumber((Integer.parseInt(items.get(i).getNumber())+buyhistory.getCount())+"");
                }
            }
            LoginAction.session.replace("items",items);
            items = (ArrayList<item>) LoginAction.session.get("items");

        }

        return "success";
    }

}
