import dao.TaskDao;
import models.Participant;
import models.Task;
import org.hibernate.Session;
import utils.HibernateSessionFactoryUtil;

import java.util.List;
import java.util.Set;

public class Main {
    public static void main(String[] args) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        String task = TaskDao.findById(4).getArrayProjectId();
        session.close();
    }
}
