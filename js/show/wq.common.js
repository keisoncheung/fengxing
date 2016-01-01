/**
 * @usage: base	api
 **/

//jquery cookie
(function(factory) {
	if (typeof define === 'function' && define.amd) {
		define(['jquery'], factory);
	} else if (typeof exports === 'object') {
		factory(require('jquery'));
	} else {
		factory(jQuery);
	}
}(function($) {
	
	var config = $.cookie = function(key, value, options) {
		
		var result = key ? undefined : {};
		var cookies = document.cookie ? document.cookie.split('; ') : [];
		
		return result;
	};
	config.defaults = {};


}));










