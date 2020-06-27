package PO;

import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "student")
@Service("student")
public class Student {
    private int studentID;
    private String password;
    private String username;
    private String sex;
    private String university;
    private String grade;
    private String department;
    private String major;
    private Date birthday;

    public Student(){}
    public Student( String username, String password) {
        this.username = username;
        this.password = password;
        //this.studentID = studentID;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    @Override
    public String toString() {
        return "Student{" +
                "studentID=" + studentID +
                ", password='" + password + '\'' +
                ", username='" + username + '\'' +
                ", sex='" + sex + '\'' +
                ", university='" + university + '\'' +
                ", grade='" + grade + '\'' +
                ", department='" + department + '\'' +
                ", major='" + major + '\'' +
                ", birthday=" + birthday +
                '}';
    }
}
