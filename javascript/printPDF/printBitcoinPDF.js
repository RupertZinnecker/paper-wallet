function printPDF(privkey, pubkey, currency, amount)
{
	var doc = new jsPDF();	
		
	var canvas = document.getElementById("designImage");
	var imgBackground = canvas.toDataURL("image/png");
	
	var imgLogo = new Image();
	var imgSecret = new Image(); 
	var imgSymbol = new Image();
	imgLogo.src = "../images/top6.png";
	imgSecret.src = "../images/top7.png";
	imgSymbol.src = "../images/currencies/" + currency.toLowerCase() + "Color.png";
	var canvasLogo = document.createElement("canvas");
	var canvasSecret = document.createElement("canvas");
	var canvasSymbol = document.createElement("canvas");
	canvasLogo.width = imgLogo.width;
	canvasLogo.height = imgLogo.height;
	canvasSecret.width = imgSecret.width;
	canvasSecret.height = imgSecret.height;
	canvasSymbol.width = imgSymbol.width;
	canvasSymbol.height = imgSymbol.height;
				
	var ctx = canvasLogo.getContext("2d");
	ctx.drawImage(imgLogo, 0, 0);
	var ctx2 = canvasSecret.getContext("2d");
	ctx2.drawImage(imgSecret, 0, 0);	
	var ctx3 = canvasSymbol.getContext("2d");
	ctx3.drawImage(imgSymbol, 0, 0);
			
	var imgLogoURL = canvasLogo.toDataURL("image/png");
	var imgSecretURL = canvasSecret.toDataURL("image/png");
	var imgSymbolURL = canvasSymbol.toDataURL("image/png");
			
	doc.addImage (imgBackground, 'png', 0, 0, 160, 226);
	doc.line(0, 113, 113, 226);
	doc.line(22, 0, 22, 226);
	doc.line(0, 113, 160, 113);
	doc.line(138, 0, 138, 226);
	doc.addImage(imgLogoURL, 'png', 22, 113, 116, 56.5);
	doc.addImage(imgSecretURL, 'png', 59, 0, 78, 56.5);
	doc.addImage(imgSymbolURL, 'png', 100, 134, 5, 5);

	doc.setFont("verdana");
	doc.setFontType("bold");
	doc.setFontSize(9);			
	doc.text(currency + ' PAPER WALLET', 55, 138);
	doc.setFontType("normal");
	doc.setFontSize(7);			
	doc.text('PUBLIC KEY:', 55, 147);
	doc.text(pubkey, 55, 150);
	doc.text("Amount:"+amount, 55, 156);
		
	var canvasQR = qr.canvas(pubkey);
	var imageQR = canvasQR.toDataURL("image/png");
	doc.addImage(imageQR, 'png', 110, 134);
	
	doc.text('PRIVATE KEY:', 60, 5);
	doc.text(privkey, 60, 8);
	
	var canvasQRpriv = qr.canvas(privkey);
	var imageQRpriv = canvasQRpriv.toDataURL("image/png");
	doc.addImage(imageQRpriv, 'png', 110, 30);
			
	doc.save('a4.pdf');
}