package Servlet;

import DAO.CollectionDao;
import DAO.PictureDAO;
import DAO.UserDAO;
import DaoImpl.CollectionDaoImpl;
import DaoImpl.PictureDAOImpl;
import DaoImpl.UserDaoImpl;
import doamin.Picture;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
        System.out.println(id);

        UserDAO userDAO = new UserDaoImpl();
        CollectionDao collectionDao = new CollectionDaoImpl();
        System.out.println("tag1");
        int userId = 0;
        String username = "sfaf";
        Cookie[] cookies = request.getCookies();
        System.out.println("tag2");
        if(cookies != null && cookies.length > 0){
            String name;
            for (Cookie cookie:cookies){
                name = cookie.getName();
                if(name.equals("USERID"))
                    username = cookie.getValue();
            }
        }else {
            System.out.println("未检索到用户");
        }
        System.out.println("tag3");
        userId = userDAO.getIdFromUsername(username);
        int flag = (int) collectionDao.getCountByUserIDAndPicID(userId,id);
        System.out.println("tag4");
        if(flag == 1){
            request.setAttribute("flag",1);
        }else {
            request.setAttribute("flag",0);
        }

        Picture picture = pictureDAO.get(id);
        request.setAttribute("picture",picture);
        System.out.println(picture.toString());



        request.getRequestDispatcher("Details.jsp").forward(request,response);
//        System.out.println("getid");
//        System.out.println(picture.toString());
    }
}
