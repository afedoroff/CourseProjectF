package servlet.add;

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

@WebServlet("/addParticipant")
public class AddParticipantServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        resp.setContentType("text/html");
        Participant participant = new Participant();
        participant.setParticipant_id(ParticipantDao.getMaxId()+1);
        participant.setName(Utils.convertToUTF8(req.getParameter("name")));
        participant.setSurname(Utils.convertToUTF8(req.getParameter("surname")));
        participant.setProject(ProjectDao.findById(Integer.parseInt(req.getParameter("project_id"))));
        ParticipantDao.save(participant);
        resp.sendRedirect("/mainPage");
    }
}
