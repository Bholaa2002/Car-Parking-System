package com.carparking.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class CheckOutServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/CarParkingDB";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vehicleNumber = request.getParameter("vehicleNumber");

        Connection conn = null;
        PreparedStatement updateStmt = null;
        PreparedStatement deleteStmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // 1️⃣ Update checkout time
            String updateSQL = "UPDATE checkin SET checkout_time = ? WHERE vehicle_number = ? AND checkout_time IS NULL";
            updateStmt = conn.prepareStatement(updateSQL);
            updateStmt.setTimestamp(1, new Timestamp(System.currentTimeMillis())); 
            updateStmt.setString(2, vehicleNumber);
            int rowsUpdated = updateStmt.executeUpdate();

            if (rowsUpdated > 0) {
                // 2️⃣ Delete vehicle from checkin table
                String deleteSQL = "DELETE FROM checkin WHERE vehicle_number = ?";
                deleteStmt = conn.prepareStatement(deleteSQL);
                deleteStmt.setString(1, vehicleNumber);
                deleteStmt.executeUpdate();
                
                response.sendRedirect("parking.jsp?message=checkout_success");
            } else {
                response.sendRedirect("checkout.jsp?error=Vehicle not found or already checked out");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("checkout.jsp?error=Database error");
        } finally {
            try {
                if (updateStmt != null) updateStmt.close();
                if (deleteStmt != null) deleteStmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
