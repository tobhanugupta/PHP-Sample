/* imgsizer (flexible images for fluid sites) */
var imgSizer={Config:{imgCache:[],spacer:"/path/to/your/spacer.gif"},collate:function(aScope){var isOldIE=(document.all&&!window.opera&&!window.XDomainRequest)?1:0;if(isOldIE&&document.getElementsByTagName){var c=imgSizer;var imgCache=c.Config.imgCache;var images=(aScope&&aScope.length)?aScope:document.getElementsByTagName("img");for(var i=0;i<images.length;i++){images[i].origWidth=images[i].offsetWidth;images[i].origHeight=images[i].offsetHeight;imgCache.push(images[i]);c.ieAlpha(images[i]);images[i].style.width="100%";}
if(imgCache.length){c.resize(function(){for(var i=0;i<imgCache.length;i++){var ratio=(imgCache[i].offsetWidth/imgCache[i].origWidth);imgCache[i].style.height=(imgCache[i].origHeight*ratio)+"px";}});}}},ieAlpha:function(img){var c=imgSizer;if(img.oldSrc){img.src=img.oldSrc;}
var src=img.src;img.style.width=img.offsetWidth+"px";img.style.height=img.offsetHeight+"px";img.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')"
img.oldSrc=src;img.src=c.Config.spacer;},resize:function(func){var oldonresize=window.onresize;if(typeof window.onresize!='function'){window.onresize=func;}else{window.onresize=function(){if(oldonresize){oldonresize();}
func();}}}}

// add twitter bootstrap classes and color based on how many times tag is used
function addTwitterBSClass(thisObj) {
  var title = $(thisObj).attr('title');
  if (title) {
	var titles = title.split(' ');
	if (titles[0]) {
	  var num = parseInt(titles[0]);
	  if (num > 0)
		$(thisObj).addClass('label');
	  if (num == 2)
		$(thisObj).addClass('label label-info');
	  if (num > 2 && num < 4)
		$(thisObj).addClass('label label-success');
	  if (num >= 5 && num < 10)
		$(thisObj).addClass('label label-warning');
	  if (num >=10)
		$(thisObj).addClass('label label-important');
	}
  }
  else
	$(thisObj).addClass('label');
  return true;
}

// as the page loads, cal these scripts
$(document).ready(function() {

	// modify tag cloud links to match up with twitter bootstrap
	$("#tag-cloud a").each(function() {
		addTwitterBSClass(this);
		return true;
	});

	$("p.tags a").each(function() {
		addTwitterBSClass(this);
		return true;
	});

	$("ol.commentlist a.comment-reply-link").each(function() {
		$(this).addClass('btn btn-success btn-mini');
		return true;
	});

	$('#cancel-comment-reply-link').each(function() {
		$(this).addClass('btn btn-danger btn-mini');
		return true;
	});

	$('article.post').hover(function(){
		$('a.edit-post').show();
	},function(){
		$('a.edit-post').hide();
	});

	// Input placeholder text fix for IE
	$('[placeholder]').focus(function() {
	  var input = $(this);
	  if (input.val() == input.attr('placeholder')) {
		input.val('');
		input.removeClass('placeholder');
	  }
	}).blur(function() {
	  var input = $(this);
	  if (input.val() == '' || input.val() == input.attr('placeholder')) {
		input.addClass('placeholder');
		input.val(input.attr('placeholder'));
	  }
	}).blur();

	// Prevent submission of empty form
	$('[placeholder]').parents('form').submit(function() {
	  $(this).find('[placeholder]').each(function() {
		var input = $(this);
		if (input.val() == input.attr('placeholder')) {
		  input.val('');
		}
	  })
	});

	$('#s').focus(function(){
		if( $(window).width() < 940 ){
			$(this).animate({ width: '200px' });
		}
	});

	$('#s').blur(function(){
		if( $(window).width() < 940 ){
			$(this).animate({ width: '100px' });
		}
	});

	$('.alert-message').alert();

	$('.dropdown-toggle').dropdown();


	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

	var checkin = $('#dpd1').datepicker({
	  onRender: function(date) {
		return date.valueOf() < now.valueOf() ? 'disabled' : '';
	  }
	}).on('changeDate', function(ev) {
	  if (ev.date.valueOf() > checkout.date.valueOf()) {
		var newDate = new Date(ev.date)
		newDate.setDate(newDate.getDate() + 1);
		checkout.setValue(newDate);
	  }
	  checkin.hide();
	  $('#dpd2')[0].focus();
	}).data('datepicker');
	var checkout = $('#dpd2').datepicker({
	  onRender: function(date) {
		return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
	  }
	}).on('changeDate', function(ev) {
	  checkout.hide();
	}).data('datepicker');


	//remove first slash on pagination
	$('.pagination .prev').next('.page-numbers').addClass('no-slash');

	//same height divs
	/* Thanks to CSS Tricks for pointing out this bit of jQuery
	http://css-tricks.com/equal-height-blocks-in-rows/
	It's been modified into a function called at page load and then each time the page is resized. One large modification was to remove the set height before each new calculation. */

	equalheight = function(container){

	var currentTallest = 0,
		 currentRowStart = 0,
		 rowDivs = new Array(),
		 $el,
		 topPosition = 0;
	 $(container).each(function() {

	   $el = $(this);
	   $($el).height('auto')
	   topPostion = $el.position().top;

	   if (currentRowStart != topPostion) {
		 for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
		   rowDivs[currentDiv].height(currentTallest);
		 }
		 rowDivs.length = 0; // empty the array
		 currentRowStart = topPostion;
		 currentTallest = $el.height();
		 rowDivs.push($el);
	   } else {
		 rowDivs.push($el);
		 currentTallest = (currentTallest < $el.height()) ? ($el.height()) : (currentTallest);
	  }
	   for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
		 rowDivs[currentDiv].height(currentTallest);
	   }
	 });
	}

	$('#myTab a').click(function (e) {
	  e.preventDefault();
	  $(this).tab('show');
	})

	$('#ShowRooms').click(function (e) {
		e.preventDefault();
		 var aTag = ($("#myTab").offset().top - 100);
		$('html,body').animate({scrollTop: aTag},'slow');

		$('#myTab a[href="#rooms"]').tab('show');
	});

	function parseURL(url) {
		var parser = document.createElement('a'),
			searchObject = {},
			queries, split, i;
		// Let the browser do the work
		parser.href = url;
		// Convert query string to object
		queries = parser.search.replace(/^\?/, '').split('&');
		for( i = 0; i < queries.length; i++ ) {
			split = queries[i].split('=');
			searchObject[split[0]] = split[1];
		}
		return {
			protocol: parser.protocol,
			host: parser.host,
			hostname: parser.hostname,
			port: parser.port,
			pathname: parser.pathname,
			search: parser.search,
			searchObject: searchObject,
			hash: parser.hash
		};
	}

	var url = window.location.href;
	filterObj = parseURL(url);

	if (filterObj.searchObject.hasOwnProperty('priceRangeFilterStart')) {
		var priceRangeFilterStart = filterObj.searchObject.priceRangeFilterStart;
	} else {
		var priceRangeFilterStart = 0;
	}

	if (filterObj.searchObject.hasOwnProperty('priceRangeFilterEnd')) {
		var priceRangeFilterEnd = filterObj.searchObject.priceRangeFilterEnd;
	} else {
		var priceRangeFilterEnd = 4000;
	}

	if (typeof angular !== 'undefined') {
		angular.element(document).ready(function() {
			var scope = angular.element("#searchController").scope();

            if (!scope.maxPrice) {
                return;
            }

			//load filter price
			$("#priceRange").ionRangeSlider({
				min:      scope.minPrice || 0,
				max:      scope.maxPrice,
				from:     priceRangeFilterStart,
				to:       priceRangeFilterEnd,
				type:     'double',
				step:     20,
				prefix:   "$",
				prettify: true,
				hasGrid:  false,
				onChange: function (data) {
				    scope.$apply(function(){
				        scope.filters.priceRangeFrom = data.fromNumber;
				        scope.filters.priceRangeTo   = data.toNumber;
				    });
			    },
				onLoad: function (obj) {        // callback is called after slider load and update
					$("#priceRange").val("&filterByPriceRange=true&priceRangeFilterStart="+obj.fromNumber+"&priceRangeFilterEnd="+obj.toNumber);
				},
				// onChange: function (obj) {      // callback is called on every slider change
				//     console.log(obj);
				// },
				onFinish: function (obj) {      // callback is called on slider action is finished
					$("#priceRange").val("&filterByPriceRange=true&priceRangeFilterStart="+obj.fromNumber+"&priceRangeFilterEnd="+obj.toNumber);
				}
			});
		});
	}


	function initialize()
	{
		var LocationData = window.LocationData;

		//Load image for map
		if($('#load_image_map').length > 0) {
			$('#load_image_map').attr('src','https://maps.googleapis.com/maps/api/staticmap?center='+LocationData[0].hotelLat+','+LocationData[0].hotelLong+'&zoom=8&size=214x214');
		}

		var map = new google.maps.Map(document.getElementById('map-canvas') );

		var bounds = new google.maps.LatLngBounds();
		var infowindow = new google.maps.InfoWindow();

		for (var i in LocationData)
		{
			var p = LocationData[i];
			var latlng = new google.maps.LatLng(p.hotelLat, p.hotelLong);

			bounds.extend(latlng);


			var contentString = '<div id="content">'+
		      '<h5 id="firstHeading" class="firstHeading">'+p.hotelName+'</h5><p style="color: #72bf66; font-size: 18px; font-weight: bold;">USD '+p.hotelPrice+'</p>'+
		      '</div>';

			var marker = new google.maps.Marker({
				position: latlng,
				map: map,
				title: p.hotelName,
				description: contentString,
				link: p.hotelLink,
				animation: google.maps.Animation.DROP
			});

			google.maps.event.addListener(marker, 'mouseover', function() {
				infowindow.setContent(this.description);
				infowindow.open(map, this);
			});

			google.maps.event.addListener(marker, 'mouseout', function() {
				infowindow.close(map, this);
			});

			google.maps.event.addListener(marker, 'click', function() {
				console.log(this.link);
				//window.location.href = this.link;
			});
		}

		$('#myModal').on('shown', function () {
			google.maps.event.trigger(map, "resize");
			map.fitBounds(bounds);
			map.setZoom(11);
		});
	}

	google.maps.event.addDomListener(window, 'load', initialize);




	//Actions for search on the home page
	$('#num_room').on('change', function() {
		var $this = $(this);

		var lastValue = $('#num_room option:last-child').val();

		for (var x = 2; x <= lastValue; x++) {

			if (x <= $this.val()) {
				//check if row is already created
				if ($('#receiveHotelDeails #hotelRoomDetail_'+x).length === 0) {

					var layout = '<div class="row-fluid" id="hotelRoomDetail_'+ x +'" style="padding: 10px 0; border-top: 1px solid #fa6044;">'+
										'<div class="span4">'+
										'<br />Room '+ x +
										'</div>'+
										'<div class="span4 adult-box">'+
										'	<label>Adult(s)'+
										'		<select name="num_adult_'+ x +'" class="span12">'+
										'			<option value="1" title="1">1</option>'+
										'			<option value="2" title="2">2</option>'+
										'			<option value="3" title="3">3</option>'+
										'			<option value="4" title="4">4</option>'+
										'			<option value="5" title="5">5</option>'+
										'			<option value="6" title="6">6</option>'+
										'			<option value="7" title="7">7</option>'+
										'			<option value="8" title="8">8</option>'+
										'			<option value="9" title="9">9</option>'+
										'			<option value="10" title="10">10</option>'+
										'		</select>'+
										'	</label>'+
										'</div>'+
										'<div class="span4 children-box">'+
										'	<label>Children'+
										'		<select name="num_child_'+ x +'" class="num_child" data-child="'+ x +'" class="span12">'+
										'			<option value="0" title="0">0</option>'+
										'			<option value="1" title="1">1</option>'+
										'			<option value="2" title="2">2</option>'+
										'			<option value="3" title="3">3</option>'+
										'			<option value="4" title="4">4</option>'+
										'			<option value="5" title="5">5</option>'+
										'		</select>'+
										'	</label>'+
										'</div>'+
										'<div id="receiveChildAge_'+ x +'">'+

										'</div>'+
									'</div>';

					$(layout).appendTo('#receiveHotelDeails');

				}
			} else {
				$('#receiveHotelDeails #hotelRoomDetail_'+x).remove();
			}


		}

	});

	//Generate child age field
	$('.num_child').live('change', function(){
		var $this = $(this);
		//console.log($this);

		//console.log($this[0] +' option:last-child').val();

		var room = $($this[0]).data('child');

		var children = $this.val();

		var lastValue = $('#hotelRoomDetail_'+ room +' .num_child option:last-child').val();
		//console.log(lastValue);

		for (var x = 1; x <= lastValue; x++) {
//			console.log(childrenAges_Room'+room+'_Child'+ x +');
			if (x <= children) {

				if ($('#childrenAges_Room'+room+'_Child'+ x).length === 0) {
					var layout = '<div class="row-fluid" id="childrenAges_Room'+room+'_Child'+ x +'">'+
										'<div class="span8 text-right">'+
										'Child '+ x + ' age'+
										'</div>'+
										'<div class="span4 adult-box">'+
										'	<label>'+
										'		<select name="child_age_room'+ room +'_child'+ x +'" class="span12">'+
										'			<option value="0" title="0">0</option>'+
										'			<option value="1" title="1">1</option>'+
										'			<option value="2" title="2">2</option>'+
										'			<option value="3" title="3">3</option>'+
										'			<option value="4" title="4">4</option>'+
										'			<option value="5" title="5">5</option>'+
										'			<option value="6" title="6">6</option>'+
										'			<option value="7" title="7">7</option>'+
										'			<option value="8" title="8">8</option>'+
										'			<option value="9" title="9">9</option>'+
										'			<option value="10" title="10">10</option>'+
										'			<option value="11" title="10">11</option>'+
										'			<option value="12" title="10">12</option>'+
										'			<option value="13" title="10">13</option>'+
										'			<option value="14" title="10">14</option>'+
										'			<option value="15" title="10">15</option>'+
										'			<option value="16" title="10">16</option>'+
										'			<option value="17" title="10">17</option>'+
										'		</select>'+
										'	</label>'+
										'</div>'+
									'</div>';

					$(layout).appendTo('#receiveChildAge_'+room);
				}

			} else{
				$('#childrenAges_Room'+room+'_Child'+ x).remove();
			}


		}


		//console.log();
	});

}); /* end of as page load scripts */

function resizeModal() {
	var viewportWidth = $(window).width();
	var viewportHeight = $(window).height();

	 $('#myModal').width(viewportWidth-20);
	 $('#myModal').css('margin-left',  (viewportWidth-20)/(-2));
	 $('#map-canvas').height(viewportHeight-300);
	 $('#myModal').height(viewportHeight-200);
}

$(window).load(function() {

	resizeModal();

	if (equalheight) {
		equalheight('.same-height > .row-fluid > [class*="span"]');
	}

	//Flexslider
	$('#carousel').flexslider({
		animation: "slide",
		controlNav: false,
		animationLoop: false,
		slideshow: false,
		itemWidth: 150,
		itemMargin: 5,
		asNavFor: '#slider'
	});

	$('#slider').flexslider({
		animation: "slide",
		controlNav: false,
		animationLoop: false,
		slideshow: false,
		sync: "#carousel",
		start: function(slider){
		  $('body').removeClass('loading');
		}
	});
});


$(window).resize(function(){
	resizeModal();

	if (equalheight) {
		equalheight('.same-height > .row-fluid > [class*="span"]');
	}
});


