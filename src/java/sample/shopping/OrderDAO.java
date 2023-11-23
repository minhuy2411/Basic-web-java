/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sample.utils.DBUtils;

/**
 *
 * @author ☢ minhuy ☣
 */
public class OrderDAO {
    private static final String INSERT_ORDER = "insert into [dbo].[bill]([userName],[total],[address],[date],[phone])values(?,?,?,?,?)";
    private static final String INSERT_ORDER_DETAIL = "insert into [dbo].[bill_detail] ([bill_id],[product_id],[quantity],[price]) values (?,?,?,?)";
    public static Boolean insertOrder(Cart cart, OrderDTO order) throws SQLException, ClassNotFoundException{
        //add vao order
        Boolean check = true;
        Connection conn = DBUtils.getConnection();
        PreparedStatement ptm = null;
        
        try {
            conn.setAutoCommit(false);
            int result = 0;
            if (conn != null) {
                
                ptm = conn.prepareStatement(INSERT_ORDER);
                ptm.setString(1, order.getName());
                ptm.setDouble(2, order.getTotal());
                ptm.setString(3, order.getAddress());
                ptm.setDate(4, order.getDate());
                ptm.setString(5, order.getPhone());
                result = ptm.executeUpdate();
                if (result > 0) {
                    String sql = "select Max([bill_id]) as 'bill_id' from [dbo].[bill]";
                    ptm = conn.prepareStatement(sql);
                    ResultSet rs = ptm.executeQuery();
                    if (rs != null && rs.next()) {
                        int bill_id = rs.getInt("bill_id");
                        //add vao orderdetail
                        for (Weapon weapon : cart.getCart().values()) {
                            ptm = conn.prepareStatement(INSERT_ORDER_DETAIL);
                            ptm.setInt(1, bill_id);
                            ptm.setString(2, weapon.getId());
                            ptm.setInt(3, weapon.getQuantity());
                            ptm.setDouble(4, order.getTotal());
                            
                            result = ptm.executeUpdate();
                            if (result == 0){
                                throw new Exception();
                            }
                        }
                        
                    }
                    
                }
                
            }
            conn.commit();
        } catch (Exception e) {
            check = false;
            conn.rollback();
            e.printStackTrace();
        }finally{
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        
        //add vao orderdetail
        
        
        return check;
    }
}
