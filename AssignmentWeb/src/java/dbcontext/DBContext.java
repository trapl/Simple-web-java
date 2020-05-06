/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbcontext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.CourseName;
import model.CoursePager;
import model.Role_Feature;
import model.Student;
import model.Student_Course;
import model.Teacher;
import model.TeacherCourse;


/**
 *
 * @author DUONG
 */
public class DBContext {
     protected Connection connection;
        public DBContext() {
        try {
            String url = "jdbc:sqlserver://DESKTOP-S166IPC:1433;databaseName=AssignmentJavaWeb";
            String username = "sa";
            String password = "sa";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        public ArrayList<Course> getallCourse(){
            String sql="select c.ID_course,c.Name,c.Slot,c.Cost,c.Info,c.Status,te.Name as Mentor,s.Time from Course c,"
                    + "Course_Teacher t,Teacher te,Slot s where c.ID_course=t.ID_Course and te.ID_Teacher=t.ID_Teacher and s.ID_Slot=t.Slot order by c.ID_course";
            ArrayList<Course> course = new ArrayList<>();
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    Course c = new Course();
                    c.setID(rs.getString("ID_course"));
                    c.setName(rs.getString("Name"));
                    c.setSlot(rs.getInt("Slot"));
                    c.setCost(rs.getString("Cost"));
                    c.setInfo(rs.getString("Info"));
                    c.setStatus(rs.getString("Status"));
                    c.setMentor(rs.getString("Mentor"));
                    c.setTime(rs.getString("Time"));
                    course.add(c);
                }
            } catch (SQLException e) {
            }
            return course;
        }
        
        public Course getCoursebyID(String id){
            String sql="select c.ID_course,c.Name,c.Slot,c.Cost,c.Info,c.Status,te.Name as Mentor,s.Time from Course c,"
                    + "Course_Teacher t,Teacher te,Slot s where c.ID_course=t.ID_Course and te.ID_Teacher=t.ID_Teacher and s.ID_Slot=t.Slot and c.ID_course=? order by c.ID_course";
            Course c = new Course();
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    c.setID(rs.getString("ID_course"));
                    c.setName(rs.getString("Name"));
                    c.setSlot(rs.getInt("Slot"));
                    c.setCost(rs.getString("Cost"));
                    c.setInfo(rs.getString("Info"));
                    c.setStatus(rs.getString("Status"));
                    c.setMentor(rs.getString("Mentor"));
                    c.setTime(rs.getString("Time"));
                }
            } catch (SQLException e) {
            }
            return c;
        }
        public Student_Course getStudentbyID(String id){
            Student_Course student = new Student_Course();
            String sql="select * from Student where Student.ID_Student=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    student.setID(rs.getString("ID_Student"));
                    student.setName(rs.getString("Name"));
                    student.setGender(rs.getString("Gender"));
                    student.setDob(rs.getDate("DOB"));
                    student.setSdt(rs.getString("SDT"));
                    student.setEmail(rs.getString("Email"));
                }
            } catch (SQLException e) {
            }
            return student;
        }
        public Teacher getTeacherbyID(String id){
            Teacher student = new Teacher();
            String sql="select * from Teacher where Teacher.ID_Teacher=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    student.setID(rs.getString("ID_Teacher"));
                    student.setName(rs.getString("Name"));
                    student.setGender(rs.getString("Gender"));
                    student.setDob(rs.getDate("DOB"));
                    student.setSdt(rs.getString("SDT"));
                    student.setEmail(rs.getString("Email"));
                }
            } catch (SQLException e) {
            }
            return student;
        }
        public ArrayList<Student> getallStudent(){
            String sql="select * from Student";
            ArrayList<Student> student = new ArrayList<>();
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    Student s = new Student();
                    s.setID(rs.getString("ID_Student"));
                    s.setName(rs.getString("Name"));
                    s.setGender(rs.getString("Gender"));
                    s.setDob(rs.getDate("DOB"));
                    s.setSdt(rs.getString("SDT"));
                    s.setEmail(rs.getString("Email"));
                    student.add(s);
                }
            } catch (SQLException e) {
            }
            return student;
        }
        public ArrayList<Teacher> getallTeacher(){
            String sql="select * from Teacher";
            ArrayList<Teacher> teacher = new ArrayList<>();
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    Teacher s = new Teacher();
                    s.setID(rs.getString("ID_Teacher"));
                    s.setName(rs.getString("Name"));
                    s.setGender(rs.getString("Gender"));
                    s.setDob(rs.getDate("DOB"));
                    s.setSdt(rs.getString("SDT"));
                    s.setEmail(rs.getString("Email"));
                    teacher.add(s);
                }
            } catch (SQLException e) {
            }
            return teacher;
        }
        public ArrayList<CourseName> getCoursebyStudentID(String id){
            String sql="select s.ID_Course,c.Name from Course c,Course_Student s where c.ID_course=s.ID_Course and s.ID_Student=?";
            ArrayList<CourseName> co = new ArrayList<>();
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    CourseName c = new CourseName();
                    c.setId(rs.getString("ID_Course"));
                    c.setName(rs.getString("Name"));
                    co.add(c);
                }
            } catch (SQLException e) {
            }
            return co;
        }
        public ArrayList<TeacherCourse> getTeachingbyTeacherID(String id){
            ArrayList<TeacherCourse> teach = new ArrayList<>();
            String sql="select c.ID_course,c.Name,ca.Address,s.Time from Course c,Course_Address ca, Course_Teacher ct,Slot s where"
                    + " c.ID_course=ca.ID_Course and c.ID_course=ct.ID_Course and s.ID_Slot=ct.Slot and ct.ID_Teacher=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    TeacherCourse tea = new TeacherCourse();
                    tea.setId(rs.getString("ID_course"));
                    tea.setName(rs.getString("Name"));
                    tea.setAddress(rs.getString("Address"));
                    tea.setTime(rs.getString("Time"));
                    teach.add(tea);
                }
            } catch (SQLException e) {
            }
            return teach;
        }
        public String getIdTeacherbyUsername(String user){
            String sql = "select t.ID_Teacher from Teacher t,Teacher_Account ta where ta.ID_Teacher=t.ID_Teacher and ta.Username = ?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, user);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    return rs.getString("ID_Teacher");
                }  
            } catch (SQLException e) {
            }
            return "";
        }
        public ArrayList<Student> getStudentbyCourseID(String id){
            String sql="select s.* from Student s,Course_Student c where s.ID_Student=c.ID_Student and c.ID_Course=?";
            ArrayList<Student> stu = new ArrayList<>();
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    Student s = new Student();
                    s.setID(rs.getString("ID_Student"));
                    s.setName(rs.getString("Name"));
                    s.setGender(rs.getString("Gender"));
                    s.setDob(rs.getDate("DOB"));
                    s.setSdt(rs.getString("SDT"));
                    s.setEmail(rs.getString("Email"));
                    stu.add(s);                    
                }
            } catch (SQLException e) {
            }
            return stu;
        }
        public void deleteStudentbyID(String id){
            String sql = "delete from Student where Student.ID_Student=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                pre.executeUpdate();
            } catch (SQLException e) {
            }
        }
        public void deleteCoursebyID(String id){
            String sql = "delete from Course where Course.ID_course=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                pre.executeUpdate();
            } catch (SQLException e) {
            }
        }
        public void deleteTeacherbyID(String id){
            String sql = "delete from Teacher where Teacher.ID_Teacher=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                pre.executeUpdate();
            } catch (SQLException e) {
            }
        }
        public void deleteCourseStudent(String id){
            String sql = "delete from Course_Student where Course_Student.ID_Course=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                pre.executeUpdate();
            } catch (SQLException e) {
            }            
        }
        public void deleteCourseTeacher(String id){
            String sql = "delete from Course_Teacher where Course_Teacher.ID_Course=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                pre.executeUpdate();
            } catch (SQLException e) {
            }            
        }
        public void deleteCourseAddress(String id){
            String sql = "delete from Course_Address where Course_Address.ID_Course=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                pre.executeUpdate();
            } catch (SQLException e) {
            }            
        }
        public void deleteTeacherCourse(String id){
            String sql = "delete from Course_Teacher where Course_Teacher.ID_Teacher=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                pre.executeUpdate();
            } catch (SQLException e) {
            }            
        }
        public void deleteTeacherAccount(String id){
            String sql = "delete from Teacher_Account where Teacher_Account.ID_Teacher=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                pre.executeUpdate();
            } catch (SQLException e) {
            }            
        }
        public void deleteStudentCourse(String id){
            String sql = "delete from Course_Student where Course_Student.ID_Student=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                pre.executeUpdate();
            } catch (SQLException e) {
            }            
        }
        public ArrayList<Role_Feature> getRoleFeature(String username){
            String sql="select r.ID_Role,a.Username,f.Feature,r.Servlet from Role_Feature r ,Feature f,Role_Account a where f.Servlet=r.Servlet and a.ID_Role=r.ID_Role and a.Username=?";
            ArrayList<Role_Feature> feature = new ArrayList<>();
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, username);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    Role_Feature r = new Role_Feature();
                    r.setID(rs.getString("ID_Role"));
                    r.setUsername(rs.getString("Username"));
                    r.setFeature(rs.getString("Feature"));
                    r.setUrl(rs.getString("Servlet"));
                    feature.add(r);
                } 
            } catch (SQLException e) {
            }
            return feature;
        }
        public String checkLogin(String username,String password){
            String sql = "select * from Account";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    if(rs.getString("Username").equals(username)&&rs.getString("Password").equals(password)){
                        return username;
                    }
                }
            } catch (SQLException e) {
            }
            return null;
        }
        public void Insertcourse(String id,String name,String slot,String cost,String info,String status){
            String sql = "INSERT INTO [dbo].[Course]\n"
                    + "           ([ID_course]\n"
                    + "           ,[Name]\n"
                    + "           ,[Slot]\n"
                    + "           ,[Cost]\n"
                    + "           ,[Info]\n"
                    + "           ,[Status])\n"
                    + "     VALUES(\n"
                    + "           ?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                pre.setString(2, name);
                pre.setInt(3, Integer.parseInt(slot));
                pre.setString(4, cost);
                pre.setString(5, info);
                pre.setString(6, status);
                pre.executeUpdate();
            } catch (SQLException e) {
            }
        }
        public void InsertTeacher(Teacher teacher){
            String sql = "INSERT INTO [dbo].[Teacher]\n"
                    + "           ([ID_Teacher]\n"
                    + "           ,[Name]\n"
                    + "           ,[Gender]\n"
                    + "           ,[DOB]\n"
                    + "           ,[SDT]\n"
                    + "           ,[Email])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, teacher.getID());
                pre.setString(2, teacher.getName());
                pre.setString(3, teacher.getGender());
                pre.setDate(4, teacher.getDob());
                pre.setString(5, teacher.getSdt());
                pre.setString(6, teacher.getEmail());
                pre.executeUpdate();
            } catch (SQLException e) {
            }
        }
        public String getNewestCourseID(){
            String sql="select MAX(c.ID_course) as ID from Course c";
            String id="";
            PreparedStatement pre;
            try {
                pre = connection.prepareStatement(sql);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    id=String.valueOf(rs.getInt("ID"));
                    id=String.valueOf(Integer.parseInt(id)+1);
                }
            } catch (SQLException e) {
            }
            return id;
        }
        public String getNewestTeacherID(){
            String sql="select MAX(t.ID_Teacher) as ID from Teacher t";
            String id="";
            PreparedStatement pre;
            try {
                pre = connection.prepareStatement(sql);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    id=String.valueOf(rs.getInt("ID"));
                    id=String.valueOf(Integer.parseInt(id)+1);
                }
            } catch (SQLException e) {
            }
            return id;
        }
        public String getNewestStudentID(){
            String sql="select MAX(t.ID_Student) as ID from Student t";
            String id="";
            PreparedStatement pre;
            try {
                pre = connection.prepareStatement(sql);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    id=String.valueOf(rs.getInt("ID"));
                    id=String.valueOf(Integer.parseInt(id)+1);
                }
            } catch (SQLException e) {
            }
            return id;
        }
        public void InsertcourseTeacher(String idtc,String idco,String slot){
            String sql = "INSERT INTO [dbo].[Course_Teacher]\n"
                    + "           ([ID_Teacher]\n"
                    + "           ,[ID_Course]\n"
                    + "           ,[Slot])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, idtc);
                pre.setString(2, idco);
                pre.setInt(3, Integer.parseInt(slot));
                pre.executeUpdate();
            } catch (SQLException e) {
            }
        }
        public void InsertTeacherAccount(String idtc,String user){
            String sql = "INSERT INTO [dbo].[Teacher_Account]\n"
                    + "           ([ID_Teacher]\n"
                    + "           ,[Username])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, idtc);
                pre.setString(2,user);
                pre.executeUpdate();
            } catch (SQLException e) {
            }
        }
        public void insertCourseStudent(String idhv,String course){
            String sql = "INSERT INTO [dbo].[Course_Student]\n"
                    + "           ([ID_Student]\n"
                    + "           ,[ID_Course])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, idhv);
                pre.setString(2, course);
                pre.executeUpdate();
            } catch (SQLException e) {
            }
        }
        public void insertStudent(Student stu){
            String sql = "INSERT INTO [dbo].[Student]\n"
                    + "           ([ID_Student]\n"
                    + "           ,[Name]\n"
                    + "           ,[Gender]\n"
                    + "           ,[DOB]\n"
                    + "           ,[SDT]\n"
                    + "           ,[Email])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, stu.getID());
                pre.setString(2, stu.getName());
                pre.setString(3, stu.getGender());
                pre.setDate(4, stu.getDob());
                pre.setString(5, stu.getSdt());
                pre.setString(6, stu.getEmail());
                pre.executeUpdate();
            } catch (SQLException e) {
            }
        }
        public void updateStudentCourse(String idhv,String coursef,String courset){
            String sql = "UPDATE [dbo].[Course_Student]\n"
                    + "   SET [ID_Student] =? \n"
                    + "      ,[ID_Course] = ?\n"
                    + " WHERE ID_Student=? and ID_Course=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, idhv);
                pre.setString(2, courset);
                pre.setString(3, idhv);
                pre.setString(4, coursef);
                pre.executeUpdate();
            } catch (SQLException e) {
            }
        }
        public void updateStudent(Student stu,String id){
            String sql = "UPDATE [dbo].[Student]\n"
                    + "   SET [ID_Student] = ?\n"
                    + "      ,[Name] = ?\n"
                    + "      ,[Gender] = ?\n"
                    + "      ,[DOB] =?\n"
                    + "      ,[SDT] = ?\n"
                    + "      ,[Email] = ?\n"
                    + " WHERE ID_Student=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, stu.getID());
                pre.setString(2, stu.getName());
                pre.setString(3, stu.getGender());
                pre.setDate(4, stu.getDob());
                pre.setString(5, stu.getSdt());
                pre.setString(6, stu.getEmail());
                pre.setString(7,id);
                pre.executeUpdate();
            } catch (SQLException e) {
            }
        }
        public void updateTeacher(Teacher stu,String id){
            String sql = "UPDATE [dbo].[Teacher]\n"
                    + "   SET [ID_Teacher] = ?\n"
                    + "      ,[Name] = ?\n"
                    + "      ,[Gender] =? \n"
                    + "      ,[DOB] = ?\n"
                    + "      ,[SDT] = ?\n"
                    + "      ,[Email] =? \n"
                    + " WHERE Teacher.ID_Teacher=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, stu.getID());
                pre.setString(2, stu.getName());
                pre.setString(3, stu.getGender());
                pre.setDate(4, stu.getDob());
                pre.setString(5, stu.getSdt());
                pre.setString(6, stu.getEmail());
                pre.setString(7,id);
                pre.executeUpdate();
            } catch (SQLException e) {
            }
        }
        public void updateCourse(String id,String name,String slot,String cost,String info,String status){
            String sql = "UPDATE [dbo].[Course]\n"
                    + "   SET [ID_course] = ?\n"
                    + "      ,[Name] = ?\n"
                    + "      ,[Slot] = ?\n"
                    + "      ,[Cost] = ?\n"
                    + "      ,[Info] = ?\n"
                    + "      ,[Status] = ? \n"
                    + " WHERE Course.ID_course=?";
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setString(1, id);
                pre.setString(2, name);
                pre.setInt(3, Integer.parseInt(slot));
                pre.setString(4, cost);
                pre.setString(5, info);
                pre.setString(6, status);
                pre.setString(7,id);
                pre.executeUpdate();
            } catch (SQLException e) {
            }
        }
        public ArrayList<Student> pagerStudent(int pageindex,int pagesize){
            String sql = "SELECT ID_Student,Name,Gender,DOB,SDT,Email\n"
                    + "                    FROM\n"
                    + "                    (SELECT ROW_NUMBER() OVER (ORDER BY ID_Student ASC) as rownum, t.ID_Student,t.Name,t.Gender,t.DOB,t.SDT,t.Email FROM Student t\n"
                    + "			) as tblHuman\n"
                    + "                    WHERE\n"
                    + "                    rownum >= ((?-1) * ?) + 1 AND rownum <= ? * ?";
            ArrayList<Student> stu = new ArrayList<>();
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setInt(1, pageindex);
                pre.setInt(2, pagesize);
                pre.setInt(3, pagesize);
                pre.setInt(4, pageindex);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    Student t = new Student();
                    t.setID(rs.getString("ID_Student"));
                    t.setName(rs.getString("Name"));
                    t.setGender(rs.getString("Gender"));
                    t.setDob(rs.getDate("DOB"));
                    t.setSdt(rs.getString("SDT"));
                    t.setEmail(rs.getString("Email"));
                    stu.add(t);
                }
            } catch (SQLException e) {
            }
            return stu;
        }
        public int countStudent() {
            String sql = "select COUNT(*) as totalrow from Student";
            PreparedStatement statement;
            try {
                statement = connection.prepareStatement(sql);
                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalrow");
                }
            } catch (SQLException ex) {
                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            return 0;
        }
        public ArrayList<Teacher> pagerTeacher(int pageindex,int pagesize){
            String sql = "SELECT ID_Teacher,Name,Gender,DOB,SDT,Email\n"
                    + "                    FROM\n"
                    + "                    (SELECT ROW_NUMBER() OVER (ORDER BY ID_Teacher ASC) as rownum, t.ID_Teacher,t.Name,t.Gender,t.DOB,t.SDT,t.Email FROM Teacher t\n"
                    + "			) as tblHuman\n"
                    + "                    WHERE\n"
                    + "                    rownum >= ((?-1) * ?) + 1 AND rownum <= ? * ?";
            ArrayList<Teacher> stu = new ArrayList<>();
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setInt(1, pageindex);
                pre.setInt(2, pagesize);
                pre.setInt(3, pagesize);
                pre.setInt(4, pageindex);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    Teacher t = new Teacher();
                    t.setID(rs.getString("ID_Teacher"));
                    t.setName(rs.getString("Name"));
                    t.setGender(rs.getString("Gender"));
                    t.setDob(rs.getDate("DOB"));
                    t.setSdt(rs.getString("SDT"));
                    t.setEmail(rs.getString("Email"));
                    stu.add(t);
                }
            } catch (SQLException e) {
            }
            return stu;
        }
        public int countTeacher() {
            String sql = "select COUNT(*) as totalrow from Teacher";
            PreparedStatement statement;
            try {
                statement = connection.prepareStatement(sql);
                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalrow");
                }
            } catch (SQLException ex) {
                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            return 0;
        }
        public ArrayList<Course> pagerCourse(int pageindex,int pagesize){
            String sql = "SELECT ID_course,Name,Slot,Cost,Info,Status,Name as Mentor , Time\n"
                    + "                                       FROM\n"
                    + "                                       (SELECT ROW_NUMBER() OVER (ORDER BY c.ID_course ASC) as rownum, c.ID_course,c.Name,c.Slot,c.Cost,c.Info,c.Status,te.Name as Mentor,s.Time from Course c,\n"
                    + "						Course_Teacher t,Teacher te,Slot s where c.ID_course=t.ID_Course and te.ID_Teacher=t.ID_Teacher and s.ID_Slot=t.Slot) as tblHuman\n"
                    + "                                  WHERE rownum >= ((?-1) * ?) + 1 AND rownum <= ? * ?";
            ArrayList<Course> stu = new ArrayList<>();
            PreparedStatement pre;
            try {
                pre=connection.prepareStatement(sql);
                pre.setInt(1, pageindex);
                pre.setInt(2, pagesize);
                pre.setInt(3, pagesize);
                pre.setInt(4, pageindex);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    Course c = new Course();
                    c.setID(rs.getString("ID_course"));
                    c.setName(rs.getString("Name"));
                    c.setSlot(rs.getInt("Slot"));
                    c.setCost(rs.getString("Cost"));
                    c.setInfo(rs.getString("Info"));
                    c.setStatus(rs.getString("Status"));
                    c.setMentor(rs.getString("Mentor"));
                    c.setTime(rs.getString("Time"));
                    stu.add(c);
                }
            } catch (SQLException e) {
            }
            return stu;
        }
        public int countCourse() {
            String sql = "select COUNT(*) as totalrow from Course";
            PreparedStatement statement;
            try {
                statement = connection.prepareStatement(sql);
                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalrow");
                }
            } catch (SQLException ex) {
                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            return 0;
        }
        
          public List<Student> getListStudentByPage(List<Student> list,int start,int end){
        List<Student> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
          
               public List<Teacher> getListTeacherByPage(List<Teacher> list,int start,int end){
        List<Teacher> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
          
        public ArrayList<CoursePager> getListCoursePagerByPage(ArrayList<CoursePager> list,int start,int end){
        ArrayList<CoursePager> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
        public List<Course> getListCourseByPage(List<Course> list,int start,int end){
        List<Course> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
      
      
        public String sqlCourse(String name,String costf,String costt){    
            ArrayList<String> sql = new ArrayList<>();
            String s=" ";
            if(name!=null&&!name.isEmpty()) sql.add(" Name like '%"+name+"%' ");
            if(costf!=null&&costt!=null&&!costf.isEmpty()&&!costt.isEmpty()) sql.add(" Cost between '"+costf+"' and '"+costt+"' ");
            else{
                if(costf!=null&&!costf.isEmpty()) sql.add(" Cost >= '"+costf+"' ");
                if(costt!=null&&!costt.isEmpty()) sql.add(" Cost <= '"+costt+"' ");
            }
            if(sql.isEmpty()) return s;
            else s+=" where ";
            for(int i=0;i<sql.size();i++){
                s+=sql.get(i);
                if(i<sql.size()-1&&!sql.get(i+1).isEmpty()){
                    s+=" and ";
                }
            }
            return s;
        }
        public String sqlStudent(String name,String gender,String dobf,String dobt){    
            ArrayList<String> sql = new ArrayList<>();
            String s=" ";
            if(name!=null&&!name.isEmpty()) sql.add(" Name like '%"+name+"%' ");
            if(gender!=null&&!gender.isEmpty()) 
            {
                if(gender.equals("Nam")) sql.add(" Gender like 'Nam' ");
                        else sql.add(" Gender not like 'Nam' ");
            }
            if(dobf!=null&&dobt!=null&&!dobf.isEmpty()&&!dobt.isEmpty()) sql.add(" DOB between '"+dobf+"' and '"+dobt+"' ");
            else{
                if(dobf!=null&&!dobf.isEmpty()) sql.add(" DOB >= '"+dobf+"' ");
                if(dobt!=null&&!dobt.isEmpty()) sql.add(" DOB <= '"+dobt+"' ");
            }
            if(sql.isEmpty()) return s;
            else s+=" where ";
            for(int i=0;i<sql.size();i++){
                s+=sql.get(i);
                if(i<sql.size()-1&&!sql.get(i+1).isEmpty()){
                    s+=" and ";
                }
            }
            return s;
        }        
        public ArrayList<Student> searchStudent(String sqll){
            String sql="SELECT ID_Student,Name,Gender,DOB,SDT,Email FROM Student  "+sqll;
            PreparedStatement pre;
            ArrayList<Student> stu = new ArrayList<>();
            try {
                pre=connection.prepareStatement(sql);
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                    Student t = new Student();
                    t.setID(rs.getString("ID_Student"));
                    t.setName(rs.getString("Name"));
                    t.setGender(rs.getString("Gender"));
                    t.setDob(rs.getDate("DOB"));
                    t.setSdt(rs.getString("SDT"));
                    t.setEmail(rs.getString("Email"));
                    stu.add(t);
                }
            } catch (SQLException e) {
            }
            return stu;
        }
        public ArrayList<CoursePager> searchCourse(String sqll){
            String sql = "SELECT ID_course,Name,Slot,Cost,Info,Status\n"
                    + " FROM  Course  "+sqll;
            PreparedStatement pre;
            ArrayList<CoursePager> stu = new ArrayList<>();
            try {
                pre=connection.prepareStatement(sql);
               
                ResultSet rs = pre.executeQuery();
                while(rs.next()){
                   CoursePager c = new CoursePager();
                    c.setID(rs.getString("ID_course"));
                    c.setName(rs.getString("Name"));
                    c.setSlot(rs.getInt("Slot"));
                    c.setCost(rs.getString("Cost"));
                    c.setInfo(rs.getString("Info"));
                    c.setStatus(rs.getString("Status"));
                    stu.add(c);
                }
            } catch (SQLException e) {
            }
            return stu;
        }
    public static String money(String money){
        String re="";
        for(int i=money.length();i>0;i--){
            re+=money.charAt(money.length()-i);
            if((i-1)%3==0){
                re+=".";
            }
        }
        if(re.endsWith(".")) re=re.substring(0, re.length()-1);
        return re;
    }
}
