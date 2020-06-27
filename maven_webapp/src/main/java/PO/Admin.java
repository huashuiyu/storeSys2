package PO;

import org.springframework.stereotype.Service;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "admin")
@Service("admin")
public class Admin {
    private int adminID;
    private String admin_name;
    private String admin_password;
    private String admin_roleid;
    private String admin_rolename;

    @Id
    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    public String getAdmin_roleid() {
        return admin_roleid;
    }

    public void setAdmin_roleid(String admin_roleid) {
        this.admin_roleid = admin_roleid;
    }

    public String getAdmin_rolename() {
        return admin_rolename;
    }

    public void setAdmin_rolename(String admin_rolename) {
        this.admin_rolename = admin_rolename;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminID=" + adminID +
                ", admin_name='" + admin_name + '\'' +
                ", admin_password='" + admin_password + '\'' +
                ", admin_roleid='" + admin_roleid + '\'' +
                ", admin_rolename='" + admin_rolename + '\'' +
                '}';
    }
}
