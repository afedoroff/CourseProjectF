package servlet;

import dao.ParticipantDao;
import dao.ProjectDao;
import dao.TaskDao;
import models.Participant;
import models.Project;
import models.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/mainPage")
public class MainPageServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    List<Participant> listParticipant = ParticipantDao.findAll();
    List<Project> listProject = ProjectDao.findAll();
    List<Task> listTask = TaskDao.findAll();
    req.setAttribute("listParticipant", listParticipant);
    req.setAttribute("listProject", listProject);
    req.setAttribute("listTask", listTask);
    req.setAttribute("listTask", listTask);

    req.getRequestDispatcher("/MainPage.jsp").forward(req,resp);
  }
}
