<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<!-- JSP ������ ������ �⺻ ����, ��� ���� PreparedStatement��� ���� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" 
import="java.sql.Connection, java.sql.PreparedStatement" %>
<!-- ������ ���̽��� ����ϱ� ���� �ʿ��� Ŭ���� �ε� -->
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %> 
<%@ page import="java.sql.ResultSet" %>  
    

<!-- JSP�� ���� : ����̹� �ε� �ݹ�޼ҵ��� init�� 1ȸ �����ϸ�
       setConnection �޼ҵ带 ��� -->
<%!
   Connection conn; // ��� ���� ����
   PreparedStatement pstmt; // ���� �ڵ� ����
   ResultSet rs;   // ����� �޾ƿ� ����

   public void init() //Call Back�޼ҵ�, ����̹� �ε�
   {
     try {Class.forName("oracle.jdbc.driver.OracleDriver");} // ����̹� �ε�
     catch (ClassNotFoundException e) {e.printStackTrace(); } // ����̹� Ŭ������ ���� ���� �߻��� ���� ���
   } 
   public void setConnection() // ��� ������� ���� �޼ҵ�
   {
     try{conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "scott", "tiger");} // ��� ����
     catch (SQLException e) {e.printStackTrace();} // ���ܻ�Ȳ�߻��� ���� ���
    }
%>



<%
    //1. ������ �޾ƿ��� (write.html�� �ڹٽ�ũ��Ʈ���� "check.jsp?id="+sid ��� ������ �̿��� �Ѱ� �־����ϴ�.)
    String id = request.getParameter("id");
    
    // 2. db-select
    try
    {
        this.setConnection();                                          // ����
        String sql = "select * from member where id=?";      // ���̵�� �˻��Ͽ� ������ ���ڵ带 ���� �ɴϴ�.
        pstmt = conn.prepareStatement(sql);                     // �ڵ��� �����ϰ� �������� ����մϴ�
        pstmt.setString(1, id);                                          // �������� ?�� ������ �����մϴ�
        rs = pstmt.executeQuery();                                  // resultset�� ������ ��� �ɴϴ�
    }
    catch(SQLException e){e.printStackTrace();}
%>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Insert title here</title>
        <!-- �� �ڹ� ��ũ��Ʈ�� checkId.jsp�� ������ ������ �����Դϴ� -->
        <script>
            function checkIdClose(id)
            {
                opener.writeForm.id.value = id;    // �����ִ¹�����(opener) writeForm�� �̸��� ���� ������ ���̵� ����
                window.close();                        // checkId.jsp ������ �ݱ�
                opener.writeForm.pwd.focus();   // ȸ���������� ��Ŀ���� �н������Է� ���ڷ� �̵�
            }
        </script>
        <!-- ��Ÿ�� ����, �ٵ��� ��Ʈ�� �����մϴ� -->
        <style>
            body {font-size:12pt}
        </style>
    </head>

    <body>
        <!--submit ����� checkId.jsp�� �ǵ��� ���ϴ�.-->
        <form method="post" action="check_Id.jsp">
            <%
                try
                {
                    if(rs.next() || (id==null))  // next()�޼ҵ�� ���� �ִ��� �������� üũ�ϰ� ������� 0�� �ƴ� ���� �����ϴ�.
                    {                                  // ���� ���� ���0 �̹Ƿ� ������ �������� ���Ͽ� �������� �ʽ��ϴ�
                                                        // ��ϵ� ���̵� �ְų� ����ڰ� ���̵��� ���� ���� ��쿡 ����˴ϴ�.
            %>
                        ���� <%=id %> ���Ұ���<br></br>                   <!-- �޽��� ���-->
                        ���̵� : <input type="text" name="id"></input>      <!-- ���̵� �Է� �ؽ�Ʈ�ڽ� ����-->
                        <input type="submit" value="�ߺ�üũ"></input>    <!-- �� �ߺ�üũ�� ���� ��ư ���� -->
                        
            <%
                    }
                    else        // ����ڰ� �Է��� ���̵� ��� �����Ѱ��....
                    {
            %>
                        ���� <%=id %>��밡��                                                     <!-- �޽��� ��� -->
                        <a href="check_Id.jsp">�ٸ����̵� ����</a><br></br>       <!-- �ٸ� ���̵� ���� ��� -->
                        <!-- ����ڰ� �Է��� ���̵� �����ϸ� checkIdClose �ڹ� ��ũ��Ʈ�� ����˴ϴ�. �̶� 
                               ���̵� ���� ���ڷ� �Բ� �־� �ݴϴ�. -->
                        <input type="button" value="���� ���̵� ����" onClick="javas-ript:checkIdClose('<%=id %>')">
            <% 
                    }
                }
                catch(SQLException e){e.printStackTrace();}
                // ����� ���� ����
                finally
                {        
                    try
                    {
                        if(pstmt!=null) pstmt.close();
                        if(conn!=null) conn.close();
                    }
                    catch(SQLException e2){    e2.printStackTrace();    }    
                }
            %>
        </form>
    </body>
</html>
