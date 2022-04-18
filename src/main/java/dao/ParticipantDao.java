package dao;

import models.Participant;
import models.Task;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateSessionFactoryUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ParticipantDao {
    public static void update(Participant participant) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(participant);
        tx1.commit();
        session.close();
    }

    public static void save(Participant participant) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(participant);
        tx1.commit();
        session.close();
    }
    public static Participant findById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        Participant auu = session.get(Participant.class, idd);
        tx1.commit();
        session.close();
        return auu;
    }

    public static List<Participant> findByIdList(List<Integer> idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        String hql = "SELECT p FROM Participant p WHERE p.id IN :ids";
        List<Participant> participants = session.createQuery(hql).setParameter("ids", idd).getResultList();
        tx1.commit();
        session.close();
        return participants;
    }

    public static void delById(int idd){
        String DB_URL = "jdbc:postgresql://localhost:5432/postgres";
        String USER = "postgres";
        String PASS = "123456";
        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASS)){
            PreparedStatement preparedStatement = connection.prepareStatement("delete from task_participant where participant_id = ?;");
            preparedStatement.setInt(1, idd);
            preparedStatement.execute();
            preparedStatement = connection.prepareStatement("delete from participant where participant_id = ?;");
            preparedStatement.setInt(1, idd);
            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException ex){
            ex.printStackTrace();
        }
//        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
//        Transaction tx1 = session.beginTransaction();
////        Participant participant = ParticipantDao.findById(idd);
////        for (Task task: participant.getTasks()) {
////            participant.removeTask(task);
////        }
////        session.remove(participant);
//        Participant participant = new Participant();
//        participant.setParticipant_id(idd);
//        session.remove(participant);
//        tx1.commit();
//        session.close();
    }

    public static List<Task> findAll() {
        return HibernateSessionFactoryUtil
                .getSessionFactory()
                .openSession()
                .createQuery("from Participant")
                .list();
    }
}
