/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Marcas;
import Modelo.Productos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Danielmced
 */
public class sr_Marca extends HttpServlet {
    Marcas marca;
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_Marca</title>");            
            out.println("</head>");
            out.println("<body>");
            marca = new Marcas(Integer.valueOf(request.getParameter("txt_id")),request.getParameter("txt_marca"));
            if("agregar".equals(request.getParameter("btn_agregar"))){
                if(marca.agregar() > 0){
                    response.sendRedirect("marcas.jsp");
                }else{
                    out.println("<h1>Error.............</h1>");
                    out.println("<a href-'marcas.jsp'>Regresar...</a>");
                }
            } 
            
            if("modificar".equals(request.getParameter("btn_modificar"))){
                if(marca.modificar() > 0){
                    response.sendRedirect("marcas.jsp");
                }else{
                    out.println("<h1>Error.............</h1>");
                    out.println("<a href-'marcas.jsp'>Regresar...</a>");
                }
            }   
            
            if("eliminar".equals(request.getParameter("btn_eliminar"))){
                if(marca.eliminar() > 0){
                    response.sendRedirect("marcas.jsp");
                }else{
                    out.println("<h1>Error.............</h1>");
                    out.println("<a href-'marcas.jsp'>Regresar...</a>");
                }
            } 
            out.println("</body>");
            out.println("</html>");
        }
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
