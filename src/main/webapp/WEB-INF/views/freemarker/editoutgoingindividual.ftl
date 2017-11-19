<script type="text/javascript" src="${rc.contextPath}/js/leave.js"></script>
<script>
$(document).ready(function() {
	$('#date').datepicker({ dateFormat: 'dd-mm-yy' });
	$('#ftime').timepicker({ 'minTime': '9:00am','maxTime': '6:00pm' });
    $('#ttime').timepicker({ 'minTime': '9:00am','maxTime': '6:00pm' });
	
	var text_max = 2000;
    $('#textarea_feedback').html(text_max + ' characters remaining');

    $('#reason').keyup(function() {
        var text_length = $('#reason').val().length;
        var text_remaining = text_max - text_length;

        $('#textarea_feedback').html(text_remaining + ' characters remaining');
    });
});
</script>
<h3><center>Edit Office Outgoing Request</center></h3>
<form name="editoutgoingInfo" id="editoutgoingInfo" action="${rc.contextPath}/updateOutgoingIndividual" method="post">
	<div class="col-xs-12">
		<div class="col-xs-12">
	    	<table class="table table-bordered table-responsive">
	    		
	    		<tr>
	    			<td class="name">
	    				Employee Name
	    			</td>
	    			<td>
	                    ${curEmp.employee_name}(${curEmp.avator})
	                    <input type="hidden" id="outgoing_id" name="outgoing_id" value="${outgoing.id!''}"/>
	    				<input type="hidden" id="emp_id" name="emp_id" value="${curEmp.emp_id!''}"/>
	    			</td>
	    			<td class="name"></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<td class="name">Employee Number</td>
	    			<td>
	    				<input type="hidden" id="emp_number" name="emp_number" value="${emp.emp_number!''}"/>${emp.emp_number!''}
	    			</td>
	    			<td class="name">Date</td>
	    			<td>
	    				<input type="text" id="date" name="date" class="form-control" value="${outgoing.date?string["dd-MM-yyyy"]}">
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="name">Outgoing From Time*</td>
	                <td><input type="text" id="ftime" name="ftime" class="form-control" value="${outgoing.ftime!''}"></td>
	                <td class="name">Outgoing To Time*</td>
	                <td><input type="text" id="ttime" name="ttime" class="form-control" value="${outgoing.ttime!''}"></td>
	    		</tr>
	        	<tr>
	        		<td class="name">Reason *</td>
	                <td colspan="3">
	                	<textarea rows="4" cols="50" id="reason" name="reason" class="form-control" maxlength="2000">${outgoing.reason!''}</textarea>
	                	<div id="textarea_feedback"></div>
	                </td>
	    		</tr>
	    		<tr>
	    			<td colspan="2">
			    		<div id="approverList">
				    		<input type="hidden" id="appsize" name="appsize" value="${approver?size}"/>
				    		<#if (approver?size > 0)>
				    		<table class="table table-responsive">
					    		<#list 1..approver?size as i>
						    		<tr id="app${i}">
						                <td class="name">
						                	<#if i==1>
						                		First Approvar *
						                	<#elseif i==2>
						                		Second Approvar
						                	<#elseif i==3>
						                		Thierd Approvar
						                	<#elseif i==4>
						                		Fourth Approvar
						                	<#else>
						                		Fifth Approvar
						                	</#if>
						                </td>
						                <td>
						                	<select name="approvar${i}" id="approvar${i}" class="form-control SlectBox" onchange="checkDuplicate(${i},${approver?size});">
						                    	<option value="">
						                    		<#if i==1>
								                		Select First Approvar
								                	<#elseif i==2>
								                		Select Second Approvar
								                	<#elseif i==3>
								                		Select Thierd Approvar
								                	<#elseif i==4>
								                		Select Fourth Approvar
								                	<#else>
								                		Select Fifth Approvar
								                	</#if>
						                    	</option>
						                    	<#list approver as apr>
						                			<#list allEmp as appemp>
						                				<#if apr.approver_id==appemp.emp_id>
						                					<#if i==1>
						                						<option value="${appemp.emp_id}" <#if outgoing.approvar1==appemp.emp_id>selected</#if>>${appemp.employee_name}(${appemp.avator})</option>
						                					<#elseif i==2>
						                						<option value="${appemp.emp_id}" <#if outgoing.approvar2==appemp.emp_id>selected</#if>>${appemp.employee_name}(${appemp.avator})</option>
						                					<#elseif i==3>
						                						<option value="${appemp.emp_id}" <#if outgoing.approvar3==appemp.emp_id>selected</#if>>${appemp.employee_name}(${appemp.avator})</option>
						                					<#elseif i==4>
						                						<option value="${appemp.emp_id}" <#if outgoing.approvar4==appemp.emp_id>selected</#if>>${appemp.employee_name}(${appemp.avator})</option>
						                					<#else>
						                						<option value="${appemp.emp_id}" <#if outgoing.approvar5==appemp.emp_id>selected</#if>>${appemp.employee_name}(${appemp.avator})</option>
						                					</#if>
						                					<#break>
						                				</#if>
						                			</#list>
						                		</#list>          
						                    </select>
						                    <!--<input type="hidden" id="approverSize" name="approverSize" value="approver?size"/>-->
						                </td>
						            </tr>
						        </#list>
					        </table>
					        </#if>
			            </div>
			    	</td>
	            </tr>
	        </table>
		</div>
	</div>
</form>
<div class="col-xs-12">
  	<table class="table table-responsive">
		<tr>
        	<td>
        		<div id="lazy" style="display:none"><img src="${rc.contextPath}/css/common/images/lazyload.gif" alt="loading" height="35" width="35">  Please Wait</div>
        		<button id="btnedit" type="button" title="Edit Office Outgoing request" class="btn btn-primary" onclick="UpdateOutgoingIndivitual('${rc.contextPath}')">Edit</button>
        		<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.history.back();">Back</button>
        	</td>
        </tr>
	</table>
</div>