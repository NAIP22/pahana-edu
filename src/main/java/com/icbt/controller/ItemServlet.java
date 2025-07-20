package com.icbt.controller;


import com.icbt.model.Item;
import com.icbt.service.ItemService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ItemServlet extends HttpServlet {
    private final ItemService itemService = new ItemService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String path = "";

        if (action == null) action = "list";

        switch (action) {
            case "add":
                path = "/add_item.jsp";
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Item item = itemService.getItemById(id);
                request.setAttribute("item", item);
                path = "/edit_item.jsp";
                break;
            case "delete":
                itemService.deleteItem(Integer.parseInt(request.getParameter("id")));
                response.sendRedirect("item?action=list");
                return;
            default:
                List<Item> items = itemService.getAllItems();
                request.setAttribute("items", items);
                path = "/list_item.jsp";
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : 0;
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("unitPrice"));
        int quantity = Integer.parseInt(request.getParameter("stockQuantity"));

        Item item = new Item(id, name, price, quantity);

        if (id == 0) {
            itemService.addItem(item);
        } else {
            itemService.updateItem(item);
        }
        response.sendRedirect("item?action=list");
    }
}
