$(document).ready(function(){

	// $.each($('.panel-group').children(), function() {
	// 	console.log($(this).find('.collapse').hasClass('.in'))
	// })

	$.each($('.container .bucket'), function() {
		bucketHover($(this))
	})
})


function bucketHover(el) {
	$(el).hover(function() {
  		$(this).css('opacity', '.50') },
  		function() {
  		$(this).css('opacity', '1') })
}

// var Collapse2 = function (element) {
// 	this.$element = $(element)
// }

// Collapse2.prototype.show = function () { }
// Collapse2.prototype.hide = function () { }
// Collapse2.prototype.toggle = function () { 
// 	this[this.$element.hasClass('in') ? 'hide' : 'show']()
// }
