package com.carparking.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class CheckInServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/CarParkingDB";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vehicleNumber = request.getParameter("vehicle_number");
        String ownerName = request.getParameter("owner_name");

        Connection conn = null;
        PreparedStatement checkStmt = null;
        PreparedStatement insertStmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // **Step 1: Check if vehicle is already checked in and not yet checked out**
            String checkSql = "SELECT * FROM checkin WHERE vehicle_number = ? AND checkout_time IS NULL";
            checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, vehicleNumber);
            rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Vehicle is already checked in, show error
                response.sendRedirect("checkin.jsp?error=Vehicle already checked in");
            } else {
                // **Step 2: Insert new check-in record**
                String insertSql = "INSERT INTO checkin (vehicle_number, owner_name) VALUES (?, ?)";
                insertStmt = conn.prepareStatement(insertSql);
                insertStmt.setString(1, vehicleNumber);
                insertStmt.setString(2, ownerName);

                int rowsInserted = insertStmt.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("parking.jsp?message=checkin_success");
                } else {
                    response.sendRedirect("checkin.jsp?error=Check-in failed");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("checkin.jsp?error=Database error");
        } finally {
            try {
                if (rs != null) rs.close();
                if (checkStmt != null) checkStmt.close();
                if (insertStmt != null) insertStmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
