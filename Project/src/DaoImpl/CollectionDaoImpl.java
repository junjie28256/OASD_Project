package DaoImpl;

import DAO.DAO;
import DAO.CollectionDao;
import DAO.PictureDAO;
import doamin.Collection;
import doamin.Picture;

import java.util.ArrayList;
import java.util.List;

public class CollectionDaoImpl extends DAO<Collection> implements CollectionDao {
    @Override
    public List<Collection> getAllCollection(int userID) {
        String sql = "select * from collection where userId = " + userID;
        return getAll(sql);
    }

    @Override
    public long getAllCount() {
        String sql = "select count(1) from collection";
        return getForValue(sql);
    }

    @Override
    public long getCountByUserIDAndPicID(int userId, int pictureId) {
        String sql = "select count(1) from collection where userId = "+userId+" and pictureId = "+pictureId;
        long count = getForValue(sql);
        return count;
    }

    @Override
    public void save(int nextId, int userId, int pictureId) {
        String sql = "insert into collection(id, userId, pictureId) values(?,?,?)";
        updata(sql,nextId, userId, pictureId);
    }

    @Override
    public List<Picture> getCollection(int userId, int min, int perPage) {
        PictureDAO pictureDAO = new PictureDAOImpl();
        String sql = "select * from collection where userId = '"+userId+"' limit "+ min +", "+ perPage +"";
        List<Collection> list = getAll(sql);
        List<Picture> list1 = new ArrayList<>();
        for(Collection collection:list){
            Picture picture = pictureDAO.get(collection.getPictureId());
            list1.add(picture);
        }
        return list1;
    }

    @Override
    public long getPage(int userId,int rowsPerPage) {
        String sql = "select count(1) from collection where userId = '"+userId+"'";
        long count = getForValue(sql);
        long page = (count + rowsPerPage -1) / rowsPerPage;
        return page;
    }

    @Override
    public void delete(int userId, int pictureId) {
        String sql = "delete from collection where userId = ? and pictureId = ?";
        updata(sql,userId,pictureId);
    }

}
