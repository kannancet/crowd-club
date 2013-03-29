//JS for silde show.
$(document).ready(function() {
	$('#games').coinslider({ hoverPause: false });
});

//JS for flash render.
$(document).ready(function() {
    $('#flash').reveal();
});

	
 $(document).ready(function() { $("#e1").select2(
 	{
    placeholder: "Select a City",
    allowClear: true
}
 ); });
$(document).ready(function() { $("#e2").select2(
	{
    placeholder: "Select a State",
    allowClear: true
}
); });
$(document).ready(function() { $("#e3").select2(
	{
    placeholder: "Select a Country",
    allowClear: true
}
); });