<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ask a Question</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/light.min.css">
</head>
<body>
	<button onclick="window.location.href='account.jsp';">Return to Accounts Page</button>
	<div class="frontend">
		<h2>Ask a question:</h2>
		<form action="questionsHandler.jsp" method="post">
			<textarea style="font-size: 16pt" rows="1" cols="60" maxlength="250"
				name="question" placeholder = 'ask a question here'></textarea>
			<br> <input type="submit" value="submit">
		</form>
	</div>
	<h2>
		<a href="questions.jsp">view quesitons</a><br>
		<a href="questionSearcher.jsp">search questions</a>
	</h2>
</body>
</html>