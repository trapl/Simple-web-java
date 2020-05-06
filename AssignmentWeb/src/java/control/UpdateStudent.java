/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dbcontext.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.CourseName;
import model.Student;
import model.Student_Course;

/**
 *
 * @author DUONG
 */
@WebServlet(name = "UpdateStudent", urlPatterns = {"/updatestudent"})
public class UpdateStudent extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DBContext db= new DBContext();
        String id = request.getParameter("user");
        ArrayList<CourseName> co = db.getCoursebyStudentID(id);
        Student_Course stu = db.getStudentbyID(id);
        ArrayList<Course> course = db.getallCourse();
        request.setAttribute("course", course);
        request.setAttribute("co", co);
        request.setAttribute("stu", stu);
        request.getRequestDispatcher("view/updatestudent.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        DBContext db = new DBContext();
        String coursef = request.getParameter("coursef");
        String courset = request.getParameter("courset");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        Student stu = new Student();
        stu.setID(id);
        stu.setName(name);
        stu.setGender(gender);
        stu.setDob(Date.valueOf(dob));
        stu.setSdt(sdt);
        stu.setEmail(email);
        if(coursef == null || coursef.isEmpty()) db.insertCourseStudent(id, courset);
        else db.updateStudentCourse(id, coursef, courset);
        db.updateStudent(stu,id);
        response.sendRedirect("update?type=Student");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
