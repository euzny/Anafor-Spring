<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html>
<head>

  <link rel="stylesheet" type="text/css" href="css/slick.css">
  <link rel="stylesheet" type="text/css" href="css/slick-theme.css">


<meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />


<title>아나포</title>



<style type="text/css">
    html, body {
      margin: 0;
      padding: 0;
    }

    * {
      box-sizing: border-box;
    }

    .slider {width: 50%; margin: 100px auto;}
    .slick-slide {margin: 0px 20px;}
    .slick-slide img {width: 100%;}
    .slick-prev:before,
    .slick-next:before {color: black;}
    .slick-slide {transition: all ease-in-out .3s; opacity: .2;}
    .slick-active {opacity: .5;}
    .slick-current {opacity: 1;}
  </style>



</head>

<body>

	<!-- mid -->
	<div id="mid">

	
  <section class="lazy1 slider" data-sizes="50vw">
    <div>
      <img  src="imgs/phone.png"/>
    </div>
    <div>
          <img  src="imgs/phone.png"/>
    </div>
    <div>
          <img  src="imgs/phone.png"/>
    </div>
    <div>
    	 <img  src="imgs/phone.png"/>
    </div>

  </section>
  
 
	
    
</div>
	<!--// mid —> -->

	<!-- bottom -->
	
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="js/slick.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">


	 $(".lazy1").slick({
	        lazyLoad: 'ondemand', // ondemand progressive anticipated
	        infinite: true,
	        autoplay: true,
	          autoplaySpeed: 1000
	       
	      });
	 /*   prevArrow : $('.prevArrow'), 
     nextArrow : $('.nextArrow') */

	
</script>
</body>
</html>