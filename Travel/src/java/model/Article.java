/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import org.apache.commons.lang3.StringEscapeUtils;

/**
 *
 * @author Phuc Do
 */
public class Article {

    private int id, view;
    private String title, content, link, thumbnail, longitude, latitude, locationDetail;
    private Timestamp created_at;
    private Category category;
    private ArrayList<Tag> tags = new ArrayList<>();

    public Article(int id, Category category, String title, String content, String link, String thumbnail, Timestamp created_at, int view) {
        this.id = id;
        this.category = category;
        this.title = title;
        this.content = content;
        this.link = link;
        this.thumbnail = thumbnail;
        this.created_at = created_at;
        this.view = view;
    }

    public Article(String title, String link, String idCategory, String thumbnail, String content) {
        Category category = new Category();
        category.setId(Integer.valueOf(idCategory));
        this.title = title;
        this.link = link;
        this.category = category;
        this.thumbnail = thumbnail;
        this.content = content;
    }

    public Article(int id, int view, String title, String content, String link, String thumbnail, String longitude, String latitude, String locationDetail, Timestamp created_at, Category category) {
        this.id = id;
        this.view = view;
        this.title = title;
        this.content = content;
        this.link = link;
        this.thumbnail = thumbnail;
        this.longitude = longitude;
        this.latitude = latitude;
        this.locationDetail = locationDetail;
        this.created_at = created_at;
        this.category = category;
    }
    
    
    
    public Article(String title, String link, String idCategory, String thumbnail, String content, String longitude, String latitude, String locationDetail) {
        Category category = new Category();
        category.setId(Integer.valueOf(idCategory));
        this.title = title;
        this.link = link;
        this.category = category;
        this.thumbnail = thumbnail;
        this.content = content;
        this.longitude = longitude;
        this.latitude = latitude;
        this.locationDetail = locationDetail;
    }
    
    

    public Article() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public ArrayList<Tag> getTags() {
        return tags;
    }

    public void setTags(ArrayList<Tag> tags) {
        this.tags = tags;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLocationDetail() {
        return locationDetail;
    }

    public void setLocationDetail(String locationDetail) {
        this.locationDetail = locationDetail;
    }
    
    

//    private int id, view;
//    private String title, content, link, thumbnail;
//    private Timestamp created_at;
//    private Category category;
    public String toDatatable() {
        String content = StringEscapeUtils.escapeHtml4(this.content).trim();
        String title = StringEscapeUtils.escapeHtml4(this.title).trim();
        String link = StringEscapeUtils.escapeHtml4(this.link).trim();
        String category = StringEscapeUtils.escapeHtml4(this.category.getName()).trim();
        String thumbnail = String.valueOf(this.thumbnail).replaceAll("\"", "\\\\\"");
        return "[\"" + id + "\",\"" + title + "\",\"" + link + "\",\"" + category + "\",\"" + content + "\",\""
                + thumbnail + "\",\"" + view + "\",\"" + created_at.toString() + "\"]";
    }

    @Override
    public String toString() {
        return "Article{" + "id=" + id + ", view=" + view + ", title=" + title + ", content=" + content + ", link=" + link + ", thumbnail=" + thumbnail + ", longitude=" + longitude + ", latitude=" + latitude + ", locationDetail=" + locationDetail + ", created_at=" + created_at + ", category=" + category + ", tags=" + tags + '}';
    }

    

    public static void main(String[] args) {
        String s = "<p>123456</p>";
        System.out.println(StringEscapeUtils.escapeHtml4(s));
    }

}
