<%@ page import="java.util.List, com.student.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f2f5;
            min-height: 100vh;
        }

        .navbar {
            background: #1a73e8;
            padding: 16px 32px;
            color: white;
            font-size: 20px;
            font-weight: 600;
            letter-spacing: 0.5px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
        }

        .navbar-inner {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 8px;
        }

        .navbar-title { font-size: 18px; font-weight: 600; }

        .navbar-user { font-size: 13px; font-weight: 400; opacity: 0.9; }

        .container {
            max-width: 1100px;
            margin: 30px auto;
            padding: 0 16px;
        }

        .card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            padding: 24px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 12px;
        }

        .top-bar h2 {
            font-size: 20px;
            color: #1a1a2e;
            font-weight: 600;
        }

        .top-bar-buttons {
            display: flex;
            gap: 10px;
            align-items: center;
            flex-wrap: wrap;
        }

        .btn-add {
            background: #1a73e8;
            color: white;
            padding: 9px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: background 0.2s;
            white-space: nowrap;
        }

        .btn-add:hover { background: #1558b0; }

        .btn-logout {
            background: #fdecea;
            color: #c62828;
            padding: 9px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: background 0.2s;
            white-space: nowrap;
        }

        .btn-logout:hover { background: #ffcdd2; }

        .table-wrapper {
            overflow-x: auto;
            border-radius: 8px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            min-width: 600px;
        }

        thead {
            background: #1a73e8;
            color: white;
        }

        thead th {
            padding: 13px 14px;
            text-align: left;
            font-weight: 500;
            letter-spacing: 0.3px;
            cursor: pointer;
            user-select: none;
            white-space: nowrap;
        }

        thead th:hover { background: #1558b0; }
        thead th.sorted-asc::after  { content: " (asc)";  font-size: 11px; }
        thead th.sorted-desc::after { content: " (desc)"; font-size: 11px; }

        tbody tr {
            border-bottom: 1px solid #f0f0f0;
            transition: background 0.15s;
        }

        tbody tr:hover { background: #f8fbff; }

        tbody td {
            padding: 13px 14px;
            color: #333;
        }

        .badge {
            background: #e8f0fe;
            color: #1a73e8;
            padding: 4px 10px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 13px;
        }

        .grade-a { background: #e8f5e9; color: #2e7d32; padding: 4px 10px; border-radius: 20px; font-weight: 600; font-size: 13px; }
        .grade-b { background: #e8f0fe; color: #1a73e8; padding: 4px 10px; border-radius: 20px; font-weight: 600; font-size: 13px; }
        .grade-c { background: #fff8e1; color: #f9a825; padding: 4px 10px; border-radius: 20px; font-weight: 600; font-size: 13px; }
        .grade-d { background: #fff3e0; color: #e65100; padding: 4px 10px; border-radius: 20px; font-weight: 600; font-size: 13px; }
        .grade-f { background: #fdecea; color: #c62828; padding: 4px 10px; border-radius: 20px; font-weight: 600; font-size: 13px; }

        .btn-edit {
		    background: #e8f5e9;
		    color: #2e7d32;
		    padding: 6px 12px;
		    border-radius: 6px;
		    text-decoration: none;
		    font-size: 13px;
		    font-weight: 500;
		    transition: background 0.2s;
		    white-space: nowrap;
		    display: inline-block;
		    margin-bottom: 4px;
		}

        .btn-edit:hover { background: #c8e6c9; }

        .btn-delete {
		    background: #fdecea;
		    color: #c62828;
		    padding: 6px 12px;
		    border-radius: 6px;
		    text-decoration: none;
		    font-size: 13px;
		    font-weight: 500;
		    transition: background 0.2s;
		    white-space: nowrap;
		    display: inline-block;
		}

        .btn-delete:hover { background: #ffcdd2; }

        .empty {
            text-align: center;
            padding: 60px;
            color: #999;
            font-size: 15px;
        }

        .bottom-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 8px;
            margin-top: 16px;
        }

        .count { font-size: 13px; color: #888; }
        .sort-hint { font-size: 12px; color: #bbb; }

        /* Tablet */
        @media (max-width: 768px) {
            .navbar { padding: 14px 20px; }
            .navbar-title { font-size: 16px; }
            .container { margin: 20px auto; }
            .card { padding: 18px; }
            thead th { padding: 11px 10px; font-size: 13px; }
            tbody td { padding: 11px 10px; font-size: 13px; }
        }

        /* Mobile */
        @media (max-width: 480px) {
            .navbar { padding: 12px 16px; }
            .navbar-title { font-size: 15px; }
            .navbar-user { font-size: 12px; }
            .container { margin: 14px auto; padding: 0 10px; }
            .card { padding: 14px; border-radius: 10px; }
            .top-bar h2 { font-size: 17px; }
            .btn-add, .btn-logout { padding: 8px 14px; font-size: 13px; }
            thead th { padding: 10px 8px; font-size: 12px; }
            tbody td { padding: 10px 8px; font-size: 12px; }
            .btn-edit, .btn-delete { padding: 5px 10px; font-size: 12px; }
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="navbar-inner">
        <span class="navbar-title">Student Management System</span>
        <span class="navbar-user">Welcome, <%= session.getAttribute("loggedUser") %></span>
    </div>
</div>

<div class="container">
    <div class="card">
        <div class="top-bar">
            <h2>All Students</h2>
            <div class="top-bar-buttons">
                <a href="StudentServlet?action=showAdd" class="btn-add">+ Add New Student</a>
                <a href="LoginServlet?action=logout" class="btn-logout">Logout</a>
            </div>
        </div>

        <div class="table-wrapper">
            <table id="studentTable">
                <thead>
                    <tr>
                        <th onclick="sortTable(0)">ID</th>
                        <th onclick="sortTable(1)">Student ID</th>
                        <th onclick="sortTable(2)">Name</th>
                        <th onclick="sortTable(3)">Email</th>
                        <th onclick="sortTable(4)">Phone</th>
                        <th onclick="sortTable(5)">Marks</th>
                        <th>Grade</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="tableBody">
                <%
                    List<Student> students = (List<Student>) request.getAttribute("students");
                    if (students != null && students.size() > 0) {
                        for (Student st : students) {
                            int m = st.getMarks();
                            String grade, gradeClass;
                            if (m >= 90)      { grade = "A"; gradeClass = "grade-a"; }
                            else if (m >= 80) { grade = "B"; gradeClass = "grade-b"; }
                            else if (m >= 70) { grade = "C"; gradeClass = "grade-c"; }
                            else if (m >= 60) { grade = "D"; gradeClass = "grade-d"; }
                            else              { grade = "F"; gradeClass = "grade-f"; }
                %>
                    <tr>
                        <td><%= st.getId() %></td>
                        <td><strong><%= st.getStudentId() %></strong></td>
                        <td><strong><%= st.getName() %></strong></td>
                        <td><%= st.getEmail() %></td>
                        <td><%= st.getPhone() %></td>
                        <td><span class="badge"><%= st.getMarks() %></span></td>
                        <td><span class="<%= gradeClass %>"><%= grade %></span></td>
                        <td>
						    <div style="display:flex; flex-direction:column; gap:4px; align-items:flex-start;">
						        <a class="btn-edit" href="StudentServlet?action=showEdit&id=<%= st.getId() %>">Edit</a>
						        <a class="btn-delete" href="StudentServlet?action=delete&id=<%= st.getId() %>"
						           onclick="return confirm('Delete <%= st.getName() %>?')">Delete</a>
						    </div>
						</td>
                    </tr>
                <% } } else { %>
                    <tr>
                        <td colspan="8" class="empty">No students found. Add your first student!</td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>

        <div class="bottom-bar">
            <% if (students != null) { %>
            <p class="count">Total students: <%= students.size() %></p>
            <p class="sort-hint">Click any column header to sort</p>
            <% } %>
        </div>
    </div>
</div>

<script>
    let sortDirection = {};

    function sortTable(colIndex) {
        const tbody = document.getElementById("tableBody");
        const rows = Array.from(tbody.querySelectorAll("tr"));
        if (rows.length === 0) return;

        const isAsc = sortDirection[colIndex] !== "asc";
        sortDirection[colIndex] = isAsc ? "asc" : "desc";

        rows.sort((a, b) => {
            const aText = a.querySelectorAll("td")[colIndex].innerText.trim();
            const bText = b.querySelectorAll("td")[colIndex].innerText.trim();
            const aNum = parseFloat(aText);
            const bNum = parseFloat(bText);
            if (!isNaN(aNum) && !isNaN(bNum)) return isAsc ? aNum - bNum : bNum - aNum;
            return isAsc ? aText.localeCompare(bText) : bText.localeCompare(aText);
        });

        rows.forEach(row => tbody.appendChild(row));

        document.querySelectorAll("thead th").forEach((th, i) => {
            th.classList.remove("sorted-asc", "sorted-desc");
            if (i === colIndex) th.classList.add(isAsc ? "sorted-asc" : "sorted-desc");
        });
    }
</script>

</body>
</html>