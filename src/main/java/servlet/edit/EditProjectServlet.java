package servlet.edit;

import dao.ProjectDao;
import models.Project;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditProjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        Project project = new Project();
        project.setProject_id(Integer.parseInt(req.getParameter("project_id")));
        project.setTitle(req.getParameter("title"));
        project.setDescription(req.getParameter("description"));
        ProjectDao.update(project);
        resp.sendRedirect("/mainPage");
    }
}
