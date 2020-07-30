package doamin;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

//@Entity
public class Picture {
    private long id;
    private String title;
    private String author;
    private String theme;
    private String description;
    private String nation;
    private String city;
    private String url;
    private String date;
    private Integer heat;

    public Picture() {
    }

    public Picture(long id, String title, String author, String theme, String description, String nation, String city, String url, String date, Integer heat) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.theme = theme;
        this.description = description;
        this.nation = nation;
        this.city = city;
        this.url = url;
        this.date = date;
        this.heat = heat;
    }

    @Id
    @Basic
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "author")
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Basic
    @Column(name = "theme")
    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "nation")
    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    @Basic
    @Column(name = "city")
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "url")
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Basic
    @Column(name = "date")
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Basic
    @Column(name = "heat")
    public Integer getHeat() {
        return heat;
    }

    public void setHeat(Integer heat) {
        this.heat = heat;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Picture picture = (Picture) o;
        return Objects.equals(id, picture.id) &&
                Objects.equals(author, picture.author) &&
                Objects.equals(theme, picture.theme) &&
                Objects.equals(description, picture.description) &&
                Objects.equals(nation, picture.nation) &&
                Objects.equals(city, picture.city) &&
                Objects.equals(url, picture.url) &&
                Objects.equals(date, picture.date) &&
                Objects.equals(heat, picture.heat);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, author, theme, description, nation, city, url, date, heat);
    }

    @Override
    public String toString() {
        return "Picture{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", theme='" + theme + '\'' +
                ", description='" + description + '\'' +
                ", nation='" + nation + '\'' +
                ", city='" + city + '\'' +
                ", url='" + url + '\'' +
                ", date='" + date + '\'' +
                ", heat=" + heat +
                '}';
    }
}
