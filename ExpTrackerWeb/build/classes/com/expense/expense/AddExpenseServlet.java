package com.expense;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddExpenseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Get session
        HttpSession session = req.getSession(false);

        // Check if user logged in
        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO expenses(user_id, amount, category, date, description) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            // Get form data safely
            double amount = Double.parseDouble(req.getParameter("amount"));
            String category = req.getParameter("category");
            String date = req.getParameter("date");
            String description = req.getParameter("description");

            ps.setInt(1, userId);
            ps.setDouble(2, amount);
            ps.setString(3, category);
            ps.setString(4, date);
            ps.setString(5, description);

            ps.executeUpdate();

            // Redirect with success message
            res.sendRedirect("dashboard.jsp?msg=added");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error adding expense!");
        }
    }
}