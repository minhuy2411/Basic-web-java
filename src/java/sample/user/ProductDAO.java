/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.shopping.ProductDTO;
import sample.utils.DBUtils;

/**
 *
 * @author ☢ minhuy ☣
 */
public class ProductDAO {

    private static final String GET_PRODUCT = "select * from product";

    public static List<ProductDTO> getListProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String Id = rs.getString("product_id");
                    String Name = rs.getString("product_name");
                    Double Price = rs.getDouble("product_price");
                    int Quantity = rs.getInt("quantity");
                    String Image = rs.getString("img");
                    ProductDTO pro = new ProductDTO(Id, Name, Price, Quantity, Image);
                    list.add(pro);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;

    }

    public static ProductDTO getProduct(String id) throws SQLException {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT *\n"
                    + "FROM [dbo].[product]\n"
                    + "WHERE [product_id] = ?";
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String Id = rs.getString("product_id");
                    String Name = rs.getString("product_name");
                    Double Price = rs.getDouble("product_price");
                    int Quantity = rs.getInt("quantity");
                    String Image = rs.getString("img");
                    product = new ProductDTO(Id, Name, Price, Quantity, Image);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return product;

    }
}
