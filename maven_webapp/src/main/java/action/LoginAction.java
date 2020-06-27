package action;

import PO.Admin;
import PO.Student;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import utils.HbnUtils;


import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.*;
import javax.servlet.http.HttpSession;

public class LoginAction extends ActionSupport implements SessionAware
{
    private ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
    private Admin admin = (Admin)ac.getBean("admin"); //模型驱动
    private Student student = (Student)ac.getBean("student");
    private Session Fsession;
    private int ID;
    //private Student stu = (Student) ac.getBean("student");
    private String likename;
    private Student updatestu = (Student) ac.getBean("student");
    private Student updatestu2 = (Student) ac.getBean("student");

    public static Map<String, Object> session;


    @Test
    public void testSQLQuery(){
        String flag = "error";
        try{
            Fsession = (Session)ac.getBean("HbnUtils");
            Fsession.beginTransaction();
            String sql = "select * from admin";
            List<Admin> adminList = Fsession.createSQLQuery(sql).addEntity(ac.getBean("admin").getClass()).list();//Admin.class
            for(Admin admins:adminList){
                if (admin.getAdmin_name().equals(admins.getAdmin_name())&&admin.getAdmin_password().equals(admins.getAdmin_password())){//admins.getAdmin_name()  admins.getAdmin_password()
                    flag = "success";
                    System.out.println(admins);
                }
            }

            //session.createSQLQuery(sql);
            Fsession.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            Fsession.getTransaction().rollback();
        }

    }
    @Override
    public String execute(){
        String flag = "error";
        try{
            Fsession = (Session)ac.getBean("HbnUtils");
            Fsession.beginTransaction();
            String sql = "select * from admin";
            String sql2 = "select * from student";
            List<Admin> adminList = Fsession.createSQLQuery(sql).addEntity(Admin.class).list();
            List<Student> studentList = Fsession.createSQLQuery(sql2).addEntity(Student.class).list();
            List<Student> likeList = null;//模糊查询结果放置位置
            session.put("like",likeList);//初始化likr
            //session.put("studentList",likeList);//初始化studentList

            session.put("studentList",studentList);
            for(Admin admins:adminList){
                if (admin.getAdmin_name().equals(admins.getAdmin_name())&&admin.getAdmin_password().equals(admins.getAdmin_password())){
                    flag = "success";
                    System.out.println(admins);
                    session.put("admin",admins);
                }
            }
            Fsession.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            Fsession.getTransaction().rollback();
        }
        if(flag.equals("error"))
            return "error";
        else
            return "success";

    }

    public String add(){
        String flag = "success";

        try{
            System.out.println(student.getUsername()+" +++ "+student.getPassword());
            Fsession = (Session)ac.getBean("HbnUtils");
            Fsession.beginTransaction();
            //String sql = "select * from student";
            //List<Student> sList = Fsession.createSQLQuery(sql).addEntity(Student.class).list();
            List<Student> studentList = (List<Student>)session.get("studentList");
            for(Student students:studentList){
                if (student.getUsername().equals(students.getUsername())&&student.getPassword().equals(students.getPassword())){
                    flag = "error";
                    System.out.println(student.getUsername()+" already exist");
                    break;
                    //session.put("student",students);
                }
            }
            if (flag.equals("success")){
                System.out.println("..............."+student);
                Student s = (Student) ac.getBean("student");
                s.setUsername(student.getUsername());
                s.setPassword(student.getPassword());
                Fsession.save(s);
                student.setStudentID(studentList.get(studentList.size() - 1).getStudentID()+1);
                studentList.add(student);
                session.replace("studentList",studentList);
            }
            Fsession.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            Fsession.getTransaction().rollback();
        }
        if(flag.equals("error"))
            return "error";
        else
            return "success";
    }

    public String delete(){
        //String flag = "error";
        //System.out.println(ID);
        try{
            Fsession = (Session)ac.getBean("HbnUtils");
            Fsession.beginTransaction();
            Student s = (Student)ac.getBean("student");
            s.setStudentID(ID);
            Fsession.delete(s);
            List<Student> stList = (List<Student>)session.get("studentList");
            for(Student students:stList){
                if(students.getStudentID()==ID){
                    stList.remove(students);
                    session.replace("studentList",stList);
                    break;
                }
            }
            System.out.println("student "+ID+" has been delete");
            //session.createSQLQuery(sql);
            Fsession.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            Fsession.getTransaction().rollback();
        }
        return "success";
    }

    public String toupdate(){
        List<Student> stList = (List<Student>)session.get("studentList");
        for(Student students:stList){
            if(students.getStudentID()==ID){
                session.put("update",students);
                break;
            }
        }
        return "success";
    }
    public String update(){
        try{
            Fsession = (Session)ac.getBean("HbnUtils");
            Fsession.beginTransaction();
            updatestu=(Student)session.get("update");
            updatestu2.setStudentID(updatestu.getStudentID());
            System.out.println(updatestu);
            System.out.println(updatestu2);
            /*Date d = new Date();
            updatestu.setBirthday(d);
            updatestu.setSex("null");
            updatestu.setUniversity("null");*/
            List<Student> stList = (List<Student>)session.get("studentList");
            for(Student students:stList){
                int n = stList.size();
                if(students.getStudentID()==updatestu.getStudentID()){
                    stList.remove(students);
                    stList.add(n-1,updatestu2);
                    session.replace("studentList",stList);
                    break;
                }
                n--;
            }
            Fsession.update(updatestu2);
            Fsession.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            Fsession.getTransaction().rollback();
        }
        return "success";
    }

    public String selectLike(){
        String flag = "success";
        System.out.println(likename);
        try{
            Fsession = (Session)ac.getBean("HbnUtils");
            Fsession.beginTransaction();
            String hql = "from Student where username like :username";
            List<Student> students = Fsession.createQuery(hql)
                    .setParameter("username","%"+likename+"%").list();
            /*if (students == null){
                flag = "error";
            }*/
            for (Student student:students){
                System.out.println(student);
            }
            session.put("like",students);
            Fsession.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            Fsession.getTransaction().rollback();
        }
        if(flag.equals("error"))
            return "error";
        else
            return "success";
    }

    public void setSession(Map<String, Object> session) {
        this.session=session ;
    }
    public Admin getAdmin(){return admin;}
    public void setAdmin(Admin admin){this.admin = admin;}
    public Student getStudent(){return student;}
    public void setStudent(Student student){this.student = student;}
    public int getID(){return ID;}
    public void setID(int ID) {
        this.ID = ID;
    }

    public String getLikename() {
        return likename;
    }

    public void setLikename(String likename) {
        this.likename = likename;
    }

    public Student getUpdatestu() {
        return updatestu;
    }

    public void setUpdatestu(Student updatestu) {
        this.updatestu = updatestu;
    }

    public Student getUpdatestu2() {
        return updatestu2;
    }

    public void setUpdatestu2(Student updatestu2) {
        this.updatestu2 = updatestu2;
    }
}

