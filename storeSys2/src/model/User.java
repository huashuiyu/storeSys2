package model;

public class User {
    private String username;
    private String password;
    private String power;//权限
    private float money;
    private float in_money;
    private float true_in_money;
    public float getMoney() {
        return money;
    }

    public void setMoney(float money) {
        this.money = money;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power;
    }

    public float getIn_money() {
        return in_money;
    }

    public void setIn_money(float in_money) {
        this.in_money = in_money;
    }

    public float getTrue_in_money() {
        return true_in_money;
    }

    public void setTrue_in_money(float true_in_money) {
        this.true_in_money = true_in_money;
    }
}