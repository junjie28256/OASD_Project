package JunitTest;

import DaoImpl.UserDaoImpl;
import doamin.User;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class UserDaoImplTest {
    UserDaoImpl userDao = new UserDaoImpl();

    @org.junit.jupiter.api.Test
    void save() {
        User user = new User(2,"22","222","2222");
        long id = 3;
        user.setId(id);
        userDao.save(user);
    }

    @org.junit.jupiter.api.Test
    void get() {
        User user = userDao.get(55);
        System.out.println(user.toString());
    }

    @org.junit.jupiter.api.Test
    void getAll() {
        List<User> list = new ArrayList<>();
        list = userDao.getAll();
        for (User user:list){
            System.out.println(user.toString());
        }
    }

    @org.junit.jupiter.api.Test
    void delete() {
        userDao.delete(55);
    }

    @org.junit.jupiter.api.Test
    void getCountWithName() {
//        userDao.getCountWithName("1111");
        System.out.println(userDao.getCountWithName("1111"));
    }

    @org.junit.jupiter.api.Test
    void getAllCount() {
//        userDao.getCountWithName("1111");
        System.out.println(userDao.getAllCount());
    }

    @org.junit.jupiter.api.Test
    void getPasswordFromUsername() {
//        userDao.getCountWithName("1111");
        System.out.println(userDao.getPasswordFromUsername("88"));
    }

    @Test
    void tesGetIdFromUsername(){
        int id =  userDao.getIdFromUsername("77");
        System.out.println(id);
    }

}