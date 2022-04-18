package servlet.add;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class AddParticipantServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        try {
            resp.setContentType("text/html");
            Date date = new SimpleDateFormat("dd/MM/yyyy").parse(req.getParameter("deadline"));
            String description = req.getParameter("description");
            String priority = req.getParameter("priority");
            String status = req.getParameter("status");
            String title = req.getParameter("title");
            //узнать насчет передаваемых тасок

        } catch (ParseException e) {
            e.printStackTrace();
        }

    }
}
