package com.example.flightbookingmanagement.service;

import com.example.flightbookingmanagement.dao.impl.CustomerDAOImpl;
import com.example.flightbookingmanagement.dto.PaymentInfoDTO;
import com.example.flightbookingmanagement.dto.SearchedTicketDTO;
import com.example.flightbookingmanagement.dto.SearchedTicketFormDTO;
import com.example.flightbookingmanagement.dto.TransactionHistoryDTO;
import com.example.flightbookingmanagement.model.User;
import com.example.flightbookingmanagement.utils.TicketsSorter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class CustomerService {
    static private CustomerDAOImpl customerDAO;

    public CustomerService() {
        customerDAO = new CustomerDAOImpl();
    }

    public void showAllTransactionHistories(HttpServletRequest request)
            throws SQLException, IOException, ServletException {
        HttpSession session = request.getSession(false);
        // Kiểm tra nếu session tồn tại
        // Lấy user từ session
        User user = (User) session.getAttribute("user");
        List<TransactionHistoryDTO> transaction_histories = customerDAO.selectTransactionHistory(user.getUserId());
        request.setAttribute("transaction_histories", transaction_histories);
    }

    public void showAllPaymentInfos(HttpServletRequest request)
            throws SQLException, IOException, ServletException {
        HttpSession session = request.getSession(false);
        // Kiểm tra nếu session tồn tại
        // Lấy user từ session
        User user = (User) session.getAttribute("user");
        List<PaymentInfoDTO> payment_infos = customerDAO.selectPaymentInfo(user.getUserId());
        request.setAttribute("payment_infos", payment_infos);
    }




    public void updateSearchTicketForm(HttpServletRequest request)
            throws SQLException, IOException, ServletException {

        String ticket_type = request.getParameter("ticket_type");
        String departure_location = request.getParameter("departure_location");
        String arrival_location = request.getParameter("arrival_location");
        String leaving_date = request.getParameter("leaving_date");
        String adult_num = request.getParameter("adult_num");
        String kid_num = request.getParameter("kid_num");
        String baby_num = request.getParameter("baby_num");

        SearchedTicketFormDTO SearchedTicketForm = new SearchedTicketFormDTO(ticket_type,departure_location,arrival_location,
                                                    leaving_date,adult_num,kid_num,baby_num);

        request.setAttribute("SearchedTicketForm", SearchedTicketForm);

    }

    public void selectAllFlightsFromSearchForm(HttpServletRequest request )
            throws SQLException, IOException, ServletException {
        String departure_location = request.getParameter("departure_location");
        String arrival_location = request.getParameter("arrival_location");
        String departure_time = request.getParameter("leaving_date");
        String orderBy = null;

        List<SearchedTicketDTO> searchedTickets = customerDAO.selectFlightsFromSearchedForm(departure_location,
                arrival_location,departure_time);
        try{
            orderBy = request.getParameter("orderBy");
        } catch (RuntimeException ignored){}

        TicketsSorter.sortSearchedTicketsByOrder(searchedTickets, orderBy);

        request.setAttribute("searchedTickets", searchedTickets);

    }
    public void jumpToOneWayTicket(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/oneway_ticket.jsp");
        dispatcher.forward(request, response);
    }


    //-------------------------------------- LOG IN ------------------------------------------
    public void jumpToInfo(int userId,HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        request.setAttribute("userId", userId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/info.jsp");
        dispatcher.forward(request, response);
    }

    //--------------------------------------------------------------------------------
    public void jumpToTransactionHistory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/transaction_history.jsp");
        dispatcher.forward(request, response);
    }

    //--------------------------------------------------------------------------------
    public void jumpToPaymentInfos(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/payment_info.jsp");
        dispatcher.forward(request, response);
    }

    //-------------------------------------- UPDATE CUSTOMER TO DATABASE ------------------------------------------
    public void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        String name = request.getParameter("name");
        String birth_date = request.getParameter("birth_date");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");


        // Lấy session hiện tại (không tạo mới)
        HttpSession session = request.getSession(false);
        // Kiểm tra nếu session tồn tại
        // Lấy user từ session
        User user = (User) session.getAttribute("user");


        // Update thông tin user
        user.setFullName(name);
        user.setBirthDate(birth_date);
        user.setAddress(address);
        user.setEmail(email);
        user.setPhone(phone);
        System.out.println(user);
        customerDAO.updateUser(user);
        session.setAttribute("user", user);

        jumpToInfo(user.getUserId(),request,response);

    }


}
