package com.icbt.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login");
        } else {
            req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
        }
    }
}
