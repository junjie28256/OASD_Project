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

//@WebServlet(name = "UploadServlet")
public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PictureDAO pictureDAO = new PictureDAOImpl();
        String pictureId = request.getParameter("pictureId");
        if(pictureId == null){
            request.setAttribute("picture",null);
        }else {
            int id = Integer.parseInt(pictureId);
            Picture picture = pictureDAO.get(id);
            request.setAttribute("picture",picture);
        }
        request.getRequestDispatcher("tttt.jsp").forward(request,response);
    }
}
