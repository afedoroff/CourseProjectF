import dao.ParticipantDao;
import dao.ProjectDao;
import dao.TaskDao;
import models.Task;
import org.hibernate.Session;
import utils.HibernateSessionFactoryUtil;

public class Main {
    public static void main(String[] args) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
//        TaskDao.delById(1);
//        ParticipantDao.delById(1);
        ProjectDao.delById(1);
        session.close();
    }
}
