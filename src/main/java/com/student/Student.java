package com.student;

public class Student {
    private int id;
    private String studentId;
    private String name;
    private String email;
    private String phone;
    private int marks;

    public Student(int id, String studentId, String name, String email, String phone, int marks) {
        this.id = id;
        this.studentId = studentId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.marks = marks;
    }

    public int getId()           { return id; }
    public String getStudentId() { return studentId; }
    public String getName()      { return name; }
    public String getEmail()     { return email; }
    public String getPhone()     { return phone; }
    public int getMarks()        { return marks; }

    public void setId(int id)                { this.id = id; }
    public void setStudentId(String studentId) { this.studentId = studentId; }
    public void setName(String name)         { this.name = name; }
    public void setEmail(String email)       { this.email = email; }
    public void setPhone(String phone)       { this.phone = phone; }
    public void setMarks(int marks)          { this.marks = marks; }
}