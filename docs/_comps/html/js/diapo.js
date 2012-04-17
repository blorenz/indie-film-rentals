$(function(){
	var logoPosition = 0;
	var logos = [-8,-115,-222,-323,-431,-540,-647,-754,-866,-970,-1079,-1184,-1288,-1400,-1512,-1618,-1726]
	$('#logo').click(function(e){
		e.preventDefault();
		logoPosition ++;
		if(logoPosition == 14){
			logoPosition = 0;
		};
		$(this).css(
			{'background-position': '-80px '+logos[logoPosition].toString()+'px'}
		);
	});
	
	$('a').click(function(e){
		e.preventDefault();
	});
});