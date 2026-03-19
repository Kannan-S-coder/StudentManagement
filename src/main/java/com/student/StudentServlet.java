package com.student;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

    StudentDAO dao = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	HttpSession session = request.getSession(false);
    	if (session == null || session.getAttribute("loggedUser") == null) {
    	    response.sendRedirect("LoginServlet");
    	    return;
    	}

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {

            case "list":
                List<Student> students = dao.getAllStudents();
                request.setAttribute("students", students);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;

            case "showAdd":
                request.getRequestDispatcher("addStudent.jsp").forward(request, response);
                break;

            case "showEdit":
                int id = Integer.parseInt(request.getParameter("id"));
                Student s = dao.getStudentById(id);
                request.setAttribute("student", s);
                request.getRequestDispatcher("editStudent.jsp").forward(request, response);
                break;

            case "delete":
                int delId = Integer.parseInt(request.getParameter("id"));
                dao.deleteStudent(delId);
                response.sendRedirect("StudentServlet?action=list");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	HttpSession session = request.getSession(false);
    	if (session == null || session.getAttribute("loggedUser") == null) {
    	    response.sendRedirect("LoginServlet");
    	    return;
    	}

        String action = request.getParameter("action");

        if (action.equals("add")) {
        	Student s = new Student(0,
        		    request.getParameter("studentId"),
        		    request.getParameter("name"),
        		    request.getParameter("email"),
        		    request.getParameter("phone"),
        		    Integer.parseInt(request.getParameter("marks"))
        		);
            dao.addStudent(s);

        } else if (action.equals("edit")) {
        	Student s = new Student(
        		    Integer.parseInt(request.getParameter("id")),
        		    request.getParameter("studentId"),
        		    request.getParameter("name"),
        		    request.getParameter("email"),
        		    request.getParameter("phone"),
        		    Integer.parseInt(request.getParameter("marks"))
        		);
            dao.updateStudent(s);
        }

        response.sendRedirect("StudentServlet?action=list");
    }
}