$(function($, window, document, undefined) {
	var $D = detail = {
		
		func: {
			init: function() {
				$(".azbox3_bot").css('overflow');
				/**
				 * 行程概要
				 */
				$('.travel_profile_desc').each(function() {
					var travel_profile_desc_H = $(this).height();
					if (travel_profile_desc_H > 140) {
						$(this).parent().siblings('.travel_profile_ellipses').show();
					}
				});
				if ($('.travel_profile_all li').length <= 6) {
					$(".travel_profile_next").css("display", "none");
				}
				$('.travel_profile_all').find('li').eq(-1).find('.travel_profile_line_right').css('border-bottom', '1px solid transparent');
				var imgUl = $('.travel_profile_line_wrapper').find('ul'),
					childList = imgUl.children(),
					totalLen = childList.length * 141;
				imgUl.css('width', totalLen);
				$('.travel_profile_desc_wrapper').hover(function() {
					var _this = $(this).parent(),
						travel_profile_desc_H = $(this).find('.travel_profile_desc').height();
					travel_profile_day_num = _this.find('.travel_profile_num').text();
					if (travel_profile_desc_H > 142) {
						var travel_profile_left_num = Math.abs(imgUl.css('left').split("px")[0]) / 141,
							travel_profile_current_num = travel_profile_day_num - travel_profile_left_num - 1,
							travel_profile_current_left = 35 + travel_profile_current_num * 141;
						
						$(this).parent().parent().parent().parent().find('.POIofDAY' + travel_profile_day_num).show();
						$('.travel_profile_detail').css("left", travel_profile_current_left);
						_this.find('.travel_profile_day').css("color", "#f08300");
						_this.find('.travel_profile_origin').css("background-position", "-2px -134px");
						$('.travel_profile_detail').addClass("travel_profile_detail_hover");
						
						
					}
				}, function() {
					$('.travel_profile_detail').hide();
					$('.travel_profile_day').css("color", "#848484");
					$('.travel_profile_origin').css("background-position", "-2px -117px");
				});
				$('.travel_profile_detail').hover(function() {
					
					$(this).show();
					
					$(this).siblings('.travel_profile_all').find('li').find('.travel_profile_origin').eq(travel_profile_day_num - 1).css("background-position", "-2px -134px");
					$(this).siblings('.travel_profile_all').find('li').find('.travel_profile_day').eq(travel_profile_day_num - 1).css("color", "#f08300");
				}, function() {
					$('.travel_profile_detail').hide();
					$('.travel_profile_day').css("color", "#848484");
					$('.travel_profile_origin').css("background-position", "-2px -117px");
				});
				$('.travel_profile_next').click(function() {
					var _this = $(this),
						able = _this.attr('data-able');

					var imgUl = _this.siblings('.travel_profile_line_wrapper').find('ul'),
						childList = imgUl.children(),
						len = childList.length,
						totalLen = childList.length * 141;
					imgUl.css('width', totalLen);

					if (len < 6 || imgUl.css('left') == (846 - totalLen + 'px')) {
						return;
					}
					_this.attr('data-able', 'false');
					if (able == 'true') {
						imgUl.animate({
							left: '-=846px'
						}, function() {
							_this.attr('data-able', 'true');
							$(this).parent().parent().parent().find('.travel_profile_icon').css("display", "none");
							if (len < 6 || imgUl.css('left').split("px")[0] <= (846 - totalLen)) {
								$(this).parent().parent().parent().find(".travel_profile_next").css("display", "none");

							}
							if (imgUl.css('left') != '0px') {
								$(this).parent().parent().parent().find(".travel_profile_pre").css("display", "inline-block");
							}
						});
					}
				});
				$('.travel_profile_pre').click(function() {
					var _this = $(this),
						able = _this.attr('data-able');

					var imgUl = _this.siblings('.travel_profile_line_wrapper').find('ul'),
						childList = imgUl.children(),
						len = childList.length,
						totalLen = childList.length * 141;
					imgUl.css('width', totalLen);

					if (imgUl.css('left') == '0px') {
						return;
					}
					_this.attr('data-able', 'false');
					if (able == 'true') {
						imgUl.animate({
							left: '+=846px'
						}, function() {
							_this.attr('data-able', 'true');
							if (imgUl.css('left') == '0px') {
								$(this).parent().parent().parent().find(".travel_profile_pre").css("display", "none");
								$(this).parent().parent().parent().find('.travel_profile_icon').css("display", "inline-block");
							}
							if (len != 6 && imgUl.css('left') != (846 - totalLen + 'px')) {
								$(this).parent().parent().parent().find(".travel_profile_next").css("display", "inline-block");
							}
						});
					}
				});

				
				/**
				 * 行程详情
				 */
				//图片延时加载
				$('img.lazy').lazyload();
				//图片轮播
				$('.teamtour_img_next').each(function() {
					var imgUl = $(this).siblings('.teamtour_plan_images_wrapper').find('.teamtour_plan_images'),
						childList = imgUl.children(),
						len = childList.length;
						totalLen = len * 235;
					imgUl.css('width', totalLen);
					if (len < 5) {
						$(this).css("display", "none");
						$(this).siblings('.teamtour_img_prev').css("display", "none");
					}
				});
				$('.teamtour_img_next').click(function() {
					var _this = $(this),
						able = _this.attr('data-able');

					var imgUl = _this.siblings('.teamtour_plan_images_wrapper').find('.teamtour_plan_images'),
						childList = imgUl.children(),
						len = childList.length,
						totalLen = childList.length * 235;
					imgUl.css('width', totalLen);

					if (len < 4 || imgUl.css('left') == (940 - totalLen + 'px')) {
						return;
					}
					_this.attr('data-able', 'false');
					if (able == 'true') {
						imgUl.animate({
							left: '-=235px'
						}, function() {
							_this.attr('data-able', 'true');
							if (len < 4 || imgUl.css('left') == (940 - totalLen + 'px')) {
								_this.css("display", "none");
								_this.siblings('.teamtour_img_prev').css("display", "none");
							}
							if (imgUl.css('left') != '0px') {
								_this.siblings(".teamtour_img_prev").css("display", "inline-block");
							}
						});
					}
				});
				$('.teamtour_img_prev').click(function() {
					var _this = $(this),
						able = _this.attr('data-able');

					var imgUl = _this.siblings('.teamtour_plan_images_wrapper').find('.teamtour_plan_images'),
						childList = imgUl.children(),
						len = childList.length,
						totalLen = childList.length * 235;
					imgUl.css('width', totalLen);

					if (imgUl.css('left') == '0px') {
						return;
					}
					_this.attr('data-able', 'false');
					if (able == 'true') {
						imgUl.animate({
							left: '+=235px'
						}, function() {
							_this.attr('data-able', 'true');

							if (len != 4 && imgUl.css('left') != (940 - totalLen + 'px')) {
								_this.siblings(".teamtour_img_next").css("display", "inline-block");
							}
						});
					}
				});
				//左侧电梯 && 顶部导航
				if (!$('html').hasClass('ie7')) {
					$('.wq_scroll_nav').wqScrollSpy({
						ActiveControlClass: 'travel_fixed_nav_active',
						beforeScrollArea: function() {
							$('.wq_scroll_nav').hide();
						},
						scrollToArea: function() {
							$('.wq_scroll_nav').show();
						},
						whenInArea_call: function() {
							if ($('.travel_fixed_nav_part').hasClass('travel_fixed_nav_active')) {
								var _this = $('.travel_fixed_nav_active').find('.travel_fixed_nav_day_wrapper'),
									_travel_fixed_nav_detail = _this.siblings('.travel_fixed_nav_detail');
								if (_travel_fixed_nav_detail.hasClass('hide')) {
									$('.travel_fixed_nav_detail').addClass('hide');
									_travel_fixed_nav_detail.removeClass('hide');
									$('.travel_fixed_nav_part').removeClass('travel_fixed_nav_active');
									_this.parent().addClass('travel_fixed_nav_active');
								}
								if (_this.parent().hasClass('travel_fixed_nav_part_last_active')) {
									_this.parent().removeClass('travel_fixed_nav_part_last');
								} else {
									$('.travel_fixed_nav_part_last_active').addClass('travel_fixed_nav_part_last');
								}
							}

							var winWidth = $(window).width(),
								travel_profiule_nav_left = winWidth - (1120 + (winWidth - 1000) / 2) + 35;
							$('.travel_fixed_nav').css("left", travel_profiule_nav_left);
						},
						scrollOutArea: function() {
							$('.wq_scroll_nav').hide();
						}
					});
				}
				var winWidth = $(window).width(),
					travel_profiule_nav_left = winWidth - (1120 + (winWidth - 1000) / 2) + 35;
				$('.travel_fixed_nav').css("left", travel_profiule_nav_left);

				$('.wq_scroll_nav_top').wqScrollSpy({
					wq_scroll_nav: 'wq_scroll_nav_top',
					wq_scroll_navbar: 'wq_scroll_navbar_top',
					wq_scroll_part: 'wq_scroll_part_top',
					ActiveControlClass: 'active_tag',
					beforeScrollArea: function() {
						$('.wq_scroll_nav_top').css({
							'position': 'relative',
							'width': '998px',
							'z-index': '1'
						});
					},
					scrollToArea: function() {
						$('.wq_scroll_nav_top').css({
							'position': 'fixed',
							'z-index': 1001,
							'top': 0
						});
					}
				});
			},
		}
	};
	window.$D = $D;
	$D.func.init();
}(jQuery, window, document));