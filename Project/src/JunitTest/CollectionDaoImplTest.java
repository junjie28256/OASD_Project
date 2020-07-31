package JunitTest;

import DAO.CollectionDao;
import DaoImpl.CollectionDaoImpl;
import doamin.Collection;
import doamin.Picture;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class CollectionDaoImplTest {

    CollectionDao collectionDao = new CollectionDaoImpl();
    @Test
    void getAllCollection() {
        List<Collection> list = collectionDao.getAllCollection(2);
        for (Collection collection:list){
            System.out.println(collection.getId());
        }
    }

    @Test
    void getAllCount(){
        int count = (int) collectionDao.getAllCount();
        System.out.println(count);
    }

    @Test
    void getCountByUserIdAndPicId(){
        long flag = collectionDao.getCountByUserIDAndPicID(2,7);
        System.out.println(flag);
    }

    @Test
    void save(){
        collectionDao.save(8,3,3);
    }

    @Test
    void getCollection(){
        List<Picture> list = collectionDao.getCollection(8,4,3);
        for (Picture picture:list){
            System.out.println(picture.getId());
        }
    }

    @Test
    void delete(){
        collectionDao.delete(8,45);
    }
}