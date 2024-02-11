 
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

 
@MultipartConfig
public class RegisterServlet extends HttpServlet {

     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             
            
            //fetching all the form data
            String check=request.getParameter("check");
            if(check==null)
            {
                out.println("You have forgotten to agree with our terms and conditions.");
            }
            else 
            {
                String name=request.getParameter("user_name");
                String password=request.getParameter("user_password");
                String email=request.getParameter("user_email");
                String gender=request.getParameter("user_gender");
                
                //creating a user object and setting all the above-mentioned name,password,email,gender data to the below-mentioned user object
                User user=new User(name,password,email,gender);
                
                //creating a user dao object cause the connection from the user to the database has already been made there
                UserDao dao=new UserDao(ConnectionProvider.getConnection());
                if(dao.saveUser(user))
                {
                    //save...
                    out.println("Done...");
                    
                    
                }
                else 
                {
                    out.println("Error...the Email address has been already used");
                }
            }
            
            
            
        }
    }

     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

     
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}
