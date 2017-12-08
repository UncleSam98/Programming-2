<%@page import="bp.Toy"%>
<%@page import="java.util.Date"%>
<%@page import="java.security.InvalidParameterException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
//SAVE TOY
	//check if save button was pressed
	//set boolean was save true
	//put all values into object
	//save object
	boolean saveSuccessful = false;
	if (request.getParameter("btnSave") != null) {
		Toy myToy = new Toy();
		myToy.getCircuit1().setVoltage(Double.parseDouble(request.getParameter("volt1")));
		myToy.getCircuit1().setResistance(Double.parseDouble(request.getParameter("resis1")));
		myToy.getCircuit1().calculateAmperage();
		myToy.getCircuit1().setManufactureLocation(request.getParameter("location1"));
		
		myToy.getCircuit2().setVoltage(Double.parseDouble(request.getParameter("volt2")));
		myToy.getCircuit2().setResistance(Double.parseDouble(request.getParameter("resis2")));
		myToy.getCircuit2().calculateAmperage();
		myToy.getCircuit2().setManufactureLocation(request.getParameter("location2"));
		
		myToy.setInspector(request.getParameter("inspectorName"));
		myToy.setInspectionDateTime(new Date());
		String toyID = null;
		toyID = request.getParameter("toyID");
		myToy.setToyID(Integer.parseInt(toyID));
		
		myToy.save();
		
		saveSuccessful = true;
		
	}
//DELETE TOY
	boolean wasDeleted = false;
	if (request.getParameter("btnDelete") != null) {
		Toy myToy = new Toy();
		myToy.setToyID(Integer.parseInt(request.getParameter("deleteID")));
		myToy.delete();
		wasDeleted = true;
	}
 
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Toy Inspection</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  body, html {
    height: 100%;
	}
	.bg { 
    /* The image used */
    background-image:url(https://wallpaperscraft.com/image/toys_multicolored_collection_variety_31608_1920x1080.jpg);

    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
	}
  	body {
  	padding-top: 50px;
  	}
  	.starter-template {
  	padding: 40px 15px;
  	text-align: center;
  	}
  	.white-blur{
  		text-shadow: 0px 0px 26px rgba(255, 255, 255, 1);
  	}
  	
  </style>
</head>

  <body class="bg">
  
  


      <div class="starter-template container">
        <h1 class="white-blur">Toy Inspection</h1>
        <div class="row" style="margin-bottom: 2em; margin-top: 2em;">
        <div class="col-2 col-offset-5">
        	<form method="post" class="form-inline">
        		
				  <div class="form-group">
				 	 <input required type="number" name ="loadID" class="form-control" id="loadID" placeholder="Toy ID">
				    	<button type="submit" name ="btnLoad" class="btn btn-success btn-lg">Load</button>
				  </div>
				
			</form>
			</div>
		</div> <!-- LOAD TOY -->
		<% //if load button (btnload !=null) was pressed
		
		if (request.getParameter("btnLoad") != null) {
			try {
				Toy myToy = new Toy();
				
				
				String loadID = null;
				loadID = request.getParameter("loadID");
				myToy.load(Integer.parseInt(loadID));
			
		//load the stuff into object (from load id)
		//add seperate message if toy does not exist%>
		
		<div class="row">
			<div class="panel panel-default">
	 		 	<div class="panel-heading">
	 		 		<b>Toy ID:</b> <%out.print(myToy.getToyID());%> 
	 		 		<br>
	 		 		<b>Inspector Name:</b> <%out.print(myToy.getInspector());%> 
	 		 		<br>
	 		 		<b>Inspection Time:</b> <%out.print(myToy.getInspectionDateTime());%> 
	 		 	</div>
	  			<div class="panel-body">
	  				<div class="col-sm-6">
	  					<h5>Circuit 1:</h5>
	  					<p>Voltage: <% out.print(myToy.getCircuit1().getVoltage()); %></p>
	  					<p>Resistance: <% out.print(myToy.getCircuit1().getResistance()); %></p>
	  					<p>Amperage: <% out.print(myToy.getCircuit1().getAmperage()); %></p>
	  					<p>Location: <% out.print(myToy.getCircuit1().getManufactureLocation()); %> </p>
	  				</div>
	  				<div class="col-sm-6">
	  					<h5>Circuit 2:</h5>
	  					<p>Voltage: <% out.print(myToy.getCircuit2().getVoltage()); %> </p>
	  					<p>Resistance: <% out.print(myToy.getCircuit2().getResistance()); %> </p>
	  					<p>Amperage: <% out.print(myToy.getCircuit2().getAmperage()); %></p>
	  					<p>Location: <% out.print(myToy.getCircuit2().getManufactureLocation()); %></p>
	  				</div>
	  			
	  			
					 <button type="submit" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#deleteToy">Delete</button>
  					<!-- Modal -->
					<div id="deleteToy" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					
					    <!-- Modal content-->
					    <!-- DELETE TOY-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">Are you sure you want to delete Toy ID:<%out.print(myToy.getToyID()); %>?</h4>
					      </div>
					      <div class="modal-body">
					      <form method="post">
					       <div class="form-group">
							 	 <input type="hidden" name="deleteID" id="deleteID" value="<%out.print(myToy.getToyID()); %>">
							    	<button type="submit" name="btnDelete" id="btnDelete" class="btn btn-danger btn-lg">Delete</button>
							  
					        <button type="button" class="btn btn-info btn-lg" data-dismiss="modal">Cancel</button>
					        </div>
					        </form>
					      </div>
					    </div>
					
					  </div>
	  			
	  			</div>
			</div>
			
			
		</div>
		<% 
			} catch (InvalidParameterException e) {
				%>
				<div class="alert alert-danger">
  					 Toy ID <%out.print(request.getParameter("loadID")); %> not found!
				</div>
				
				<% 
			}
		}
		
		if (saveSuccessful) {
			%>
			<div class="alert alert-success">
					 Toy ID <%out.print(request.getParameter("toyID")); %> saved!
			</div>
			
			<% 
		}
		
		if (wasDeleted) {
			%>
			<div class="alert alert-info">
					 Toy ID <%out.print(request.getParameter("deleteID")); %> was deleted!
			</div>
			
			<% 
		}
		
		%>
        <!-- Trigger the modal with a button -->
        <!-- SAVE TOY -->
        
        <div class="row">
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#createToy" style="margin-top: 15px" >Add Toy</button>
		</div>
		
		<!-- Modal -->
		<div id="createToy" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Enter New Toy</h4>
		      </div>
		      <div class="modal-body">
		       <form method="post">
				  <div class="form-group">
				    <label for="inspector">Inspector Name:</label>
				    <input required type="text" class="form-control" name="inspectorName" id="inspector" placeholder="Inspector Name">
				  </div>
				  <div class="form-group">
				   <label for="ToyID">Toy ID:</label>
				    <input required type="number" class="form-control" name="toyID" id="ToyID" placeholder="Toy ID">
				  </div>
				  	<div class="form-group">
				  	
				  	<div class="col-sm-6">
				  		<label class="control-label">Circuit 1:</label>
				  		<input required type="number" class="form-control" name="volt1" id="volt1" step="0.01" min="0.01" placeholder="Voltage">
				  		<input required type="number" class="form-control" name="resis1" id="resis1" step="0.01" min="0.01" placeholder="Resistance" style="margin-top: 6px">
				  		<label class="control-label"style="padding-top: 5px">Location</label>
				  			<select class="form-control" name="location1" id="location1">
				  			<option value="United States">United States</option>
				  			<option value="Germany">Germany</option>
				  			<option value="China">China</option>
				  			</select>
				  	</div>
				  		  	<div class="col-sm-6">
				  		<label class="control-label">Circuit 2:</label>
				  		<input required required type="number" class="form-control" name="volt2" id="volt2" step="0.01" min="0.01" placeholder="Voltage">
				  		<input required type="number" class="form-control" name="resis2" id="resis2" step="0.01" min="0.01" placeholder="Resistance" style="margin-top: 6px">
				  		<label class="control-label"style="padding-top: 5px">Location</label>
				  			<select class="form-control" name="location2" id="location2">
				  			<option value="United States">United States</option>
				  			<option value="Germany">Germany</option>
				  			<option value="China">China</option>
				  			</select>
				  	</div>
				  	</div>
				  <div class="row">
				  </div>
				  <button type="submit" name="btnSave" class="btn btn-success btn-md" style="margin-top:15px">Submit</button>
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		
		  </div>
		</div>
      </div>

    </div><!-- /.container -->
  </body>
</html>
