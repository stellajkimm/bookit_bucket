$(document).ready(function(){

	// $.each($('.panel-group').children(), function() {
	// 	console.log($(this).find('.collapse').hasClass('.in'))
	// })

	$.each($('.container .bucket'), function() {
		bucketHover($(this))
		$(this).find('.bucket-links').hide()
		$(this).find('.bucket-owners').hide()
	})

	$.each($('.panel.panel-default'), function() {
		itemClick($(this))
	})
})

function itemClick(el) {
	$(el).on('click', function() {
		if ($(this).find('.panel-collapse').hasClass('.in')) {
			$(this).find('.attendees').hide()
		} else {
			$(this).find('.attendees').show()
		}
	})
}


function bucketHover(el) {
	// var color = $(el).css('background-color')
	$(el).hover(function() {
  		// $(this).css('background-color', color.replace(')','').replace('rgb', 'rgba') + ", .3)")
  		$(this).find('.bucket-background').css('opacity', '.3')
  		$(this).find('.bucket-content').css('opacity', '.20')
  		$(this).find('.bucket-links').show()
  		$(this).find('.bucket-owners').show() },
  		function() {
  		// $(this).css('background-color', color)
  		$(this).find('.bucket-background').css('opacity', '1')
  		$(this).find('.bucket-content').css('opacity', '1')
  		$(this).find('.bucket-links').hide()
  		$(this).find('.bucket-owners').hide() })
}

// var Collapse2 = function (element) {
// 	this.$element = $(element)
// }

// Collapse2.prototype.show = function () { }
// Collapse2.prototype.hide = function () { }
// Collapse2.prototype.toggle = function () { 
// 	this[this.$element.hasClass('in') ? 'hide' : 'show']()
// }
