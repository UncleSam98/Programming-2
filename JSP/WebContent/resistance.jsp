<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="CircuitModel.Circuit"%>
<!DOCTYPE html>
   <html lang="en">
      <head>
            <title>Ohms Law Calculator</title> <!--Shows up on tab in browswer-->
            <meta charset="utf-8">
			<link rel="shortcut icon" href="/JSP/images/favicon.png" type="image/x-icon">
            <!--This is the external stylesheet-->
            <link rel="stylesheet" href="/JSP/javajam.css">
      </head>
         
      <body><!--Main content of webpage-->
         <div id="wrapper">
         <header>
		 <img src="/JSP/images/lightning.gif" height="150" width="200" style="float:left">
         <h1>Ohm's Law Calculator</h1>
         </header>
        
         <nav><!--This is the menu navigation-->
            <a href="index.jsp">Voltage</a>&nbsp;
            <a href="amperage.jsp">Amperage</a>&nbsp;
            <a href="resistance.jsp">Resistance</a>&nbsp;
         </nav>
         
         <main> <!--This is the main title diplayed on home page-->
            <img src="/JSP/images/ohmsLawPyramid.jpg" height="300" width="400" alt="Omh's law Pyramid" align="right">
            <h2>Calculate Resistance</h2>
            
            <p>Enter the two known values and the third will be calculated</p>
            
            <h3>Ohm's Law basics:</h3>
            
            <ul><!--List of basic ohms law-->
               <li>Voltage = Amperage * Resistance</li>
               <li>Resistance = Voltage / Amperage</li>
               <li>Amperage = Voltage / Resistance </li>
            </ul>
            
            <form method="post">
           <%
           Circuit myCircuit = new Circuit();
           %>
               <input type="number" name="txtVoltage" placeholder="Enter Voltage" step="0.01" min="0.01" required>
               <br>
               <input type="number" name="txtAmperage" placeholder="Enter Amperage" step="0.01" min="0.01" required>
               <br>
			   <br>
               <input type="submit" name="cmdCalculate" value="Calculate"
               <% if (request.getParameter("cmdCalculate") !=null ) {
            	   /* Circuit myCircuit = new Circuit(); */
            	   String txtVoltage = request.getParameter("txtVoltage");
            	    String txtAmperage = request.getParameter("txtAmperage");
            		  myCircuit.setVoltage(Double.parseDouble(txtVoltage.toString()));
            		  myCircuit.setAmperage(Double.parseDouble(txtAmperage.toString()));
            		  myCircuit.calculateResistance();
               }
               %>
               
               >
            </form>
			<br>
			<table>
				<tr>
					<td>
					Resistance:
					</td>
					<td> 
					<%
					out.println(myCircuit.getResistance());
					%>
					</td>
				</tr>
			</table>
			<A href="muscats.html" target="_blank" style="float:right">Background music and cats!</A>
         </main>
        
         <br/>
         <footer><!--Copyright Information-->
            Copyright &copy; 2017 Hofmann Ohms <br/>
            <a href="mailto:brianehofmann@student.cofo.edu">Brian@Hofmann.com </a>
         </footer>
         </div>
      </body>
         
   </html>