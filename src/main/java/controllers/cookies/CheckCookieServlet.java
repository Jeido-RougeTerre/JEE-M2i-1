package controllers.cookies;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/have-cookies")
public class CheckCookieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<html><body>");

        boolean logged = false;
        Cookie[] cookies = req.getCookies();

        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("isLogged")) {
                logged = cookie.getValue().equals("true");
                break;
            }
        }

        if (logged) {
            out.println("<h1>Logged in</h1>");
        } else {
            out.println("<h1>Not logged</h1>");
        }

        out.println("<h2>You have " + cookies.length + " cookie(s)</h2>");

        out.println("</body></html>");

    }
}
