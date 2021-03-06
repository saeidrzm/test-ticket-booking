<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8" import="pakiet.*, sinan.database.ResultSet"%>

<%@ include file="../../partials/clientAuth.jsp"%>

<%@ include file="../../partials/header.jsp"%>
<%@ include file="../../partials/menu.jsp"%>

<script type="text/javascript">
	
	var idToDelete = 0;
	
	function confirmDelete(id){
		idToDelete = id;
		$('#confirmDeleteModal').modal();
	}
	
	function deleteEvent(){
		location.href = "user/client/deleteMessage.jsp?id="+idToDelete;
	}
</script>

<%

/*
Jest to strona, ktora wyswietla pojedyncza wiadomosc
*/

Booking bd = new Booking();
bd.connect();

ResultSet rs = bd.getMessage(request.getParameter("id"));
rs.next();

String eventName = rs.getString("name");
String email = rs.getString("email");
String message = rs.getString("message");
String title = rs.getString("title");
int messageId = rs.getInt("messageId");

bd.disconnect();
%>

<div class="container">
	<div class="page-header">
		  <h1>Wiadomość <small><%= eventName %></small></h1>
		</div>	
	<div class="row" style="margin-top: 40px;">
		<div class="col-md-3"></div>
			<div class="col-md-6">

			<div class="panel panel-default">
					  <div class="panel-heading"><b>Title: </b><%= title %></div>
					 
					    <ul class="list-group">
						    <li class="list-group-item"><b>Sender: </b><%= email %></li>
						    <li class="list-group-item"><%= message %></li>
						    <li class="list-group-item">
						    	<a href="user/client/messages.jsp" class="btn btn-default pull-left">Return</a>
						    	<a href="user/client/newMessage.jsp?messageId=<%= messageId %>" class="btn btn-info pull-right">Reply</a>
						    	<button class="btn btn-danger pull-right" onclick="confirmDelete(<%= messageId %>)" style="margin-right: 3px;">Delete</button>
						    	<br style="clear: both;">
						    </li>
						  </ul>				    
					 
					</div>
			
		</div>
		<div class="col-md-3"></div>
	</div>
</div>

<div class="modal fade" tabindex="-1" role="dialog" id="confirmDeleteModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete message</h4>
      </div>
      <div class="modal-body">
        <p>Really delete the selected message?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-danger" onclick="deleteEvent()">Delete</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<%@ include file="../../partials/footer.jsp"%>