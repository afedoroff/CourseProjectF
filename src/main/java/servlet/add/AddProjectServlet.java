package servlet.add;

import dao.ProjectDao;
import models.Project;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addProject")
public class AddProjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        Project project = new Project();
        project.setProject_id(ProjectDao.getMaxId()+1);
        project.setTitle(Utils.convertToUTF8(req.getParameter("title")));
        project.setDescription(Utils.convertToUTF8(req.getParameter("description")));
        ProjectDao.save(project);
        resp.sendRedirect("/mainPage");
    }
}
