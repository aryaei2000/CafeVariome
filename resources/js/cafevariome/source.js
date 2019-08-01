$(document).ready(function() {
    if ($('#sourcestable').length) {
        $('#sourcestable').DataTable();
    }
} );
function select_groups() {
    $(".groupsSelected").find('option').each(function () {
        $(this).attr('selected', 'selected');
    });
}

$('#addVariantsModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); 
    var sourceName = button.data('name'); 
    var sourceDesc = button.data('description'); 
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
    var modal = $(this);
    modal.find('.modal-title').text('Add Records To ' + sourceDesc);
    modal.find('#bulkImport').attr('href', baseurl + "variants/import/" + sourceName);
    modal.find('#phenoPacketsImport').attr('href', baseurl + "UploadData/json/" + sourceName);
  })

