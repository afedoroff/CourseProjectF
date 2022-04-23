package dao;

import models.Task;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import utils.HibernateSessionFactoryUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class TaskDao {
    public static void update(Task task) {
        try(Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()) {
            Transaction tx1 = session.beginTransaction();
            session.update(task);
            tx1.commit();
        }
    }

    public static void save(Task task) {
        try(Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()) {
            Transaction tx1 = session.beginTransaction();
            session.save(task);
            tx1.commit();
        }
    }
    public static Task findById(int idd){
        try(Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()) {
            Transaction tx1 = session.beginTransaction();
            Task auu = session.get(Task.class, idd);
            tx1.commit();
            return auu;
        }
    }

    public static List<Task> findByIdList(List<Integer> idd){
        try(Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()) {
            Transaction tx1 = session.beginTransaction();
            String hql = "SELECT p FROM Task p WHERE p.id IN :ids";
            List<Task> tasks = session.createQuery(hql).setParameter("ids", idd).getResultList();
            tx1.commit();
            return tasks;
        }
    }

    public static int getMaxId(){
        try(Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession()) {
            String SQL_QUERY = "select max(task_id)from Task ";
            Query query = session.createQuery(SQL_QUERY);
            List list = query.list();
            return (int) list.get(0);
        }
    }

    public static void delById(int idd){
        String DB_URL = "jdbc:postgresql://localhost:5432/postgres";
        String USER = "postgres";
        String PASS = "123456";
        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASS)){
            PreparedStatement preparedStatement = connection.prepareStatement("delete from task_participant where task_id = ?;");
            preparedStatement.setInt(1, idd);
            preparedStatement.execute();
            preparedStatement = connection.prepareStatement("delete from task where task_id = ?;");
            preparedStatement.setInt(1, idd);
            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException ex){
            ex.printStackTrace();
        }
    }

    public static List<Task> findAll() {
        return HibernateSessionFactoryUtil
                .getSessionFactory()
                .openSession()
                .createQuery("from Task")
                .list();
    }
}
