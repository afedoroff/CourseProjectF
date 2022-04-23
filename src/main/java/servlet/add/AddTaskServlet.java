package servlet.add;

import dao.ParticipantDao;
import dao.ProjectDao;
import dao.TaskDao;
import models.Participant;
import models.Task;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/addTask")
public class AddTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            resp.setContentType("text/html");
            Date date = new SimpleDateFormat("dd/MM/yyyy").parse(req.getParameter("deadline"));
            String description = Utils.convertToUTF8(req.getParameter("description"));
            String priority = Utils.convertToUTF8(req.getParameter("priority"));
            String status = Utils.convertToUTF8(req.getParameter("status"));
            String title = Utils.convertToUTF8(req.getParameter("title"));
            String[] participant = req.getParameterValues("participant_id");

            Task task = new Task();
            task.setTask_id(TaskDao.getMaxId());
            task.setDeadline(date);
            task.setDescription(description);
            task.setPriority(priority);
            task.setStatus(status);
            task.setTitle(title);
            task.setProject(ProjectDao.findById(Integer.parseInt(req.getParameter("project_id"))));

            List<Integer> list = new ArrayList<>();
            for (String s : participant) {
                list.add(Integer.parseInt(s));
            }
            List<Participant> participants = ParticipantDao.findByIdList(list);
            Set<Participant> participantSet = new HashSet<>(participants);
            task.setParticipants(participantSet);

            TaskDao.save(task);
            resp.sendRedirect("/mainPage");

        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
}
