<%@ page import="com.student.Student" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', sans-serif; background: #f0f2f5; min-height: 100vh; }
        .navbar { background: #1a73e8; padding: 16px 32px; color: white; font-size: 20px; font-weight: 600; box-shadow: 0 2px 8px rgba(0,0,0,0.15); }
        .container {
    	max-width: 560px;
    	margin: 30px auto;
    	padding: 0 16px;
		}
        .card { background: white; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.08); padding: 36px; }
        .card h2 { font-size: 20px; color: #1a1a2e; margin-bottom: 28px; font-weight: 600; border-left: 4px solid #f4a400; padding-left: 12px; }
        label { display: block; font-size: 13px; font-weight: 600; color: #555; margin-bottom: 6px; text-transform: uppercase; letter-spacing: 0.4px; }
        input { width: 100%; padding: 11px 14px; border: 1.5px solid #e0e0e0; border-radius: 8px; font-size: 14px; color: #333; margin-bottom: 20px; transition: border 0.2s; outline: none; }
        input:focus { border-color: #f4a400; }
        .btn-row { display: flex; align-items: center; gap: 16px; margin-top: 8px; }
        .btn-update { background: #f4a400; color: white; padding: 11px 28px; border: none; border-radius: 8px; font-size: 14px; font-weight: 500; cursor: pointer; transition: background 0.2s; }
        .btn-update:hover { background: #d18f00; }
        .btn-cancel { color: #888; text-decoration: none; font-size: 14px; }
        .btn-cancel:hover { color: #333; }
        
        @media (max-width: 480px) {
    .navbar { padding: 12px 16px; font-size: 16px; }
    .card { padding: 24px 18px; }
    .card h2 { font-size: 17px; }
    input { font-size: 13px; }
    .btn-update { width: 100%; }
	}
    </style>
</head>
<body>

<div class="navbar">Student Management System</div>

<div class="container">
    <div class="card">
        <h2>Edit Student</h2>
        <% Student s = (Student) request.getAttribute("student"); %>
        <form action="StudentServlet" method="post">
            <input type="hidden" name="action" value="edit"/>
            <input type="hidden" name="id" value="<%= s.getId() %>"/>

            <label>Student ID</label>
            <input type="text" name="studentId" value="<%= s.getStudentId() %>" required/>

            <label>Full Name</label>
            <input type="text" name="name" value="<%= s.getName() %>" required/>

            <label>Email Address</label>
            <input type="email" name="email" value="<%= s.getEmail() %>" required/>

            <label>Phone Number</label>
            <input type="text" name="phone" value="<%= s.getPhone() %>"/>

            <label>Marks</label>
            <input type="number" name="marks" value="<%= s.getMarks() %>" min="0" max="100" required/>

            <div class="btn-row">
                <button type="submit" class="btn-update">Update Student</button>
                <a href="StudentServlet?action=list" class="btn-cancel">Cancel</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>