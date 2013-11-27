// Popup window function
	function windowPopup(url) {
		
		popupWindow = window.open(url,'popUpWindow','height=600,width=550,left=100,top=100,resizable=no,scrollbars=yes,toolbar=no,menubar=no,location=no,directories=no, status=yes');
		if (popupWindow == null || typeof(popupWindow)=='undefined') { 	
			alert('Please disable your pop-up blocker and click the "Help" link again.'); 
		} 
		else { 	
			popupWindow.focus();
		}
	}