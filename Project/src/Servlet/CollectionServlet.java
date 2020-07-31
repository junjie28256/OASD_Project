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

//@WebServlet(name = "CollectionServlet")
public class CollectionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pictureId = Integer.parseInt(request.getParameter("pictureId"));
        System.out.println(pictureId);
        CollectionDao collectionDao = new CollectionDaoImpl();
        PictureDAO pictureDAO = new PictureDAOImpl();
        UserDAO userDAO = new UserDaoImpl();
        String username = null;
        int userId;
        Cookie[] cookies = request.getCookies();
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
        userId = userDAO.getIdFromUsername(username);
        System.out.println(userId);
        int flag = (int) collectionDao.getCountByUserIDAndPicID(userId,pictureId);
        if(flag == 1){
            System.out.println("你已收藏该图片");
        }else {
            int nextId = (int) (collectionDao.getAllCount()+1);
            System.out.println(nextId);
            collectionDao.save(nextId,userId,pictureId);
            pictureDAO.AddHeat(pictureId);
        }
        response.sendRedirect("Details?id="+pictureId);
    }
}
