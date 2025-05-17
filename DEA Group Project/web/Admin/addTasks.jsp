<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Tasks</title>
    </head>
    <body>
        <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <%@include file="../components/menubar.jsp" %>
        <div class="layout-page">
        <%@include file="../components/navbar.jsp" %>
        <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- Layout Demo -->
              <div class="layout-demo-wrapper">
        <form action="TaskServlet" method="post">
            <input type="hidden" name="projectId" value="1"/>
            <table>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name"/></td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td><textarea type="text" name="description"></textarea></td>
                </tr>
                <tr>
                    <td>Employee:</td>
                    <td>
                        <select name="employee">
                            <option value="">Select Employee</option>
                            <option value="1">someone</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Status:</td>
                    <td>
                        <select name="status">
                            <option value="">Select Status</option>
                            <option value="Pending">Pending</option>
                            <option value="In Progress">In Progress</option>
                            <option value="Completed">Completed</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Deadline:</td>
                    <td><input type="date" name="deadline"/></td>
                </tr>
            </table>
            <input type="submit" value="Add"/>
        </form>
                  </div>
              <!--/ Layout Demo -->
            </div>
        <%@include file="../components/footer.jsp" %>
        <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>
    </body>
</html>
