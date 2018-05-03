<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>4C Knowledge</title>
<link rel="stylesheet" type="text/css" href="style.css">
<%@ page import="java.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.Dbconnect" %>
</head>
<body>
	<div id="navbar">	
	</div>
		<div class="container">		
			<ul class="navigationBar">
				<div id="logoArea">
					<li class="logo"><a href="index.jsp" style="font-family:logo;font-size:33px;">4CKnowledge</a></li>
					
				</div>
				<div id="navArea">
					<li class="nav"><a class="active" href="index.jsp">Home</a></li>
						<%
						response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
						String firstName = (String)session.getAttribute("firstName");
						String role = (String)session.getAttribute("role");
						String email= (String)session.getAttribute("email");
						if(firstName==null||firstName==""){
							%><li class="nav"><a href="register.jsp">Login/Register</a></li><%
						}else if(role.equals("Admin")){
							%><li class="nav"><a href="adminPanel.jsp"><%=firstName%></a></li><%
						}else {
							%><li class="nav"><a href="searchMember?to=userProfile&email=<%= email%>"><%=firstName%></a></li><%
						}%>
					<li class="nav"><a href="viewBooks.jsp">Books</a></li>
					<li class="nav"><a href="aboutUs.jsp">About Us</a></li>
					<li class="nav"><a href="contactUs.jsp">Contact Us</a></li>	
				</div>
			</ul>
		
			
			<br><br><br>
			<!--Header must be 1890x456 -->
			<img class="header" src="header/header.jpg" alt="Norway" width="1000" height="300">
		
			<br>
		
			<div id="sidebar">
				<h3 style="color:white;margin:5px;text-align:center;">Find the book You looking for.</h3>
				
				<%String msg = (String)request.getAttribute("msg"); 
			  	if(msg != null && !msg.isEmpty()){
		  			if(msg.equals("noBookFound"))
						out.println("<p style=\"color:orange;margin:5px;text-align:center;\"><b>Sorry unable to find the book You looking for.</b></p>");
						else if(msg.equals("dbError"))
							out.println("<p style=\"color:orange;margin:5px;text-align:center;\"><b>Sorry unable to connect to Database.</b></p>");
		 		}%>
				
				<form name="form5" method="post" action="findBook">
				<table id="form">
					<tr>
						<td><select class="search" name="category"><option>Science</option>
                                        <option>Education</option>
                                        <option>IT</option>
                                        <option>Science fiction</option>
                                       	<option>Drama</option>
                                       	<option>Romance</option>
                                       	<option>Mystery</option>
                                       	<option>Horror</option>          	
                            </select></td>
					</tr>
					<tr>
						<td><select class="search" name="language">
								<option value="English">English</option>
  								<option value="Albanian">Albanian</option>
  								<option value="Arabic">Arabic</option>
  								<option value="Armenian">Armenian</option>
 								<option value="Bengali">Bengali</option>
  								<option value="Bulgarian">Bulgarian</option>
								<option value="Catalan">Catalan</option>
  								<option value="Cambodian">Cambodian</option>
 								<option value="Chinese (Mandarin)">Chinese (Mandarin)</option>
  								<option value="Croation">Croation</option>
 								<option value="Czech">Czech</option>
  								<option value="Danish">Danish</option>
  								<option value="Dutch">Dutch</option>
  								<option value="English">English</option>
 								<option value="Estonian">Estonian</option>
  								<option value="Fiji">Fiji</option>
  								<option value="Finnish">Finnish</option>
 								<option value="Georgian">Georgian</option>
  								<option value="German">German</option>
  								<option value="Greek">Greek</option>
 								<option value="Gujarati">Gujarati</option>
 								<option value="Hindi">Hindi</option>
  								<option value="Hungarian">Hungarian</option>
 								<option value="Icelandic">Icelandic</option>
  								<option value="Indonesian">Indonesian</option>
  								<option value="Irish">Irish</option>
  								<option value="Italian">Italian</option>
 								<option value="Japanese">Japanese</option>
 								<option value="Korean">Korean</option>
  								<option value="Latin">Latin</option>
 								<option value="Latvian">Latvian</option>
 								<option value="Lithuanian">Lithuanian</option>
  								<option value="Malay">Malay</option>
  								<option value="Malayalam">Malayalam</option>
  								<option value="Mongolian">Mongolian</option>
 								<option value="Nepali">Nepali</option>
  								<option value="Norwegian">Norwegian</option>
 								<option value="Persian">Persian</option>
  								<option value="Polish">Polish</option>
  								<option value="Portuguese">Portuguese</option>
  								<option value="Punjabi">Punjabi</option>
 								<option value="Romanian">Romanian</option>
  								<option value="Russian">Russian</option>
 								<option value="Samoan">Samoan</option>
  								<option value="Serbian">Serbian</option>
  								<option value="Sinhala">Sinhala</option>
  								<option value="Slovenian">Slovenian</option>
 								<option value="Spanish">Spanish</option>
  								<option value="Swahili">Swahili</option>
 								<option value="Swedish ">Swedish </option>
  								<option value="Tamil">Tamil</option>
  								<option value="Telugu">Telugu</option>
  								<option value="Thai">Thai</option>
  								<option value="Tibetan">Tibetan</option>
  								<option value="Turkish">Turkish</option>
  								<option value="Ukranian">Ukranian</option>
  								<option value="Urdu">Urdu</option>
  								<option value="Uzbek">Uzbek</option>
  								<option value="Vietnamese">Vietnamese</option>
							</select></td>
						</tr>
						<tr>
							<td><select class="search" name="country">
								<option value="United States">United States</option> 
								<option value="United Kingdom">United Kingdom</option> 
								<option value="Antarctica">Antarctica</option> 
								<option value="Argentina">Argentina</option> 
								<option value="Armenia">Armenia</option> 
								<option value="Australia">Australia</option> 
								<option value="Austria">Austria</option> 
								<option value="Bangladesh">Bangladesh</option> 
								<option value="Belgium">Belgium</option> 
								<option value="Bhutan">Bhutan</option> 
								<option value="Brazil">Brazil</option> 
								<option value="Canada">Canada</option> 
								<option value="Central African Republic">Central African Republic</option> 
								<option value="Chile">Chile</option> 
								<option value="China">China</option> 
								<option value="Colombia">Colombia</option> 
								<option value="Costa Rica">Costa Rica</option> 
								<option value="Croatia">Croatia</option> 
								<option value="Cuba">Cuba</option> 
								<option value="Cyprus">Cyprus</option> 
								<option value="Czech Republic">Czech Republic</option> 
								<option value="Denmark">Denmark</option> 
								<option value="Egypt">Egypt</option> 
								<option value="El Salvador">El Salvador</option> 
								<option value="Fiji">Fiji</option> 
								<option value="Finland">Finland</option> 
								<option value="France">France</option> 
								<option value="Georgia">Georgia</option> 
								<option value="Germany">Germany</option> 
								<option value="Ghana">Ghana</option> 
								<option value="Greece">Greece</option> 
								<option value="Greenland">Greenland</option> 
								<option value="Guinea">Guinea</option> 
								<option value="Haiti">Haiti</option> 
								<option value="Hong Kong">Hong Kong</option> 
								<option value="India">India</option> 
								<option value="Indonesia">Indonesia</option> 
								<option value="Iraq">Iraq</option> 
								<option value="Ireland">Ireland</option> 
								<option value="Italy">Italy</option> 
								<option value="Jamaica">Jamaica</option> 
								<option value="Japan">Japan</option> 
								<option value="Jordan">Jordan</option> 
								<option value="Kazakhstan">Kazakhstan</option> 
								<option value="Kenya">Kenya</option> 
								<option value="Kuwait">Kuwait</option> 
								<option value="Malaysia">Malaysia</option> 
								<option value="Maldives">Maldives</option> 
								<option value="Mali">Mali</option> 
								<option value="Malta">Malta</option> 
								<option value="Mexico">Mexico</option> 
								<option value="Monaco">Monaco</option> 
								<option value="Mongolia">Mongolia</option> 
								<option value="Myanmar">Myanmar</option> 
								<option value="Nepal">Nepal</option> 
								<option value="Netherlands">Netherlands</option> 
								<option value="New Zealand">New Zealand</option> 
								<option value="Nigeria">Nigeria</option> 
								<option value="Norway">Norway</option> 
								<option value="Oman">Oman</option> 
								<option value="Pakistan">Pakistan</option> 
								<option value="Papua New Guinea">Papua New Guinea</option> 
								<option value="Paraguay">Paraguay</option> 
								<option value="Peru">Peru</option> 
								<option value="Philippines">Philippines</option> 
								<option value="Poland">Poland</option> 
								<option value="Portugal">Portugal</option> 
								<option value="Qatar">Qatar</option> 
								<option value="Russian Federation">Russian Federation</option> 
								<option value="Sierra Leone">Sierra Leone</option> 
								<option value="Singapore">Singapore</option> 
								<option value="South Africa">South Africa</option> 	<option value="Spain">Spain</option> 
								<option value="Sri Lanka">Sri Lanka</option> 
								<option value="Swaziland">Swaziland</option> 
								<option value="Sweden">Sweden</option> 
								<option value="Switzerland">Switzerland</option> 
								<option value="Thailand">Thailand</option> 
								<option value="Timor-leste">Timor-leste</option> 
								<option value="Ukraine">Ukraine</option> 
								<option value="United Arab Emirates">United Arab Emirates</option> 
								<option value="United Kingdom">United Kingdom</option> 
								<option value="United States">United States</option> 
								<option value="Viet Nam">Viet Nam</option> 
								<option value="Zimbabwe">Zimbabwe</option>
						</select></td>
						</tr>
						<tr>
							<td>
								<select class="search" name="year" id="year"></select>
							</td>
						</tr>
						<script type="text/javascript">
							var start = 1900;
							var end = new Date().getFullYear();
							var options = "";
							for(var year = end ; year >=start; year--){
								  options += "<option>"+ year +"</option>";
							}
							document.getElementById("year").innerHTML = options;
						</script>
					<tr>
						<td>
							<input type="submit" id="findbtn" value="Find Book">
						</td>
					</tr>
				</table>
				</form>
				<img src="gif/gif1.gif" width="360px" style="text-align:center;">
			</div>
			<br>
				<div id="main">
					<div id="top">	
						<h2 class="topic" style="margin-left:100px;">Welcome to</h2>
						<h2 class="topic" id="logoh1"> 4CKnowledge</h2>
						<h4 style="text-align:center;">The  cosiest book club in the internet</h4>
						<br>
					</div>
					<br><br><br>
					<div id="col1">
					<ul id>
						<li>Enjoy our high quality service.</li>
						<li>Feel the difference.</li>
						<li>Explore the world of books.</li>
					</ul>
					<br>
					<p>Our mission is to provide users with the most comfortable and 
						memorable experience. <br><br>User satisfaction is our 
						#1 priority and that is why we strive to build long term 
						relationships with our community. <br><br>We are not a book store,
						 and we do not sell books. We are a free online community for 
						 readers with all sorts of awesome free features and free tools 
						 for book lovers. In terms of going to book stores like Amazon to 
						 get books.</p>
					
					</div>
					
					<div id="col2">
					<img src="gif/gifs.gif" height="168px">
					<img src="gif/gif3.gif" width="298.92px">
					</div>
					
				</div>
			<%
			Connection con = Dbconnect.connect();
			PreparedStatement st = null;
			ResultSet rs = null;
			
			int[] arr = new int[6];
			int i=0;
			try {
				String sql = "select * from featuredBooks";
				st = con.prepareStatement(sql);
				rs=st.executeQuery();
				System.out.println("Sql executed succesfully!");
		
				while(rs.next()){ 
					arr[i]=Integer.parseInt(rs.getString("bookId"));
					System.out.println("assingning value "+arr[i]+" to arr["+i+"].");
					i++;
				}
			}catch(Exception e){
		    		e.printStackTrace();
			}
			%>
			<div id="type">
				<table style="background-color:#078898;width:1020px;height:auto;">
					<tr>
						<td class="cartypes"><a href="searchBook.jsp?bookId=<%=arr[0]%>"><img src="featuredBooks/aiBook.jpg"><br><b></b></a></td>
						<td class="cartypes"><a href="searchBook.jsp?bookId=<%=arr[1]%>"><img src="featuredBooks/imagePrBook.jpg"><br><b></b></a></td>
						<td class="cartypes"><a href="searchBook.jsp?bookId=<%=arr[2]%>"><img src="featuredBooks/middlewareBook.jpg"><br><b></b></a></td>
						<td class="cartypes"><a href="searchBook.jsp?bookId=<%=arr[3]%>"><img src="featuredBooks/nothernLightsBook.jpg"><br><b></b></a></td>
						<td class="cartypes"><a href="searchBook.jsp?bookId=<%=arr[4]%>"><img src="featuredBooks/robotsBook.jpg"><br><b></b></a></td>
						<td class="cartypes"><a href="searchBook.jsp?bookId=<%=arr[5]%>"><img src="featuredBooks/aBreifHistoryBook.jpg"><br><b></b></a></td>
					</tr>
				</table>
			</div>
			<div id="main2">
				<br>
				<p style="margin:20px;">You’re in the right place. Tell us what titles or genres you’ve enjoyed in the
					 past, and we’ll give you surprisingly insightful recommendations. Proudly servicing
					 around the globe with unbeatable user experience. 
					Our honesty, professionalism, and dedication to our users is the key to our success, which is 
					why going the extra mile is the standard at 4CKnowledge.</p>
				<br>
			</div>
	</div>
	
	<div id="footer">
		<div class="container">
			<br><br>
			<p class="foot" style="margin-left:350px;">Copyright  © </p><p class="foot" style="font-family:'logo';"> 4CKnowledge</p><p class="foot"> , 2018 - All Right Reserved.</p>
		</div>
	</div>


</body>
</html>