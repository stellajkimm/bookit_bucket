$(document).ready(function(){

	// $.each($('.panel-group').children(), function() {
	// 	console.log($(this).find('.collapse').hasClass('.in'))
	// })

	$.each($('.container .bucket'), function() {
		bucketHover($(this))
		$(this).find('.bucket-links').hide()
	})
})


function bucketHover(el) {
	var color = $(el).css('background-color')
	$(el).hover(function() {
  		$(this).css('background-color', color.replace(')','').replace('rgb', 'rgba') + ", .3)")
  		$(this).find('.bucket-content').css('opacity', '.50')
  		$(this).find('.bucket-links').show() },
  		function() {
  		$(this).css('background-color', color)
  		$(this).find('.bucket-content').css('opacity', '1')
  		$(this).find('.bucket-links').hide() })
}

// var Collapse2 = function (element) {
// 	this.$element = $(element)
// }

// Collapse2.prototype.show = function () { }
// Collapse2.prototype.hide = function () { }
// Collapse2.prototype.toggle = function () { 
// 	this[this.$element.hasClass('in') ? 'hide' : 'show']()
// }
