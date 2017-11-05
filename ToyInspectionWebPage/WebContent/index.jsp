<%@page import="bp.Toy"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
//set boolean false
	boolean save = false;
	if (request.getParameter("btnSave") != null) {
		Toy myToy = new Toy();
		myToy.getCircuit1().setVoltage(Double.parseDouble(request.getParameter("volt1")));
		myToy.getCircuit1().setResistance(Double.parseDouble(request.getParameter("resis1")));
		myToy.getCircuit1().setManufactureLocation(request.getParameter("location1"));
		
		myToy.getCircuit2().setVoltage(Double.parseDouble(request.getParameter("volt2")));
		myToy.getCircuit2().setResistance(Double.parseDouble(request.getParameter("resis2")));
		myToy.getCircuit2().setManufactureLocation(request.getParameter("location2"));
		
		myToy.setInspector(request.getParameter("inspectorName"));
		myToy.setInspectionDateTime(new Date());
		String toyID = null;
		toyID = request.getParameter("toyID");
		myToy.setToyID(Integer.parseInt(toyID));
		
		myToy.save();
		
	}
//check if save button was pressed
	//set boolean was save true
	//put all values into object
	//save object


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
  body {
  padding-top: 50px;
  }
  .starter-template {
  padding: 40px 15px;
  text-align: center;
  }
  
  </style>
</head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

      <div class="starter-template">
        <h1>Toy Inspection</h1>
        <div class="row">
        <div class="col-md-2 col-offset-md-5">
        	<form method="post">
        		
				  <div class="form-group">
				 	 <input required type="number" name ="loadID" class="form-control" id="loadID" placeholder="Toy ID">
				    	<button type="submit" name ="btnLoad" class="btn btn-success btn-lg">Load</button>
				  </div>
				
			</form>
			</div>
		</div>
		<% //if load button (btnload !=null) was pressed
		
		if (request.getParameter("btnLoad") != null) {
			Toy myToy = new Toy();
			
			
			String loadID = null;
			loadID = request.getParameter("loadID");
			myToy.load(Integer.parseInt(loadID));
			
		//load the stuff into object (from load id)
		//add seperate message if toy does not exist%>
		
		<input required type="text" name ="loadID" class="form-control" id="loadID" value="<%out.print("starting value"); %>">
		<div class="row">
			<div class="panel panel-default">
	 		 	<div class="panel-heading">Toy ID:<%out.print(myToy.getToyID()); %> Inspector Name:<%out.print(myToy.getInspector()); %></div>
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
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">Are you sure you want to delete this toy?</h4>
					      </div>
					      <div class="modal-body">
					       <div class="form-group">
							 	 <input type="hidden" id="deleteID" value="<%out.print("id here"); %>">
							    	<button type="submit" class="btn btn-danger btn-lg">delete</button>
							  
					        <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
					        </div>
					      </div>
					    </div>
					
					  </div>
	  			
	  			</div>
			</div>
			
			
		</div>
		<% } %>
        <!-- Trigger the modal with a button -->
        <div class="row">
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#createToy">Add Toy</button>
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
				    <input type="text" class="form-control" name="inspectorName" id="inspector" placeholder="Inspector Name">
				  </div>
				  <div class="form-group">
				   <label for="ToyID">Toy ID:</label>
				    <input type="number" class="form-control" name="toyID" id="ToyID" placeholder="Toy ID">
				  </div>
				  	<div class="form-group">
				  	
				  	<div class="col-sm-6">
				  		<label class="control-label">Circuit 1:</label>
				  		<input type="number" class="form-control" name="volt1" id="volt1" step="0.01" min="0.01" placeholder="Voltage">
				  		<input type="number" class="form-control" name="resis1" id="resis1" step="0.01" min="0.01" placeholder="Resistance">
				  		<label class="control-label">Location</label>
				  			<select class="form-control" name="location1" id="location1">
				  			<option value="United States">United States</option>
				  			<option value="Germany">Germany</option>
				  			<option value="China">China</option>
				  			</select>
				  	</div>
				  		  	<div class="col-sm-6">
				  		<label class="control-label">Circuit 2:</label>
				  		<input required type="number" class="form-control" name="volt2" id="volt2" step="0.01" min="0.01" placeholder="Voltage">
				  		<input type="number" class="form-control" name="resis2" id="resis2" step="0.01" min="0.01" placeholder="Resistance">
				  		<label class="control-label">Location</label>
				  			<select class="form-control" id="location2">
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
