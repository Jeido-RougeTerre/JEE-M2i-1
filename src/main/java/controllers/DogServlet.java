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

@WebServlet(name = "dog-servlet", value = "/dog/*")
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
            case "/addForm" -> addForm(req, resp);
            case "/add" -> add(req, resp);
            case "/info" -> info(req, resp);
            default -> list(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("dogs", dogService.findAll());
        req.getRequestDispatcher("/WEB-INF/dog-list.jsp").forward(req, resp);
    }

    protected void addForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Dog dog = Dog.builder().name("").breed("").birthDate(LocalDate.now()).build();
        req.setAttribute("dog", dog);
        req.setAttribute("mode", "add");
        req.getRequestDispatcher("/WEB-INF/dog-form.jsp").forward(req, resp);
    }

    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String breed = req.getParameter("breed");
        LocalDate birthDate = LocalDate.parse(req.getParameter("birthDate"));

        dogService.create(name, breed, birthDate);

        resp.sendRedirect("list");
    }

    protected void info(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Dog dog = dogService.findById(id);

        req.setAttribute("dog", dog);
        req.setAttribute("mode", "view");
        req.getRequestDispatcher("/WEB-INF/dog-form.jsp").forward(req, resp);
    }

}
