$(document).ready(function(){

	// $.each($('.panel-group').children(), function() {
	// 	console.log($(this).find('.collapse').hasClass('.in'))
	// })

	$.each($('.container .bucket'), function() {
		bucketHover($(this))
		$(this).find('.bucket_links').hide()
	})
})


function bucketHover(el) {
	$(el).hover(function() {
  		$(this).css('opacity', '.50')
  		$(this).find('.bucket_links').show() },
  		function() {
  		$(this).css('opacity', '1')
  		$(this).find('.bucket_links').hide() })
}

// var Collapse2 = function (element) {
// 	this.$element = $(element)
// }

// Collapse2.prototype.show = function () { }
// Collapse2.prototype.hide = function () { }
// Collapse2.prototype.toggle = function () { 
// 	this[this.$element.hasClass('in') ? 'hide' : 'show']()
// }
