package servlet.edit;

import dao.ParticipantDao;
import dao.ProjectDao;
import models.Participant;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editParticipant")
public class EditParticipantServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        Participant participant = new Participant();
        participant.setName(Utils.convertToUTF8(req.getParameter("name")));
        participant.setSurname(Utils.convertToUTF8(req.getParameter("surname")));
        participant.setProject(ProjectDao.findById(Integer.parseInt(req.getParameter("project_id"))));
        ParticipantDao.update(participant);
        resp.sendRedirect("/mainPage");
    }
}
