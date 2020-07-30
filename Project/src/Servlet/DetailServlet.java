package Servlet;

import DAO.PictureDAO;
import DaoImpl.PictureDAOImpl;
import doamin.Picture;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet(name = "DetailServlet")
public class DetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PictureDAO pictureDAO = new PictureDAOImpl();
        String temp = request.getParameter("id");
        int id = Integer.parseInt(temp);
        Picture picture = pictureDAO.get(id);
        request.setAttribute("picture",picture);
        request.getRequestDispatcher("Details.jsp").forward(request,response);
//        System.out.println("getid");
//        System.out.println(picture.toString());
    }
}
