package com.expense;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Get existing session (do NOT create new one)
        HttpSession session = req.getSession(false);

        // Invalidate session if exists
        if (session != null) {
            session.invalidate();
        }

        // Redirect to login page with message
        res.sendRedirect("login.jsp?msg=logout");
    }
}