package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "variableServlet", value = "/variables")
public class VariablesServlet extends HttpServlet {
    private String prenom;
    private String nom;
    private List<String> listPrenom;

    @Override
    public void init() throws ServletException {
        prenom = "John";
        nom = "Doe";
        listPrenom = new ArrayList<String>();
        listPrenom.add(prenom);
        listPrenom.add("michel");
        listPrenom.add("forever");
        listPrenom.add("tonight");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("prenom", prenom);
        req.setAttribute("nom", nom);
        req.setAttribute("prenoms", listPrenom);

        req.getRequestDispatcher("/WEB-INF/variable.jsp").forward(req, resp);
    }
}
