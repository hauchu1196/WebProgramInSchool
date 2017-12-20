$(document).ready(function() {
	var arr = $('.du-lich');
	var width = $(window).width();
	if (width < 992) {
		$('.btn-xem-them').on('click', function() {
			$('.btn-xem-them').hide();
			$(arr[arr.length - 1]).show();
		});
		$(arr[arr.length - 1]).hide();
	} else {
		$(arr[arr.length - 1]).show();
		$('.btn-close-item').on('click', function(event) {
			var self = this;
			$(event.target).parents()[2].remove();
		});
	}
	$(window).resize(function() {
		var width = $(window).width();
		if (width < 992) {
			$('.btn-xem-them').on('click', function() {
				$('.btn-xem-them').hide();
				$(arr[arr.length - 1]).show();
			});
			$(arr[arr.length - 1]).hide();
		} else {
			$(arr[arr.length - 1]).show();
			$('.btn-close-item').on('click', function(event) {
				var self = this;
				$(event.target).parents()[2].remove();
			});
		}
	});
});