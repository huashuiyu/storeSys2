package test;

import PO.Student;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import utils.HbnUtils;

import java.util.Iterator;
import java.util.List;

public class StudentTest {
    private Session session;
    private ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
    @Before
    public void init(){session = (Session) ac.getBean("HbnUtils"); }
    @Test
    public void testSQLQuery(){
        try{
            session.beginTransaction();
            String sql = "select * from student";
            List<Student> studentList = session.createSQLQuery(sql).addEntity(Student.class).list();
            for(Student student:studentList){
                System.out.println(student);
            }
            //session.createSQLQuery(sql);
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
    @Test
    public void testHQLQuery(){
        try{
            session.beginTransaction();
            String hql = "from Student";
            List<Student> studentList = session.createQuery(hql).list();
            for(Student student:studentList){
                System.out.println(student);
            }
            //session.createSQLQuery(sql);
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
    @Test
    public void testHQLQuery_setParameter1(){
        try{
            session.beginTransaction();
            String hql = "from Student where studentID > :studentID and grade < :grade";
            List<Student> students = session.createQuery(hql)
                    .setParameter("studentID",8).setParameter("grade",6).list();
            for(Student student:students){
                System.out.println("testHQL_setParameter():"+student);
            }
            //session.createSQLQuery(sql);
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
    @Test
    public void testQBCQuery_setParameter(){
        try{
            session.beginTransaction();
            List<Student> students = session.createCriteria(Student.class)
                    .add(Restrictions.gt("age",20))
                    .add(Restrictions.gt("score",75.0)).list();
            for(Student student:students){
                System.out.println(student);
            }
            //session.createSQLQuery(sql);
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
    @Test
    public void testHQL_pages(){
        try{
            session.beginTransaction();
            String hql = "from Student";
            List<Student> students = session.createQuery(hql)
                    .setFirstResult(3).setMaxResults(5).list();
            for(Student student:students){
                System.out.println(student);
            }
            //session.createSQLQuery(sql);
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
    @Test
    public void testHQL_like(){
        try{
            String n = "3";
            session.beginTransaction();
            String hql = "from Student where username like :username";
            List<Student> students = session.createQuery(hql)
                    .setParameter("username","%"+n+"%").list();
            for(Student student:students){
                System.out.println(student);
            }
            //session.createSQLQuery(sql);
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
    @Test
    public void testHQL_uniqueResult(){
        try{
            session.beginTransaction();
            String hql = "from Student where id = ?1";
            Student student = (Student) session.createQuery(hql)
                    .setParameter(1,5).uniqueResult();
            System.out.println(student);
            //session.createSQLQuery(sql);
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
    @Test
    public void testHQL_count(){
        try{
            session.beginTransaction();
            String hql = "select count(*) from Student";
            Object total = session.createQuery(hql).uniqueResult();
            System.out.println("学生记录总数="+total);

            String hql2= "select count(username) from Student";
            Object total2 = session.createQuery(hql2).uniqueResult();
            System.out.println("学生姓名非空记录总数="+total2);

            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
    @Test
    public void testHQL_Projection(){
        try{
            session.beginTransaction();
            String hql = "select new Student(username,password) from Student";
            /*List<Student> students = session.createQuery(hql).list();
            for(Student student:students){
                System.out.println(student.getName()+","+student.getScore());
            }*/

            Iterator<Student> it = session.createQuery(hql).iterate();
            while(it.hasNext()){
                Student student = it.next();
                //System.out.println("iterate() 第一次查询"+student);
            }

            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
    @Test
    public void testHQL_GroupBy(){
        try{
            session.beginTransaction();
            String hql1 = "select studentID from Student group by grade";
            String hql2 = "select studentID from Student group by grade having count(grade) > ?1";
            List<Object> result1 = session.createQuery(hql1).list();
            for(Object object:result1){
                System.out.println(object+"\t");
            }

            List<Object> result2 = session.createQuery(hql2)
                    .setParameter(1,new Long(4)).list();
            for(Object object:result2){
                System.out.println(object);
            }

            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
    @Test
    public void testUpdate(){
        try{
            session.beginTransaction();
            String sql = "update Student set grade=30 where studentID=6";
            session.createQuery(sql).executeUpdate();

            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
    @Test
    public void delete(){
        String flag = "error";
        try{
            session.beginTransaction();
            Student s = new Student();
            s.setStudentID(12);
            session.delete(s);
            //session.createSQLQuery(sql);
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
    @Test
    public void testData(){
        try{
            session.beginTransaction();
            for(int i=0;i<10;i++){
                Student student = (Student) ac.getBean("student");
                student.setUsername("name_"+i);
                student.setPassword("12345");
                session.clear();
                session.save(student);
            }
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }

}
