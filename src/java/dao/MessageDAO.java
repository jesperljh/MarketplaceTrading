/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Comment;
import entity.Message;
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
public class MessageDAO {
    public static ArrayList<Message> retrieveMessage(String user) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Message> messageList = new ArrayList<Message>();
        
        try {
            
            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from message where sender = ? OR receiver = ?");
            stmt.setString(1, user);
            stmt.setString(2, user);
            rs = stmt.executeQuery();

            while (rs.next()) {

                int message_id = rs.getInt("message_id");
                String title = rs.getString("title");
                String sender = rs.getString("sender");
                String receiver = rs.getString("receiver");
                String message = rs.getString("message");
                Date message_date = rs.getTimestamp("message_date");
                

                Message m = new Message(message_id, title, sender, receiver, message, message_date);
                
                messageList.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }

        return messageList;
    }
    
    public static void addMessage(String sender , String receiver, String title, String message) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = ConnectionManager.getConnection();
            StringBuffer sql = new StringBuffer("INSERT INTO message (sender, receiver, title, message, message_date) VALUES (?,?,?,?,?)");

            ps = conn.prepareStatement(sql.toString());

            ps.setString(1, sender);
            ps.setString(2, receiver);
            ps.setString(3, title);
            ps.setString(4, message);
            java.util.Date today = new java.util.Date();
            ps.setDate(5, new java.sql.Date(today.getTime()));

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
