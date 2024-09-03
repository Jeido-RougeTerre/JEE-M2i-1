package controllers.cookies;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/get-cookies")
public class CookieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie cookie = new Cookie("isLogged", "true");
        Cookie cookie2 = new Cookie("perim", "true");
        cookie2.setMaxAge(60 * 60); // 1h
        resp.addCookie(cookie);
        resp.addCookie(cookie2);
    }
}
