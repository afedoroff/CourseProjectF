import org.hibernate.Session;
import utils.HibernateSessionFactoryUtil;

public class Main {
    public static void main(String[] args) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        session.close();
    }
}
