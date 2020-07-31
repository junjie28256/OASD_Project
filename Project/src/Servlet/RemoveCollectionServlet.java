package Servlet;

import DAO.CollectionDao;
import DAO.PictureDAO;
import DAO.UserDAO;
import DaoImpl.CollectionDaoImpl;
import DaoImpl.PictureDAOImpl;
import DaoImpl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet(name = "RemoveCollectionServlet")
public class RemoveCollectionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        PictureDAO pictureDAO = new PictureDAOImpl();
        CollectionDao collectionDao = new CollectionDaoImpl();
        UserDAO userDAO = new UserDaoImpl();
        int id = Integer.parseInt(request.getParameter("pictureId"));


        Cookie[] cookies = request.getCookies();
        String author = null;
        if(cookies != null && cookies.length > 0){
            String name;
            for (Cookie cookie:cookies){
                name = cookie.getName();
                if(name.equals("USERID")){
                    author = cookie.getValue();
                }
            }
        }
        if(author == null){
            System.out.println("未检测到用户信息");
        }

        int userId = userDAO.getIdFromUsername(author);



        collectionDao.delete(userId,id);
        response.sendRedirect("Mycollection");
    }
}
