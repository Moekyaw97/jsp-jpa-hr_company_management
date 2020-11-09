<jsp:include page="include/header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-fluid">
		
		<div class="mb-5">
			<h4>${not empty category ? 'Edit Company' : 'Add New Company' }</h4>
		</div>
		
		
		<c:url var="save" value="/company-add"></c:url>
		<form action="${save }" method="post" class="form">
		
				<input type="hidden" name="comid" value="${company.id }" />
				<div class="row">
				<div class="col-lg-6">
				
					<div class="form-group">
						<label>Company Name</label> <input type="text" name="company_name"
							value="${company.name }" class="form-control" required="required">
					</div>
				

					<div class="form-group">
						<label>Company Address</label> <input type="text"
							name="company_address" value="${company.address }" class="form-control" required="required">
					</div>

					<div class="form-group">
						<label>Website</label> <input type="text" name="website"
							value="${company.website }" class="form-control" required="required">
					</div>

					<div class="form-group">
						<label>Email</label> <input type="text" name="company_email"
							value="${company.email }" class="form-control" required="required">
					</div>

					<div class="form-group">
						<input type="checkbox" name="ishot" ${company.ishot == "yes" ? 'checked' : '' }> is_hot?
						
						
					</div>

				</div>

				<div class="col-lg-6">

					<div class="form-group">
						<label>Phone 1</label> <input type="text" name="phone_1"
							value="${company.phone1 }" class="form-control">
					</div>

					<div class="form-group">
						<label>Phone 2</label> <input type="text" name="phone_2"
							value="${company.phone2 }" class="form-control">
					</div>

					<div class="form-group">
						<label>Owner Name</label> <input type="text" name="owner_name" value="${company.ownerName }"
							class="form-control">
					</div>


					<div class="form-group">
						<label for="">Township</label> <select name="townid"
							id="" class="form-control" >
							<c:forEach items="${townships }" var="t">
								<option value="${t.id }"
									${company.township.id == t.id ? 'selected':'' }>${t.name }</option>
							</c:forEach>
						</select>
					</div>


					<div class="form-group">
						<label>Remark</label>
						<textarea class="form-control" value="${company.remark }" name="remark"></textarea>
					</div>
				</div>
				</div>
				<div class="text-center">
				<button type="submit" class="btn btn-success">Save</button>
				<button type="reset" class="btn btn-danger">Clear</button>
				</div>

			</form>

		</div>





<jsp:include page="include/footer.jsp"></jsp:include>