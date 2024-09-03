package controllers.session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/have-session")
public class CheckSessionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<html><body>");

        HttpSession session = req.getSession();

        boolean logged = session.getAttribute("isLogged") != null && (boolean) session.getAttribute("isLogged");

        if (logged) {
            out.println("<h1>Logged in</h1>");
        } else {
            out.println("<h1>Not logged</h1>");
        }

        long creationTime = session.getCreationTime();
        long lastAccessedTime = session.getLastAccessedTime();
        int maxInactiveInterval = session.getMaxInactiveInterval();

        long sessionDuration = (System.currentTimeMillis() - creationTime) / 1000; // sec

        long expirationTime = lastAccessedTime + (maxInactiveInterval * 1000L);
        Date expirationDate = new Date(expirationTime);

        out.println("<h2>Information</h2>");
        out.println("<h3>Last accessed: " + lastAccessedTime + "</h3>");
        out.println("<h3>Session duration: " + sessionDuration + "</h3>");
        out.println("<h3>Expiration date: " + expirationDate + "</h3>");


        out.println("</body></html>");
    }
}
