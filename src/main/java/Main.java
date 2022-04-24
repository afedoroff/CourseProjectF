import dao.TaskDao;
import models.Task;
import org.hibernate.Session;
import utils.HibernateSessionFactoryUtil;

public class Main {
    public static void main(String[] args) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Task task = TaskDao.findById(1);
        session.close();
    }
}
