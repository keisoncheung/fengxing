$(function($, win, doc, undefined) {

	/* ------------------------$.fn.function----------------------------------- */

	$.fn.extend({
		/**
		 * select init plugin
	 	 */
		
		wqScrollSpy: function(options) {
			var defaults = {
					wq_scroll_nav: '', 		//对浮动导航整体设置class
					wq_scroll_navbar: '', 	//对导航标签设置class
					wq_scroll_part: '', 	//对滚动的每个内容块设置class
					ActiveControlClass: '', //导航块选中时的样式
					beforeScrollArea: '', 	//未到达滚动区域时，浮动导航执行的函数,例:beforeScrollArea:function(){ $('.wq_scroll_nav').hide(); },
					scrollToArea: '', 		//到达滚动区域时，浮动导航执行的函数
					scrollOutArea: '', 		//离开滚动区域时，滚动导航执行的函数，默认隐藏
					whenInArea_call: ''		// 当在滚动区域滚动时的回调函数
				},
				opts = $.extend({}, $.fn.wqScrollSpy.defaults, options),
				wq_scroll_nav = opts.wq_scroll_nav ? opts.wq_scroll_nav : 'wq_scroll_nav',
				wq_scroll_navbar = opts.wq_scroll_navbar ? opts.wq_scroll_navbar : 'wq_scroll_navbar',
				wq_scroll_part = opts.wq_scroll_part ? opts.wq_scroll_part : 'wq_scroll_part',
				ActiveControlClass = opts.ActiveControlClass,
				beforeScrollArea = opts.beforeScrollArea,
				scrollToArea = opts.scrollToArea,
			    scrollOutArea = opts.scrollOutArea,
			    whenInArea_call = opts.whenInArea_call,
				ishide = opts.ishide,
				doc_H = $(doc).height(),
				win_H = $(win).height(),
				wq_scroll_part_H = 0,
				every_part_top = new Array(),
				every_navbar = new Array();

			$('.' + wq_scroll_part).each(function() {
				wq_scroll_part_H += $(this).height();
			});

			//导航如需要隐藏或其他样式，刚加载页面时隐藏导航或执行其他样式
			function changeScrollpartStatus() {
				var _scrollT = $(win).scrollTop(),
					scrollpartTop = $('.' + wq_scroll_part).eq(0).offset().top;
				if (_scrollT < scrollpartTop && beforeScrollArea && typeof beforeScrollArea == 'function') {
					beforeScrollArea();
				}
				if (_scrollT > scrollpartTop && _scrollT < wq_scroll_part_H + $('.' + wq_scroll_part).offset().top && scrollToArea && typeof scrollToArea == 'function') {
					scrollToArea();
				}
			}

			function scrollPartEvent() {
				var scrollT = $(win).scrollTop();
				$('.' + wq_scroll_part).each(function(i) {
					every_part_top[i] = $(this).offset().top;
					every_navbar[i] = $('.' + wq_scroll_navbar).eq(i);
					
					//判断当前页面位置，并执行相应函数
					changeScrollpartStatus();

					//设置导航标签active样式
					if (scrollT >= every_part_top[i]) {
						$('.' + wq_scroll_navbar).removeClass(ActiveControlClass);
						every_navbar[i].addClass(ActiveControlClass);
					}

					//判断滚动区域的最后一部分执行函数
					var wq_scroll_part_L = $('.' + wq_scroll_part).length;
			
					if (i == (wq_scroll_part_L - 1)) {
						var last_part_offset_top = every_part_top[i],
							last_part_H = $(this).height(),
							wq_scroll_nav_H = $('.' + wq_scroll_nav).height();
						
						if (scrollT > (last_part_offset_top + last_part_H - wq_scroll_nav_H)) {
							if (scrollOutArea && typeof scrollOutArea == 'function') {
								scrollOutArea();
							}
						}
					}
				});
			}
			$(win).on('scroll', function() {
				scrollPartEvent();
				if (whenInArea_call && typeof whenInArea_call == 'function') {
					whenInArea_call();
				}
			});
			$('.' + wq_scroll_navbar).click(function() {
				$('.' + wq_scroll_navbar).removeClass(ActiveControlClass);
				$(this).addClass(ActiveControlClass);
			});

			changeScrollpartStatus();

			return this;
		}
	});

	/**
	 * @usage 	: woqu common slider
	 * @author 	: Frend
	 * @email	: xin.wang@woqu.com
	 * @date   	: 2014-07-09
	 */
	Slider = function(container, options) {
		/*
		options = {
			auto: true,
			time: 3000,
			event: 'hover' | 'click',
			mode: 'slide | fade',
			controller: $(),
			activeControllerCls: 'className',
			exchangeEnd: $.noop
		}
		*/

		"use strict";	//stirct mode not support by IE9-

		if (!container) return;

		var options = options || {},
			currentIndex = 0,
			cls = options.activeControllerCls,
			delay = options.delay,
			isAuto = options.auto,
			controller = options.controller,
			event = options.event,
			interval,
			slidesWrapper = container.children().first(),
			slides = slidesWrapper.children(),
			length = slides.length,
			childWidth = container.width(),
			totalWidth = childWidth * slides.length;

		function init() {
			var controlItem = controller.children();

			mode();

			event == 'hover' 
			? controlItem.mouseover(function() {
				stop();
				var index = $(this).index();

				play(index, options.mode);
			}).mouseout(function() {
				isAuto && autoPlay();
			}) 
			: controlItem.click(function() {
				stop();
				var index = $(this).index();

				play(index, options.mode);
				isAuto && autoPlay();
			});

			isAuto && autoPlay();
		}

		//animate mode
		function mode() {
			var wrapper = container.children().first();
			
			options.mode == 'slide' 
			? wrapper.width(totalWidth)
			: wrapper.children().css({
				'position': 'absolute',
				'left': 0,
				'top': 0
			})
			.first().siblings().hide();
		}

		//auto play
		function autoPlay() {
			interval = setInterval(function() {
				triggerPlay(currentIndex);
			}, options.time);
		}

		//trigger play
		function triggerPlay(cIndex) {
			var index;

			(cIndex == length - 1)
			? index = 0
			: index = cIndex + 1;
			play(index, options.mode);
		}

		//play
		function play(index, mode) {
			slidesWrapper.stop(true, true);
			slides.stop(true, true);
			
			mode == 'slide'
			? (function() {
				if (index > currentIndex) {
					slidesWrapper.animate({
						left: '-=' + Math.abs(index - currentIndex) * childWidth + 'px'
					}, delay);
				} else if (index < currentIndex) {
					slidesWrapper.animate({
						left: '+=' + Math.abs(index - currentIndex) * childWidth + 'px'
					}, delay);
				} else {
					return;
				}
			})()
			: (function() {
				if (slidesWrapper.children(':visible').index() == index) return;
				slidesWrapper.children().fadeOut(delay).eq(index).fadeIn(delay);
			})();

			try {
				controller.children('.' + cls).removeClass(cls);
				controller.children().eq(index).addClass(cls);
			} catch(e) {}

			currentIndex = index;

			options.exchangeEnd && typeof options.exchangeEnd == 'function' && options.exchangeEnd.call(this, currentIndex);
		}

		//stop
		function stop() {
			clearInterval(interval);
		}

		//prev frame
		function prev() {
			stop();
			
			currentIndex == 0
			? triggerPlay(length - 2)
			: triggerPlay(currentIndex - 2);
			
			isAuto && autoPlay();
		}

		//next frame
		function next() {
			stop();
			
			currentIndex == length - 1
			? triggerPlay(-1)
			: triggerPlay(currentIndex);
			
			isAuto && autoPlay();
		}

		//init
		init();

		//expose the Slider API
		return {
			prev: function() {
				prev();
			},
			next: function() {
				next();
			}
		}
	};

}(jQuery, window, document));