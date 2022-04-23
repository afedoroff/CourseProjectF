package servlet.edit;

import dao.ProjectDao;
import models.Project;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editProject")
public class EditProjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        Project project = new Project();
        project.setProject_id(Integer.parseInt(req.getParameter("project_id")));
        project.setTitle(Utils.convertToUTF8(req.getParameter("title")));
        project.setDescription(Utils.convertToUTF8(req.getParameter("description")));
        ProjectDao.update(project);
        resp.sendRedirect("/mainPage");
    }
}
