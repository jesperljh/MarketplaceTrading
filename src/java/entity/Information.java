/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author jesperlim
 */
public class Information {
    private int id;
    private String title;
    private String username;
    private String information_string;
    private int information_id;
    private Date post_date;

    public Information(int id, String title, String username, String information_string, int information_id, Date post_date) {
        this.id = id;
        this.title = title;
        this.username = username;
        this.information_string = information_string;
        this.information_id = information_id;
        this.post_date = post_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getInformation_string() {
        return information_string;
    }

    public void setInformation_string(String information_string) {
        this.information_string = information_string;
    }

    public int getInformation_id() {
        return information_id;
    }

    public void setInformation_id(int information_id) {
        this.information_id = information_id;
    }

    public Date getPost_date() {
        return post_date;
    }

    public void setPost_date(Date post_date) {
        this.post_date = post_date;
    }
    
    
}
