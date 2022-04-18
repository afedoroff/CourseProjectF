package dao;

import models.Participant;
import models.Task;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateSessionFactoryUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class TaskDao {
    public static void update(Task task) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(task);
        tx1.commit();
        session.close();
    }

    public static void save(Task task) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(task);
        tx1.commit();
        session.close();
    }
    public static Task findById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        Task auu = session.get(Task.class, idd);
        tx1.commit();
        session.close();
        return auu;
    }

    public static List<Task> findByIdList(List<Integer> idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        String hql = "SELECT p FROM Task p WHERE p.id IN :ids";
        List<Task> tasks = session.createQuery(hql).setParameter("ids", idd).getResultList();
        tx1.commit();
        session.close();
        return tasks;
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
//        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
//        Transaction tx1 = session.beginTransaction();
////        Task task = TaskDao.findById(idd);
////        for (Participant participant: task.getParticipants()) {
////            task.removeParticipant(participant);
////        }
////        session.remove(task);
//        Task task = new Task();
//        task.setTask_id(idd);
//        session.remove(task);
//        tx1.commit();
//        session.close();
    }

    public static List<Task> findAll() {
        return HibernateSessionFactoryUtil
                .getSessionFactory()
                .openSession()
                .createQuery("from Task")
                .list();
    }
}
