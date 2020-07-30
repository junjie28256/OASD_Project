package DAO;

import doamin.Picture;

import java.util.List;

public interface PictureDAO {
    public void save(Picture picture);

    public void delete(int id);

    public Picture get(int id);

    public List<Picture> getAll();

    public long getAllCount();

    public List<Picture> getHottest();

    public List<Picture> getLatest();

    public List<Picture> getLikeList(String model, String key, String sort);

    public List<Picture> getData(String model, String key, String sort,int min,int max);

    public long getMaxPage(String model, String key, String sort,int rowsPerPage);

    public List<Picture> getMine(String author,int min, int max);

    public long getMinePage(String author, int rowsPerPage);
}
