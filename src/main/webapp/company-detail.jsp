<title>Company</title>
<jsp:include page="include/header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Company Detail</h1>
		<c:url var="back" value="/companies"></c:url>
		<a href="${back }"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			<i class="fas fa-arrow-left"></i> Back
		</a>
	</div>



	<div class="row">
		<div class="col-lg-6">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fas fa-user"></i> Company Profile
					</h6>
				</div>
				<div class="card-body">

					<table class="table table-borderless">

						<tbody>
							<tr>
								<th scope="row">Name</th>
								<td>${company.entryBy.name }</td>

							</tr>
							<tr>
								<th scope="row">Phone1:</th>
								<td>${company.phone1 }</td>
							</tr>
							<tr>
								<th scope="row">Phone2:</th>
								<td>${company.phone2 }</td>

							</tr>
							<tr>
								<th scope="row">Email:</th>
								<td>${company.email }</td>

							</tr>
							<tr>
								<th scope="row">Website:</th>
								<td>${company.website }</td>
							</tr>
							<tr>
								<th scope="row">Township:</th>
								<td>${company.township.name }</td>

							</tr>
							<tr>
								<th scope="row">Owner Name:</th>
								<td>${company.ownerName }</td>

							</tr>
							<tr>
								<th scope="row">Address:</th>
								<td>${company.address }</td>

							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="col-lg-6">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">
						<i class="fas fa-info-circle"></i> Other Information
					</h6>
				</div>
				<div class="card-body">

					<table class="table table-borderless">

						<tbody>
							<tr>
								<th scope="row">Entry By:</th>
								<td>${company.entryBy.name }</td>
							</tr>
							<tr>
								<th scope="row">Entry Date:</th>
								<td>${company.entry_date }</td>
							</tr>
							<tr>
								<th scope="row">Modify By:</th>
								<td>${company.modifyBy.name }</td>
							</tr>
							<tr>
								<th scope="row">Modify Date:</th>
								<td>${company.modifyDate }</td>
							</tr>
							<tr>
								<th scope="row">Misc.Notes:</th>
								<td>${company.remark }</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>

	</div>
	<div class="text-center">
		<input type="checkbox" 
			value="${company.ishot}" ${company.ishot  == "yes" ? 'checked':''}>
			
		is_hot?
	</div>

</div>

<jsp:include page="include/footer.jsp"></jsp:include>
