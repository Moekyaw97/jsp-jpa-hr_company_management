<title>Company</title>
<jsp:include page="include/header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Company List</h1>
		<c:url var="add" value="/company-add"></c:url>
		<a href="${add }"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			<i class="fas fa-plus"></i> Add Company
		</a>
	</div>
	<div class="card shadow mb-4">

		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead class="text-center">
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Phone 1</th>
							<th>Phone 2</th>
							<th>Email</th>
							<th>Township</th>
							<th>Action</th>
						</tr>
					</thead>
					<tfoot>
					</tfoot>
					<tbody>

						<c:forEach items="${companies}" var="c">
							<tr>
								<td>${c.id }</td>
								<td>${c.name }</td>
								<td>${c.phone1 }</td>
								<td>${c.phone2 }</td>
								<td>${c.email }</td>
								<td>${c.township.name }</td>
								<td class="text-center px-auto"><c:url var="detail" value="/company-detail">
										<c:param name="comid">${c.id }</c:param>
									</c:url><a href="${detail }" class="btn btn-info">Detail</a>
								<c:url var="edit" value="/company-edit">
										<c:param name="comid">${c.id }</c:param>
									</c:url> <a href="${edit }" class="btn btn-warning">Edit</a>
								<c:url var="delete" value="/company-delete">
										<c:param name="comid">${c.id }</c:param>
									</c:url> <a href="${delete }" class="btn btn-danger">Delete</a>
								</td>
							</tr>
						</c:forEach>


					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<jsp:include page="include/footer.jsp"></jsp:include>
