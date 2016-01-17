<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="row">
	<div class="col-sm-12">
		<h1>Student</h1>
		<hr/>
	</div>
</div>

<div class="row">
	<div class="col-sm-12">
		<button class="btn btn-primary open-modal-create" data-target="#modal-create" data-toggle="modal">
			<i class="fa fa-plus"></i>&nbsp;Create
		</button>
	</div>
</div>

<div class="row" style="margin-top: 10px;">
	<div class="col-sm-12">
		<table class="table table-bordered table-responsive">
			<thead>
				<tr>
					<th class="text-center">ID</th>
					<th class="text-center">First Name</th>
					<th class="text-center">Last Name</th>
					<th colspan="2"  class="text-center">Action</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="students" var="e">
					<tr>
						<td class="text-center table-id"><s:property value="id"/></td>
						<td class="table-firstName"><s:property value="firstName"/></td>
						<td class="table-lastName"><s:property value="lastName"/></td>
						<td class="text-center">
							<button class="btn btn-warning open-modal-update" data-target="#modal-create" data-toggle="modal">
								<i class="fa fa-edit"></i>&nbsp;Update
							</button>
						</td>
						<td class="text-center open-modal-delete">
							<button class="btn btn-danger open-modal-delete" data-target="#modal-delete" data-toggle="modal">
								<i class="fa fa-trash"></i>&nbsp;Delete
							</button>
						</td>
					<tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</div>

<!-- create or update modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="modal-create">
	<div class="modal-dialog">
		<s:form action="save">
			<div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h3 class="modal-title" id="modal-create-title"><i class="fa fa-plus"></i>&nbsp;Create</h3>
	      </div>
	      <div class="modal-body">
	      	<s:textfield cssClass="form-control" name="student.id" type="hidden" id="student-id"/>
	      	<div class="form-group">
				    <label for="firstName">First Name</label>
				    <s:textfield cssClass="form-control" name="student.firstName" placeholder="First Name" id="student-firstName"/>
				  </div>
				  <div class="form-group">
				    <label for="lastName">Last Name</label>
				    <s:textfield cssClass="form-control" name="student.lastName" placeholder="Last Name" id="student-lastName"/>
				  </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-success" id="btn-create"><i class="fa fa-plus"></i>&nbsp;Create</button>
	      </div>
	    </div>
    </s:form>
  </div>
</div>

<!-- delete modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="modal-delete">
	<div class="modal-dialog">
		<s:form action="delete">
			<div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h3 class="modal-title"><i class="fa fa-trash"></i>&nbsp;Delete</h3>
	      </div>
	      <div class="modal-body">
	      	<h4>Are you sure to delete?</h4>
	      	<p>
	      		<b>First Name</b> : <span id="delete-firstName"></span>
	      		<br/>
	      		<b>Last Name</b> : <span id="delete-lastName"></span>
	      	</p>
	      	<s:textfield cssClass="form-control" name="student.id" type="hidden" id="delete-id" />
	      	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-danger" id="btn-delete"><i class="fa fa-trash"></i>&nbsp;Delete</button>
	      </div>
	    </div>
    </s:form>
  </div>
</div>

<script type="text/javascript" src="./assets/js/student.js"></script>
