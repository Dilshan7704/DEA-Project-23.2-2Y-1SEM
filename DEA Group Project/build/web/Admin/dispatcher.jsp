<%
    String contentpage = request.getParameter("contentpage");
    if (contentpage == null || contentpage.trim().equals("")) {
        contentpage = "home.jsp"; // default page
    }
    request.setAttribute("content", contentpage);
    request.getRequestDispatcher("layout.jsp").forward(request, response);
%>
