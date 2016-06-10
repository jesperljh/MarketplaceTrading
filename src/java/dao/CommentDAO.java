/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Comment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import utility.ConnectionManager;

/**
 *
 * @author jesperlim
 */
public class CommentDAO {
    
    public static ArrayList<Comment> retrieveComments(int product_id) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Comment> comments = new ArrayList<Comment>();
        
        try {
            
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from comments where product_id = ?");
            stmt.setInt(1, product_id);
            rs = stmt.executeQuery();

            while (rs.next()) {

                int comment_id = rs.getInt("comment_id");
                String comment_string = rs.getString("comment_string");
                String comment_by = rs.getString("comment_by");
                Date comment_date = rs.getDate("comment_date");

                Comment comment = new Comment(comment_id, product_id, comment_string, comment_by, comment_date);
                
                comments.add(comment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }

        return comments;
    }

    public void addComment(int product_id, String comment_string, String comment_by) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = ConnectionManager.getConnection();
            StringBuffer sql = new StringBuffer("INSERT INTO comments (product_id, comment_string, comment_by, comment_date) VALUES (?,?,?,?)");

            ps = conn.prepareStatement(sql.toString());

            ps.setInt(1, product_id);
            ps.setString(2, comment_string);
            ps.setString(3, comment_by);
            java.util.Date today = new java.util.Date();
            ps.setDate(4, new java.sql.Date(today.getTime()));

            int i = ps.executeUpdate();
            System.out.println(i + " row updated!");

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, ps, null);
        }
        
        //retrieveComments(product_id);
    }
}
