package controllers;

import entities.Dog;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.DogService;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "dog-servlet", value= "/dog/*")
public class DogServlet extends HttpServlet {

    private DogService dogService;

    public void init() {
        dogService = new DogService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = (req.getPathInfo() == null || req.getPathInfo().substring(1).isEmpty() ? "" : req.getPathInfo());

        System.out.println(pathInfo);

        switch (pathInfo) {
            case "/list":
                req.setAttribute("dogs", dogService.findAll());
                req.getRequestDispatcher("/WEB-INF/dog-list.jsp").forward(req,resp);
                break;
            case "/add":
                req.getRequestDispatcher("/WEB-INF/dog-add.jsp").forward(req,resp);
                break;
            default:
                try {
                    int id = Integer.parseInt(pathInfo.substring(1));
                    Dog dog = dogService.findById(id);
                    req.setAttribute("dog", dog);
                    req.getRequestDispatcher("/WEB-INF/dog-info.jsp").forward(req,resp);

                } catch (NumberFormatException e) {
                    resp.sendRedirect("/dog/list");
                }
                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        dogService.create(
                req.getParameter("name"),
                req.getParameter("breed"),
                LocalDate.parse(req.getParameter("birthDate"))
        );

        doGet(req,resp);
    }

}
