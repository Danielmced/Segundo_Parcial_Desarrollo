<%-- 
    Document   : marcas
    Created on : 21/09/2020, 09:50:02 PM
    Author     : Danielmced
--%>
<%@page import="Modelo.Productos" %>
<%@page import="Modelo.Marcas" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Productos</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="index.jsp">Productos CRUD</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="marcas.jsp">Marcas CRUD</a>
            </li>
          </ul>
        </nav>
        <h1>Marcas</h1>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_marca" onclick="limpiar()">Nueva Marca</button>
        
        <div class="container">
            
            <div class="modal" id="modal_marca">
                <div class="modal-dialog">
                  <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">Formulario Marca</h4>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                       <form action="sr_Marca" method="get" class="form-group">
                            <label for="lbl_id">ID:</label>
                            <input type="text" name="txt_id" id="txt_id" class="form-control" value ="0" readonly>
                            <label for="lbl_marca">Marca:</label>
                            <input type="text" name="txt_marca" id="txt_marca" class="form-control" placeholder="Maruchan" required>
                            
                            <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
                        </form>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                      <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div>
            
           
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID Marca</th>
                            <th>Marca</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_marcas">
                        <% 
                        Marcas marca = new Marcas();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = marca.leer();
                        for(int t=0;t<tabla.getRowCount();t++){
                            out.println("<tr data-id="+ tabla.getValueAt(t, 0) + ">");
                            out.println("<td>"+ tabla.getValueAt(t, 0) +"</td>");
                            out.println("<td>"+ tabla.getValueAt(t, 1) +"</td>");
                            out.println("</tr>");
                        }
                        %>
                    </tbody>
                </table>
        </div>
        
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar(){
                $("#txt_id").val(0);
                $("#txt_marca").val('');
            }
            
            $('#tbl_marcas').on('click','tr td',function(evt){
                var target,id,marca;
                target = $(event.target);
                id = target.parent().data('id');
                marca = target.parent("tr").find("td").eq(1).html();
                
                $("#txt_id").val(id);
                $("#txt_marca").val(marca);
                $("#modal_marca").modal('show');
            });
        </script>
    </body>
</html>
