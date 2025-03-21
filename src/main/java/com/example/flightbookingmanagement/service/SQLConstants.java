package com.example.flightbookingmanagement.service;

public class SQLConstants {
    public static final String LOGIN_QUERY = "SELECT user_id FROM users WHERE phone = ? AND password = ?";
    public static final String SELECT_ALL_WHERE_USERID = "SELECT * FROM users WHERE user_id = ?";
    public static final String COUNT_USER_BY_PHONE = "SELECT COUNT(*) FROM users WHERE phone = ?";
    public static final String COUNT_USER_BY_EMAIL ="SELECT COUNT(*) FROM users WHERE email = ?";
    public static final String INSERT_USER_REGISTER ="INSERT INTO users (full_name, phone, email, password, role) VALUES (?, ?, ?, ?, 'customer')";
    public static final String PAYMENT_INFO_SQL = "SELECT f.flight_code, \n" +
            "f.departure_location,f.arrival_location,\n" +
            "t.booking_date,t.travel_date,f.price \n" +
            "FROM tickets t JOIN flights f ON t.flight_id = f.flight_id \n" +
            "WHERE t.user_id = ?;";

    public static final String TRANSACTION_HISTORY_SQL = "SELECT f.departure_location,\n" +
            " f.arrival_location ,t.booking_date,\n" +
            " t.travel_date,f.price, t.status \n" +
            "FROM tickets t\n" +
            "JOIN flights f ON t.flight_id = f.flight_id \n" +
            "WHERE t.user_id = ?;";

    public static final String FLIGHTS_INFO_SQL = "SELECT\n" +
            "    f.airline ,\n" +
            "    f.flight_code ,\n" +
            " CONCAT(TIME_FORMAT(f.departure_time, '%H:%i'), ' → ', TIME_FORMAT(f.arrival_time, '%H:%i')) AS flight_time," +
            "    f.price \n" +
            "FROM flights f\n" +
            "WHERE\n" +
            "    f.departure_location = ?\n" +
            "    AND f.arrival_location = ?\n" +
            "    AND DATE(f.departure_time) = ?;";

    public static final String UPDATE_USERS_SQL = "UPDATE users SET full_name = ?, birth_date = ?, gender = ?, address = ?, email = ?, phone = ? WHERE user_id = ?";
    public static final String UPDATE_PASSWORD_SQL = "UPDATE users SET password = ? WHERE user_id = ?";
    public static final String SELECT_ALL_STAFFS_SQL = "SELECT * FROM users WHERE role = 'staff'";
    public static final String UPDATE_ALL_STAFFS_SQL = "UPDATE users SET full_name = ?, birth_date = ?, address = ?, email = ?, phone = ? WHERE user_id = ?";
    public static final String DELETE_USER_SQL = "DELETE FROM users WHERE user_id = ?";
    public static final String GET_DAYLY_STAFF_REPORT = "SELECT * FROM users WHERE role = 'staff' AND DATE(created_at) = ?";

    public static final String SELECT_FLIGHT_ID_TRAVEL_DATE = "SELECT f.flight_id, DATE(f.departure_time) as departure_date\n" +
            "FROM flights f\n" +
            "WHERE flight_code = ?;";
    public static final String INSERT_PAYMENT="INSERT INTO payments (ticket_id, amount, payment_status)\n " +
            "VALUES (?, ?, ?)";

    public static final String INSERT_TICKET ="INSERT INTO tickets (user_id, flight_id, travel_date, seat_number, status)\n " +
            "VALUES (?, ?, ?, ?, 'booked')";


    public static final String GET_TOTAL_PRICE = "SELECT\n" +
            "    t.ticket_id AS Ticket_ID,\n" +
            "    f.price AS Gia_Ve,\n" +
            "    COALESCE(l.price, 0) AS Gia_Hanh_Ly,\n" +
            "    (f.price + COALESCE(l.price, 0)) AS total_price\n" +
            "FROM tickets t\n" +
            "JOIN flights f ON t.flight_id = f.flight_id\n" +
            "LEFT JOIN luggage l ON t.ticket_id = l.ticket_id\n" +
            "WHERE t.ticket_id = ?;";

    public static final String INSERT_LUGGAGE = "INSERT INTO luggage (ticket_id,weight) values (?,?);";

    public static final String SELECT_AVAILABLE_SEATS ="SELECT available_seats FROM flights WHERE flight_id = ? FOR UPDATE;";

    public static final String UPDATE_AVAILABLE_SEATS_AFTER_BOOKING ="UPDATE flights SET available_seats = available_seats - 1 WHERE flight_id = ?;";
    public static final String SELECT_SEAT_NUM_STATUS_BY_FLIGHT_CODE ="SELECT t.seat_number, t.status \n" +
                                                                        "FROM tickets t\n" +
                                                                        "JOIN flights f on t.flight_id = f.flight_id\n" +
                                                                        "WHERE flight_code = ?;";
}
