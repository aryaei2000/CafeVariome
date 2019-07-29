$(document).ready(function() {
    param = $('#source_id').val();
    reloadTable(param,true);
	refreshId = setInterval(function() {
      reloadTable(param,false);
    }, 5000)
})

function reloadTable(param,first) {
    if ($('.dataTables_filter input').is(":focus")) {
        return;
    }
	$.ajax({
        type: "POST",
        url: baseurl+'source/getSourceStatus/'+param,
        dataType: "json",
        success: function(response) {
            currentscroll = $(window).scrollTop();
        	if (!first) {
        		$('#file_table').DataTable().fnDestroy();
        	}
        	$("#file_grid").empty();
        	for (var i = 0; i < response.Files.length; i++) {
        		$("#file_grid").append(`<tr id="file_${response.Files[i].ID}"><td>${response.Files[i].FileName}</td>
                <td>${response.Files[i].email}</td></tr>`);
                $(`#file_${response.Files[i].ID}`).append(`<td>${response.Files[i].uploadStart}</td>`);
                $(`#file_${response.Files[i].ID}`).append(`<td>${response.Files[i].uploadEnd}</td>`);
                $(`#file_${response.Files[i].ID}`).append(`<td id="file_${response.Files[i].ID}_errors"></td>`);
                count = 0;
                for (var t = 0; t < response.Error.length; t++) {
                	if (response.Files[i].ID == response.Error[t].error_id) {
                		count++;
                		$(`#file_${response.Files[i].ID}_errors`).append(`${response.Error[t].message}<br>`);
                		response.Error.splice(t, 1); 
                	}
                }
                if (count == 0) {
                	$(`#file_${response.Files[i].ID}_errors`).append('No errors');
                }
                $(`#file_${response.Files[i].ID}`).append(`<td>${response.Files[i].Status}</td>`);
        	}   
        	filesDt();  
            $(window).scrollTop(currentscroll);  
        }
    });
}

function filesDt() {
    $('#file_table').dataTable( {
      "sDom": "<'row'<'span5 offset1'l><'span6'f>r>t<'row'<'span5 offset1'i><'span6'p>>",
      "sPaginationType": "bootstrap",
      "oLanguage": {
        "sLengthMenu": "_MENU_ records per page"
      }, 
      "aLengthMenu": [[5, 10, 25, 50, 100, 200, -1], [5, 10, 25, 50, 100, 200, "All"]]
    } );
}
