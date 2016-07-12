/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Information;
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
public class InformationDAO {
    public static ArrayList<Information> retrieveInformation() {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Information> infoList = new ArrayList<Information>();

        try {

            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from information where information_id is null");
            //stmt.setInt(1, information_id);
            rs = stmt.executeQuery();

            while (rs.next()) {
                
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String username = rs.getString("username");
                String information_string = rs.getString("information_string");
                //int info_id = rs.getInt("information_id");
                int info_id = 0;
                Date post_date = rs.getTimestamp("post_date");

                Information info = new Information(id, title, username, information_string, info_id, post_date);

                infoList.add(info);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }

        return infoList;
    }

    public static void addInformation(String title, String username, String information_string) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = ConnectionManager.getConnection();
            StringBuffer sql = new StringBuffer("INSERT INTO information (title, username, information_string, post_date) VALUES (?,?,?,?)");

            ps = conn.prepareStatement(sql.toString());

            ps.setString(1, title);
            ps.setString(2, username);
            ps.setString(3, information_string);
            java.util.Date today = new java.util.Date();
            long time = today.getTime();
            ps.setDate(4, new java.sql.Date(time));

            int i = ps.executeUpdate();
            System.out.println(i + " row updated!");

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, ps, null);
        }

        //retrieveComments(product_id);
    }
    
    public static void addInformationById(String title, String username, String information_string, int id) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = ConnectionManager.getConnection();
            StringBuffer sql = new StringBuffer("INSERT INTO information (title, username, information_string, information_id, post_date) VALUES (?,?,?,?,?)");

            ps = conn.prepareStatement(sql.toString());

            ps.setString(1, title);
            ps.setString(2, username);
            ps.setString(3, information_string);
            ps.setInt(4, id);
            java.util.Date today = new java.util.Date();
            long time = today.getTime();
            ps.setDate(5, new java.sql.Date(time));

            int i = ps.executeUpdate();
            System.out.println(i + " row updated!");

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, ps, null);
        }

        //retrieveComments(product_id);
    }

    public static ArrayList<Information> retrieveInformationById(int information_id) {

         Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Information> infoList = new ArrayList<Information>();

        try {

            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from information where id = ? or information_id = ? order by id desc");
            stmt.setInt(1, information_id);
            stmt.setInt(2, information_id);
            rs = stmt.executeQuery();

            while (rs.next()) {
                
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String username = rs.getString("username");
                String information_string = rs.getString("information_string");
                int info_id = rs.getInt("information_id");
                //int info_id = 0;
                Date post_date = rs.getTimestamp("post_date");

                Information info = new Information(id, title, username, information_string, info_id, post_date);

                infoList.add(info);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }

        return infoList;
    }
}
