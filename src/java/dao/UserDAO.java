/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import utility.ConnectionManager;

/**
 *
 * @author jesperlim
 */
public class UserDAO {

    public static User retrieveUser(String username, String pass) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            if (username == null) {
                return null;
            }

            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from users where username = ? AND password = ? ");
            stmt.setString(1, username);
            stmt.setString(2, pass);
            rs = stmt.executeQuery();

            if (rs.next()) {

                String name = rs.getString("name");
                String email = rs.getString("email");
                String gender = rs.getString("gender");

                User user = new User(name, pass, email, gender, username);
                // int findIndex = email.indexOf("@");
                //String emailID = email.substring(0, findIndex);
                //if (username.equals(emailID)) {
                return user;
                //} else {
                //    return null;
                // }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }

        return null;
    }

    public void addUser(User user) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = ConnectionManager.getConnection();
            StringBuffer sql = new StringBuffer("INSERT INTO users VALUES (?,?,?,?,?)");

            ps = conn.prepareStatement(sql.toString());

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getName());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getGender());

            int i = ps.executeUpdate();
            System.out.println(i + " row updated!");

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, ps, null);
        }
    }
}
