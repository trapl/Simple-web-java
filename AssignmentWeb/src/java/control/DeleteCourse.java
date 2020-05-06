/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dbcontext.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.CoursePager;
import model.Student;
import model.Teacher;

/**
 *
 * @author DUONG
 */
@WebServlet(name = "DeleteCourse", urlPatterns = {"/deletecourse"})
public class DeleteCourse extends HttpServlet {

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
        DBContext db = new DBContext();
        String id = request.getParameter("user");
        db.deleteCourseAddress(id);
        db.deleteCourseStudent(id);
        db.deleteCourseTeacher(id);
        db.deleteCoursebyID(id);
          List<Course> list = db.getallCourse();
         int start=0;
            int end = 3;
            if(list.size()<3){
                end=list.size();
            }
            if(request.getParameter("start")!=null){
                start=Integer.parseInt(request.getParameter("start"));
            }
            if(request.getParameter("end")!=null){
                end=Integer.parseInt(request.getParameter("end"));
            }
            List<Course> course = db.getListCourseByPage(list, start, end);
      
       
      
        request.setAttribute("course", course);
  
        request.setAttribute("Type", "Course");
        request.getRequestDispatcher("view/deletecourse.jsp").forward(request, response);           
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
        processRequest(request, response);
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
        processRequest(request, response);
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
