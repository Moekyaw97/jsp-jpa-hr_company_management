<title>Recruiter</title>
<jsp:include page="include/header.jsp"></jsp:include>

   <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Recruiter List</h1>
            <a href="recruiter-add.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class="fas fa-plus"></i> Add Recruiter</a>
          </div>
           <div class="card shadow mb-4">
           
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead class="text-center">
                   <tr>
                  	  <th>Id</th>
                      <th>Email</th>
                      <th>Name</th>
                      <th>Phone</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tfoot>
                  </tfoot>
                  <tbody>
                  
                  			<tr>	
                  				<td></td>
                  				<td></td>
                  				<td></td>
                  				<td></td>
                  				
                  				
                  				<td class="text-center"><a href="#" class="btn btn-primary btn-sm">
                  				Detail</a>
                  				<a href="#" class="btn btn-warning btn-sm ml-3">
                  				Edit</a>
                  				<a href="#" class="btn btn-danger btn-sm ml-3" onclick="return confirm('Are you sure Delete?')">
                  				Delete</a></td>
                  			</tr>
						
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
      </div>

<jsp:include page="include/footer.jsp"></jsp:include>
