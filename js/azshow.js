// JavaScript Document
$(document).ready(function(){
  $(window).scroll( function(){
	var scrollheight=$(window).scrollTop();
	var showContentH = $('.azboxshow2').height();	
	var tuanContentH = $(".toper").outerHeight()+$(".header").outerHeight()+$(".azboxshow3").outerHeight()+$(".azboxshow1").innerHeight()+50+$(".azboxshow2").outerHeight();  
	//alert(scrollheight);

	if(scrollheight>tuanContentH){
	  $(".fixed_bar").css({position:'fixed',top:'0px'});
	  $(".statusBtn").css('display','block');
	}else{
	  $(".fixed_bar").css({position:'',top:''});
	  $(".statusBtn").css('display','none');
	}
	
	if(scrollheight>tuanContentH){
	  $(".fixed_barTuan").css({position:'fixed',top:'0px'});
	}else{
	  $(".fixed_barTuan").css({position:'',top:''});
	}
	
  });
});
$(function(){
  $('.fixed_bar').find('li').click(function(){
	$('.fixed_bar').find('li').removeClass('xqactive');
	$(this).addClass('xqactive');
  });
  
});




