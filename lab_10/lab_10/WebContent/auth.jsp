<%
	//handles pages that need user verification to login into

	//verifies if the user is logged
	boolean authenticated = session.getAttribute("authenticatedUser") == null ? false : true;

	//if the user was not logged redirect him to the login page
	if (!authenticated)
	{
		String loginMessage = "You have not been authorized to access the URL "+request.getRequestURL().toString();
        session.setAttribute("loginMessage",loginMessage);        
		response.sendRedirect("login.jsp");
	}
%>
