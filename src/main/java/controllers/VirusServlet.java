package controllers;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "virusServlet", value = "/totaly_not_a_virus")
public class VirusServlet extends HttpServlet {

    private String virus;

    public void init() {
        virus = "Haha i'm a virus 😜";
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("plain/text");
        PrintWriter out = resp.getWriter();
        out.println(virus);
    }
}
