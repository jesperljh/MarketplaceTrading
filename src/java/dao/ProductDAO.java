/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Product;
import java.io.InputStream;
import static java.lang.String.format;
import static java.lang.String.format;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import utility.ConnectionManager;

/**
 *
 * @author jesperlim
 */
public class ProductDAO {

    public void AddProduct(Product product) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = ConnectionManager.getConnection();
            StringBuffer sql = new StringBuffer("INSERT INTO product (seller, buyer, product_status, filename, product_name, description, price, size, category, posted_date, report) VALUES (?,?,?,?,?,?,?,?,?,?,?)");

            ps = conn.prepareStatement(sql.toString());

            ps.setString(1, product.getSeller());
            ps.setString(2, product.getBuyer());
            ps.setBoolean(3, product.isProductStatus());
            InputStream is = product.getFile();
            ps.setBlob(4, product.getFile());
            ps.setString(5, product.getProductName());
            ps.setString(6, product.getDescription());
            ps.setDouble(7, product.getPrice());
            ps.setString(8, product.getSize());
            ps.setString(9, product.getCategory());
            java.util.Date today = new java.util.Date();
            ps.setDate(10, new java.sql.Date(today.getTime()));
            ps.setBoolean(11, product.isReport());

            int row = ps.executeUpdate();

        } catch (SQLException ex) {
            String message = ex.getMessage();
            ex.printStackTrace();
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, ps, null);
        }
    }

    public ArrayList<Product> getShopProduct(int cat) {
        ArrayList<Product> productList = new ArrayList<Product>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from product where product_status = false AND category = " + cat + " Order By posted_date desc");

            rs = stmt.executeQuery();

            while (rs.next()) {
                int productID = rs.getInt("product_id");
                String seller = rs.getString("seller");
                String buyer = rs.getString("buyer");
                boolean status = rs.getBoolean("product_status");
                String name = rs.getString("product_name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String size = rs.getString("size");
                String category = rs.getString("category");
                Date date = rs.getDate("posted_date");
                boolean report = rs.getBoolean("report");

                Product product = new Product(productID, seller, buyer, status, name, description, price, size, category, date, report);
                productList.add(product);

            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }

        return productList;
    }
    
     public ArrayList<Product> getShopProductByName(String productName) {
        ArrayList<Product> productList = new ArrayList<Product>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from product where product_status = false AND product_name LIKE '%" + productName + "%' Order By posted_date desc");
            
            rs = stmt.executeQuery();

            while (rs.next()) {
                int productID = rs.getInt("product_id");
                String seller = rs.getString("seller");
                String buyer = rs.getString("buyer");
                boolean status = rs.getBoolean("product_status");
                String name = rs.getString("product_name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String size = rs.getString("size");
                String category = rs.getString("category");
                Date date = rs.getDate("posted_date");
                boolean report = rs.getBoolean("report");

                Product product = new Product(productID, seller, buyer, status, name, description, price, size, category, date, report);
                productList.add(product);

            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }

        return productList;
    }

    public Product getProductDetail(int id) {
        ArrayList<Product> productList = new ArrayList<Product>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from product where product_id = " + id);

            rs = stmt.executeQuery();

            if (rs.next()) {
                int productID = rs.getInt("product_id");
                String seller = rs.getString("seller");
                String buyer = rs.getString("buyer");
                boolean status = rs.getBoolean("product_status");
                String name = rs.getString("product_name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String size = rs.getString("size");
                String category = rs.getString("category");
                Date date = rs.getDate("posted_date");
                boolean report = rs.getBoolean("report");

                Product product = new Product(productID, seller, buyer, status, name, description, price, size, category, date, report);
                return product;

            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }

        return null;
    }

    public ArrayList<Product> getMyProduct(String username) {
        ArrayList<Product> productList = new ArrayList<Product>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from product where seller = ? Order By posted_date desc");
            stmt.setString(1, username);

            rs = stmt.executeQuery();

            while (rs.next()) {
                int productID = rs.getInt("product_id");
                String seller = rs.getString("seller");
                String buyer = rs.getString("buyer");
                boolean status = rs.getBoolean("product_status");
                String name = rs.getString("product_name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String size = rs.getString("size");
                String category = rs.getString("category");
                Date date = rs.getDate("posted_date");
                boolean report = rs.getBoolean("report");

                Product product = new Product(productID, seller, buyer, status, name, description, price, size, category, date, report);
                productList.add(product);

            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }

        return productList;
    }

    public void UpdateProductStatus(int productID) {
        Product p = getProductDetail(productID);
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = ConnectionManager.getConnection();
            StringBuffer sql = new StringBuffer("Update product set product_status = ? where product_id = ?");

            ps = conn.prepareStatement(sql.toString());
            if (p.isProductStatus()) {
                ps.setBoolean(1, false);
            } else {
                ps.setBoolean(1, true);
            }
            ps.setInt(2, productID);
            
            int row = ps.executeUpdate();

        } catch (SQLException ex) {
            String message = ex.getMessage();
            ex.printStackTrace();
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, ps, null);
        }
    }
    public void UpdateReport(int productID) {
        Product p = getProductDetail(productID);
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = ConnectionManager.getConnection();
            StringBuffer sql = new StringBuffer("Update product set report = ? where product_id = ?");

            ps = conn.prepareStatement(sql.toString());
            if (p.isReport()) {
                ps.setBoolean(1, false);
            } else {
                ps.setBoolean(1, true);
            }
            ps.setInt(2, productID);
            
            int row = ps.executeUpdate();

        } catch (SQLException ex) {
            String message = ex.getMessage();
            ex.printStackTrace();
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, ps, null);
        }
    }
    
    public void DeleteProduct(int productID) {
        Product p = getProductDetail(productID);
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = ConnectionManager.getConnection();
            StringBuffer sql = new StringBuffer("Delete from product where product_id = ?");

            ps = conn.prepareStatement(sql.toString());
            ps.setInt(1, productID);
            
            int row = ps.executeUpdate();

        } catch (SQLException ex) {
            String message = ex.getMessage();
            ex.printStackTrace();
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, ps, null);
        }
    }
    
    public ArrayList<Product> getReportedProduct() {
        ArrayList<Product> productList = new ArrayList<Product>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = ConnectionManager.getConnection();
            stmt = conn.prepareStatement("select * from product where report = ?");
            stmt.setBoolean(1, true);

            rs = stmt.executeQuery();

            while (rs.next()) {
                int productID = rs.getInt("product_id");
                String seller = rs.getString("seller");
                String buyer = rs.getString("buyer");
                boolean status = rs.getBoolean("product_status");
                String name = rs.getString("product_name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String size = rs.getString("size");
                String category = rs.getString("category");
                Date date = rs.getDate("posted_date");
                boolean report = rs.getBoolean("report");

                Product product = new Product(productID, seller, buyer, status, name, description, price, size, category, date, report);
                productList.add(product);

            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionManager.close(conn, stmt, rs);
        }

        return productList;
    }
}
