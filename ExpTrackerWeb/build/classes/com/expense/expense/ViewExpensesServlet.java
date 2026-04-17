package com.expense;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
 
public class ViewExpensesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Get session safely
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM expenses WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            // Store data in list
            ArrayList<String[]> expenseList = new ArrayList<>();
            double total = 0;

            while (rs.next()) {
                String[] row = new String[5];

                row[0] = String.valueOf(rs.getInt("id"));
                row[1] = String.valueOf(rs.getDouble("amount"));
                row[2] = rs.getString("category");
                row[3] = rs.getString("date");
                row[4] = rs.getString("description");

                total += rs.getDouble("amount");

                expenseList.add(row);
            }

            // Send data to JSP
            req.setAttribute("expenses", expenseList);
            req.setAttribute("total", total);

            RequestDispatcher rd = req.getRequestDispatcher("viewExpenses.jsp");
            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error loading expenses!");
        }
    }
}