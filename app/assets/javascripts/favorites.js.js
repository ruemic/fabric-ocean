// Generated by CoffeeScript 1.4.0
(function(){$(function(){var e,t,n,r;$(".favorite").draggable();$("#drag-hint").delay(4e3).fadeOut("slow");e=$("#nav-fav-star");n=$(".fav-it");r=$(".un-fav-it");t=$(".destroy");n.live("click",function(){e.css({color:"#EEEABB"});return $(this).find("form").submit()});r.live("click",function(){$(this).find("form").submit();return e.css({color:"#0E3850;"})});t.live("click",function(){return $(this).parents("form").submit()});$(".favorite form").live("ajax:success",function(){return $(this).parents(".favorite").remove()});n.live("ajax:success",function(){return $(this).parents(".product").addClass("favorited")});return r.live("ajax:success",function(){return $(this).parents(".product").removeClass("favorited")})})}).call(this);