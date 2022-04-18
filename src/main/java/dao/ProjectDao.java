package dao;

import models.Participant;
import models.Project;
import models.Task;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateSessionFactoryUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectDao {
    public static void update(Project project) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(project);
        tx1.commit();
        session.close();
    }

    public static void save(Project project) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(project);
        tx1.commit();
        session.close();
    }
    public static Project findById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        Project auu = session.get(Project.class, idd);
        tx1.commit();
        session.close();
        return auu;
    }

    public static List<Project> findByIdList(List<Integer> idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        String hql = "SELECT p FROM Project p WHERE p.id IN :ids";
        List<Project> projects = session.createQuery(hql).setParameter("ids", idd).getResultList();
        tx1.commit();
        session.close();
        return projects;
    }

    public static void delById(int idd){
        String DB_URL = "jdbc:postgresql://localhost:5432/postgres";
        String USER = "postgres";
        String PASS = "123456";
        try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASS)){
            PreparedStatement preparedStatement = connection.prepareStatement("select task_id from task where project_id = ?");
            preparedStatement.setInt(1,idd);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                TaskDao.delById(resultSet.getInt(1));
            }
            preparedStatement = connection.prepareStatement("update participant set project_id = null where project_id = ?;");
            preparedStatement.setInt(1, idd);
            preparedStatement.execute();
            preparedStatement = connection.prepareStatement("delete from project where project_id = ?;");
            preparedStatement.setInt(1, idd);
            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException ex){
            ex.printStackTrace();
        }
//        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
//        Transaction tx1 = session.beginTransaction();
//        Project project = ProjectDao.findById(idd);
//        for (Task task: project.getTasks()) {
//            TaskDao.delById(task.getTask_id());
//        }
//        session.remove(project);
////        Project project = new Project();
////        project.setProject_id(idd);
////        session.remove(project);
//        tx1.commit();
//        session.close();
    }

    public static List<Task> findAll() {
        return HibernateSessionFactoryUtil
                .getSessionFactory()
                .openSession()
                .createQuery("from Project")
                .list();
    }
}
