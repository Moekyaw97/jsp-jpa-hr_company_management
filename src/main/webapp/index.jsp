<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<jsp:include page="resource/common.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<div class="row mt-5">
			<div class="col-8 offset-2">
				<div class="card">
					<div class="card-header py-4 text-center">
						<h4 class="m-0">Welcome From MMIT</h4>
					</div>
					<div class="card-body">
						<c:if test="${not empty message }">
							<div class="alert alert-danger text-center col-6 offset-2">${message}</div>
						</c:if>
						<c:url var="action" value="/login"></c:url>
						<form action="${action }" class="form   col-6  offset-2" method="post">
							<div class="form-group">
								<label for="">Email</label> <input type="email" name="user_email"
									placeholder="Enter email" class="form-control" />
							</div>
							<div class="form-group">
								<label for="">Password</label> <input type="password"
									name="user_password" placeholder="Enter Password"
									class="form-control" />
							</div>
							<button type="submit" class="btn btn-primary">Login</button>
							<button type="reset" class="btn btn-danger">Clear</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>