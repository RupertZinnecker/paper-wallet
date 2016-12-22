function hexToBase58(inputNumber) {	
	var output = "";
	
		//hexToDecimal
		var sum = new BigInteger();
		for (var i = 0;i<inputNumber.length;i++)
		{
			sum = sum.multiply(new BigInteger(16)).add(new BigInteger(hexToDecimalChar(inputNumber.charAt(i)))); 	
		}
		
		//decimalToBase58
		var rest = new Array();
		var base = new BigInteger(58);
		var i = 0;			
		do
		{		
			rest[i] = sum.remainder(base).valueOf();
			sum = sum.divide(base);
			i++;
		}while(sum.valueOf() > 0)
		for(var j=0;j<i;j++)
		{
			output = output + decimalToBase58Char(rest[i-j-1]);
		}	
		
	return output;
}

function hexToDecimalChar(inputChar){
	var hexAlphabet = "0123456789ABCDEF";
	for (var i = 0; i<hexAlphabet.length;i++)
	{
		if(inputChar == hexAlphabet.charAt(i))
			return i;
	}
}

function decimalToBase58Char(inputChar){
	var base58Alphabet = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";
	return base58Alphabet.charAt(inputChar);
}