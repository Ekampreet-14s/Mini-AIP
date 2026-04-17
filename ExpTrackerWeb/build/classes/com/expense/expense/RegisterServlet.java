package com.expense;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Basic validation
        if (username == null || password == null ||
            username.trim().isEmpty() || password.trim().isEmpty()) {

            res.sendRedirect("register.jsp?error=empty");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO users(username, password) VALUES(?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, password);

            int result = ps.executeUpdate();

            if (result > 0) {
                // Success → go to login page
                res.sendRedirect("login.jsp?msg=registered");
            } else {
                res.sendRedirect("register.jsp?error=failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Registration Error!");
        }
    }
}