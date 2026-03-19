# Student Management System

A full-stack web application built with Java Servlets, JSP, JDBC and MySQL.

## Features
- Login system with session management
- Add, View, Edit, Delete student records
- Custom Student ID field
- Automatic grade calculation (A/B/C/D/F)
- Column sorting
- Responsive design for mobile and desktop
- Total student count

## Technologies Used
- Java (Servlets)
- JSP (Java Server Pages)
- JDBC (Java Database Connectivity)
- MySQL
- Apache Tomcat 10.1
- HTML and CSS

## How to Run
1. Clone this repository
2. Import as Dynamic Web Project in Eclipse
3. Create MySQL database using this SQL:
```sql
CREATE DATABASE studentdb;
USE studentdb;
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(20),
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    marks INT
);
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50)
);
INSERT INTO users (username, password) VALUES ('admin', 'admin123');
```
4. Update DBConnection.java with your MySQL password
5. Add MySQL Connector JAR to build path
6. Run on Apache Tomcat 10.1

## Login Credentials
- Username: `admin`
- Password: `admin123`

## Screenshots
<img width="667" height="717" alt="image" src="https://github.com/user-attachments/assets/ac12b140-a8e1-4055-9589-4a19ff475549" />

<img width="1919" height="714" alt="image" src="https://github.com/user-attachments/assets/484fc241-4e8d-4561-b86c-5e61a9922cb6" />

<img width="695" height="753" alt="image" src="https://github.com/user-attachments/assets/a21be728-8f1c-478b-abff-f8bca70b6219" />

