package DAO;

import doamin.Collection;
import doamin.Picture;

import java.util.List;

public interface CollectionDao  {
    public List<Collection> getAllCollection(int userID);

    public long getAllCount();

    public long getCountByUserIDAndPicID(int userId, int pictureId);

    public void save(int nextId, int userId, int pictureId);

    public List<Picture> getCollection(int userId, int min, int perPage);

    public long getPage(int useerId, int perPage);

    public void delete(int userId, int pictureId);

}
