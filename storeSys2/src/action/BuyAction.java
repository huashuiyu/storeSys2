package action;

import DAO.DBconn;
import model.BuyHistory;
import model.User;
import model.item;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BuyAction
{
    private static final long serialVersionUID = 1L;
    private int n;          //购买数量
    User user;
    ArrayList<User> managers = new ArrayList<User>();
    ArrayList<BuyHistory> histories = new ArrayList<BuyHistory>();
    User root;             //最高权限
    int flag=1;
    int yn;
    public int getN() {
        return n;
    }
    public void setN(int n) {
        this.n = n;
    }
    item item;
    private Connection conn;
    private Statement stmt;
    ResultSet rs1;
    private int rs;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public model.item getItem() {
        return item;
    }
    public void setItem(model.item item) {
        this.item = item;
    }
    public String execute() throws SQLException {
        conn = DBconn.getConnection();
        stmt=conn.createStatement();
        user = (User) LoginAction.session.get("user");


        if (n<=Integer.parseInt(item.getNumber())) {             //数量小于库存
            yn=1;
            System.out.println("数量小于库存");
            int re = Integer.parseInt(item.getNumber()) - n;


            String sql = "update store set number='" + re + "' where itemId = '" + item.getItemId() + "' and storeName = '" + item.getStoreName() + "'";
            System.out.println(sql);
            rs = stmt.executeUpdate(sql);
            System.out.println("conn ok");
            item.setNumber(re + "");

            if (rs == 1) {
                ArrayList<item> f = (ArrayList<item>) LoginAction.session.get("items");

                for (int i = 0; i < f.size(); i++) {
                    if (f.get(i).getItemId().equals(item.getItemId()) && f.get(i).getStoreName().equals(item.getStoreName())) {
                        item.setUrl(f.get(i).getUrl());
                        f.remove(i);
                        f.add(item);
                    }
                }


                LoginAction.session.replace("items", f);
                //manager赚钱

                String x1 = item.getOutPrice();
                String x2=item.getBasePrice();
                float money = n*Float.parseFloat(item.getOutPrice());
                float true_money = n*(Float.parseFloat(x1)-Float.parseFloat(x2));

                BuyHistory bh = new BuyHistory();
                bh.setUsername(user.getUsername());
                bh.setPay(money);
                bh.setStore(item.getStoreName());
                bh.setItem(item.getItem());
                bh.setCount(n);
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                bh.setDate(df.format(new Date()).toString());

                String history = "insert into buy_history(username,item,count,date,store,pay) values('"+bh.getUsername()+"','"+bh.getItem()+"',"+bh.getCount()+",'"+bh.getDate()+"','"+bh.getStore()+"',"+bh.getPay()+")";

                rs = stmt.executeUpdate(history);
                if(rs==1)
                    System.out.println("历史记录插入成功");
                histories = (ArrayList<BuyHistory>) LoginAction.session.get("history");

                histories.add(bh);
                LoginAction.session.replace("history",histories);

                String in_money = "update user,store set money=money+"+money+",in_money=in_money+"+money+",true_in_money=true_in_money+"+true_money+" where user.username=store.storeManager and storeName='"+item.getStoreName()+"'";
                int yn = stmt.executeUpdate(in_money);
                if (yn==1)
                {
                    System.out.println("交易成功");
                }

            }
        }

        else
        {                       //数量大于当前仓库库存    去其他仓库取
            yn=0;
            System.out.println("数量大于当前仓库库存    去其他仓库取");
            ArrayList<item> iii = new ArrayList<item>();
            int count=0;
            String sql = "select * from store,price where price.itemId = store.itemId and store.itemId = '"+item.getItemId()+"'";
            rs1 = stmt.executeQuery(sql);
            while (rs1.next())
            {
                item i = new item();
                i.setItemId(rs1.getString("itemId"));
                i.setNumber(rs1.getString("number"));
                i.setStoreName(rs1.getString("storeName"));
                i.setItem(rs1.getString("item"));
                i.setOutPrice(rs1.getString("outPrice"));
                i.setBasePrice(rs1.getString("basePrice"));
                i.setUrl(rs1.getString("url"));
                iii.add((item) i);
                count+=Integer.parseInt(i.getNumber());
            }
            if (n<count)
            {                                          //如果数量小于总库存
                System.out.println("如果数量小于总库存");

                histories = (ArrayList<BuyHistory>) LoginAction.session.get("history");
                for (int i = 0; i < iii.size(); i++) {
                    if (Integer.parseInt(iii.get(i).getNumber()) < n)     //其中一个仓库库存不够
                    {
                        System.out.println("其中一个仓库库存不够");
                        n  -= Integer.parseInt(iii.get(i).getNumber());

                        float money = Float.parseFloat(iii.get(i).getNumber())*Float.parseFloat(iii.get(i).getOutPrice());

                        float true_money = Float.parseFloat(iii.get(i).getNumber())*(Float.parseFloat(iii.get(i).getOutPrice())-Float.parseFloat(iii.get(i).getBasePrice()));

                        String in_money1 = "update user,store set money=money+"+money+",in_money=in_money+"+money+",true_in_money=true_in_money+"+true_money+" where user.username=store.storeManager and store.storeName='"+iii.get(i).getStoreName()+"' ";
                        int rs_in = stmt.executeUpdate(in_money1);
                        if (rs_in==1)
                        {
                            System.out.println("仓库1交易成功");
                        }
                        BuyHistory bh2 = new BuyHistory();
                        bh2.setPay(money);
                        bh2.setStore(iii.get(i).getStoreName());
                        bh2.setUsername(user.getUsername());
                        bh2.setItem(iii.get(i).getItem());
                        bh2.setCount(Integer.parseInt(iii.get(i).getNumber())); //error
                        SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        bh2.setDate(df1.format(new Date()).toString());
                        if (bh2.getCount()!=0) {
                            histories.add(bh2);

                            String history = "insert into buy_history(username,item,count,date,store,pay) values('" + bh2.getUsername() + "','" + bh2.getItem() + "'," + bh2.getCount() + ",'" + bh2.getDate() + "','" + bh2.getStore() + "'," + bh2.getPay() + ")";

                            rs = stmt.executeUpdate(history);
                            if (rs == 1)
                                System.out.println("历史记录插入成功");
                            iii.get(i).setNumber("0");

                        }

                    } else {                                    //此时仓库库存数量大于n
                        System.out.println("此时仓库库存数量大于n");
                        iii.get(i).setNumber(String.valueOf(Integer.parseInt(iii.get(i).getNumber())-n));


                        float money = n*Float.parseFloat(iii.get(i).getOutPrice());
                        String x1 = iii.get(i).getOutPrice();
                        String x2=iii.get(i).getBasePrice();

                        float true_money = n*(Float.parseFloat(x1)-Float.parseFloat(x2));
                        String in_money2 = "update user,store set money=money+"+money+",in_money=in_money+"+money+",true_in_money=true_in_money+"+true_money+" where user.username=store.storeManager and store.storeName='"+iii.get(i).getStoreName()+"'";

                        int rs_in2 = stmt.executeUpdate(in_money2);
                        if (rs_in2==1)
                        {
                            System.out.println("仓库n交易成功");
                        }

                        BuyHistory bh1 = new BuyHistory();
                        bh1.setPay(money);
                        bh1.setStore(iii.get(i).getStoreName());
                        bh1.setUsername(user.getUsername());
                        bh1.setItem(iii.get(i).getItem());
                        bh1.setCount(n);
                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        bh1.setDate(df.format(new Date()).toString());

                        histories.add(bh1);
                        String history = "insert into buy_history(username,item,count,date,store,pay) values('"+bh1.getUsername()+"','"+bh1.getItem()+"',"+bh1.getCount()+",'"+bh1.getDate()+"','"+bh1.getStore()+"',"+bh1.getPay()+")";
                        rs = stmt.executeUpdate(history);
                        if (rs==1)
                            System.out.println("历史记录插入成功");

                    }
                }
                for (int i=0;i<iii.size();i++)      //修改session
                {
                    ArrayList<item> f = (ArrayList<item>) LoginAction.session.get("items");
                    for (int j=0;j<f.size();j++)
                    {
                        if (iii.get(i).getItemId().equals(f.get(j).getItemId()) && iii.get(i).getStoreName().equals(f.get(j).getStoreName()))
                        {
                            f.remove(j);
                            f.add(iii.get(i));
                        }
                    }
                    String sql2 = "update store set number='"+iii.get(i).getNumber()+"' where itemId='"+iii.get(i).getItemId()+"' and storeName = '"+iii.get(i).getStoreName()+"'";
                    int rs2=0;
                    rs2 = stmt.executeUpdate(sql2);
                    if (rs2==0)
                    {
                        System.out.println("修改错误！！");
                    }

                }
                LoginAction.session.replace("history",histories);
            }
            else                             //数量大于总库存
            {
                flag=0;
            }
        }

        if (yn==0&&flag==1||yn==1&&rs!=0) {
            user = (User) LoginAction.session.get("user");
            user.setMoney(user.getMoney()-n*Float.parseFloat(item.getOutPrice()));
            LoginAction.session.replace("user",user);

            user = (User) LoginAction.session.get("user");
            float money = user.getMoney()-n*Integer.parseInt(item.getOutPrice());
            float true_money = user.getMoney()-n*(Integer.parseInt(item.getOutPrice())-Integer.parseInt(item.getBasePrice()));
            String sql_money = "update user set money = "+money+",true_in_money = "+true_money+" where username = '"+user.getUsername()+"'";

            int rss = stmt.executeUpdate(sql_money);
            if (rss==1)
            {
                System.out.println("success");
            }
            return "success";
        }
        else
            return "error";
    }

}
