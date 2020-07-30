package com;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ShowPhotoServlet extends HttpServlet{
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        String filename = request.getParameter("filename").toString();
        response.sendRedirect("showphoto.jsp?filename="+filename);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        String filename = request.getAttribute("filename").toString();
        request.setAttribute("filename", filename);
        request.getRequestDispatcher("showphoto.jsp").forward(request, response);
    }
}