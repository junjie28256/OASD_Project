package DaoImpl;

import DAO.DAO;
import DAO.PictureDAO;
import doamin.Picture;

import java.util.List;

public class PictureDAOImpl extends DAO<Picture> implements PictureDAO {
    @Override
    public void save(Picture picture) {
        String sql = "insert into picture(id, title, author, theme, description, nation, city, url, date, heat) values(?,?,?,?,?,?,?,?,?,?)";
        updata(sql,picture.getId(), picture.getTitle(), picture.getAuthor(),picture.getTheme(),picture.getDescription(),picture.getNation(),picture.getCity(),picture.getUrl(),picture.getDate(),picture.getHeat());
    }

    @Override
    public void delete(int id) {
        String sql = "delete from picture where id = ?";
        updata(sql,id);
    }

    @Override
    public Picture get(int id) {
        String sql = "SELECT * FROM picture WHERE id = ?";
        return get(sql,id);
    }

    @Override
    public List<Picture> getAll() {
        String sql = "select * from picture";
        return getAll(sql);
    }

    @Override
    public long getAllCount() {
        String sql = "select count(1) from picture";
        long count = getForValue(sql);
        return count;
    }

    @Override
    public List<Picture> getHottest() {
        String sql = "select * from picture order by heat desc limit 0,5";
        List<Picture> list = getAll(sql);
        return list;
    }

    @Override
    public List<Picture> getLatest() {
        String sql = "select * from picture order by id desc limit 0,5";
        List<Picture> list = getAll(sql);
        return list;
    }

    @Override
    public List<Picture> getLikeList(String model, String key,String sort) {
        String sql = "select * from picture where "+model+" like '%"+key+"%' order by "+ sort +"";
        List<Picture> list = getAll(sql);
        System.out.println(sql);
        return list;
    }

    @Override
    public List<Picture> getData(String model, String key, String sort,int min, int max) {
        String sql = "select * from picture where "+model+" like '%"+key+"%' order by "+sort +" limit "+ min +", "+ max +"";
        List<Picture> list = getAll(sql);
        System.out.println(sql);
        return list;
    }

    @Override
    public long getMaxPage(String model, String key, String sort,int rowsPerPage) {
        String sql = "select count(1) from picture where "+model+" like '%"+key+"%'";
        long count = getForValue(sql);
        long  page = (count + rowsPerPage -1) / rowsPerPage;
        return page;
//        return 0;
    }

    @Override
    public List<Picture> getMine(String author, int min, int max) {
        String sql = "select * from picture where author = '"+author+"' limit "+ min +", "+ max +"";
        List<Picture> list = getAll(sql);
        return list;
    }

    @Override
    public long getMinePage(String author, int rowsPerPage) {
        String sql = "select count(1) from picture where author = '"+author+"'";
        long count = getForValue(sql);
        long page = (count + rowsPerPage -1) / rowsPerPage;
        return page;
    }


}
