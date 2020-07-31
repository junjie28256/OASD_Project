package Servlet;

import DAO.PictureDAO;
import DaoImpl.PictureDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet(name = "DeleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PictureDAO pictureDAO = new PictureDAOImpl();
        int id = Integer.parseInt(request.getParameter("pictureId"));
        pictureDAO.delete(id);
        response.sendRedirect("myUpload");
    }
}
