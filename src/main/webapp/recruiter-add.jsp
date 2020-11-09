<jsp:include page="include/header.jsp"></jsp:include>

<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">Add Recruiter</h1>

	<div class="row">
		<div class="col-md-8">
			<form method="POST" action="#" enctype="multipart/form-data">
			
					<div class="form-group">
						<label>Name</label> <input type="text" name="name"
							class="form-control">
					</div>

					<div class="form-group">
						<label>Email</label> <input type="email"
							name="email" class="form-control">
					</div>

					<div class="form-group">
						<label>Password</label> <input type="password" name="pass"
							class="form-control">
					</div>
					
					<div class="form-group">
						<label>Confirm Password</label> <input type="password" name="confirm_pass"
							class="form-control">
					</div>
					
					<div class="form-group">
						<label>Phone</label> <input type="text" name="phone"
							class="form-control">
					</div>

				
				<input type="submit" name=""
					class="btn btn-outline-primary float-right mb-3" value="Save">


			</form>

		</div>
	</div>

</div>



<jsp:include page="include/footer.jsp"></jsp:include>