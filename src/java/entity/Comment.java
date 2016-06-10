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
public class Comment {
    private int comment_id;
    private int product_id;
    private String comment_string;
    private String comment_by;
    private Date comment_date;

    public Comment(int comment_id, int product_id, String comment_string, String comment_by, Date comment_date) {
        this.comment_id = comment_id;
        this.product_id = product_id;
        this.comment_string = comment_string;
        this.comment_by = comment_by;
        this.comment_date = comment_date;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getComment_string() {
        return comment_string;
    }

    public void setComment_string(String comment_string) {
        this.comment_string = comment_string;
    }

    public String getComment_by() {
        return comment_by;
    }

    public void setComment_by(String comment_by) {
        this.comment_by = comment_by;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }
    
    
}
