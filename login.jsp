<%@ page import="java.sql.*" %>
<% 
    String name = request.getParameter("unam");
    String password = request.getParameter("pass");
    String url = "jdbc:mysql://localhost:3306/pima";
    String un = "root";
    String pw = "Ashik@4166";
    Connection conn = DriverManager.getConnection(url, un, pw);
    String sql = "SELECT * FROM ne4 WHERE unam=? AND passwor=?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, name);
    stmt.setString(2, password);
    ResultSet rs = stmt.executeQuery();
    if (rs.next()) {

        out.println("<p>Login successful!</p>");
        out.println("<p>Welcome, " + name + "!<br>");

    } else {
    out.println("<p>Invalid username or password.</p>");
    }
    rs.close();
    stmt.close();
    conn.close();
%>
