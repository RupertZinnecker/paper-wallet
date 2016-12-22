function generateCraftcoinKeyPair(){
	// Generate a key pair 
	do{
		var curve = sjcl.ecc.curves.k256;
		var keys = sjcl.ecc.ecdsa.generateKeys(curve,10); 					
		var privkey = "" + sjcl.bn.fromBits(keys.sec.get());
		privkey = "0x" + privkey.substring(2);
		var pubkeyX = "" + sjcl.bn.fromBits(keys.pub.get().x);
		var pubkeyY = "" + sjcl.bn.fromBits(keys.pub.get().y);
		var pubkey = "0x04" + pubkeyX.substring(2) + pubkeyY.substring(2);
	}while(privkey.length != 66 || pubkey.length != 132)
	
	// Private key
	var privkeyAndVersion = "0xB9" + privkey.substring(2);
	var privkeyAndVersion = sjcl.codec.hex.toBits(privkeyAndVersion);
	var firstSHA = sjcl.hash.sha256.hash(privkeyAndVersion);
	var secondSHA = sjcl.hash.sha256.hash(firstSHA);
	var checksum = sjcl.codec.hex.fromBits(secondSHA).substr(0, 8).toUpperCase();
	privkey = sjcl.codec.hex.fromBits(privkeyAndVersion).toUpperCase() + checksum;
	privkey = hexToBase58(privkey);
	
	// Public key
	pubkey = sjcl.codec.hex.toBits(pubkey);
	var pubSHA = sjcl.hash.sha256.hash(pubkey);				
	var pubRIPEMD = sjcl.hash.ripemd160.hash(pubSHA);				
	var pubkeyAndVersion = "0x39" + sjcl.codec.hex.fromBits(pubRIPEMD);
	pubkeyAndVersion = sjcl.codec.hex.toBits(pubkeyAndVersion);
	firstSHA = sjcl.hash.sha256.hash(pubkeyAndVersion);				
	secondSHA = sjcl.hash.sha256.hash(firstSHA);				
	checksum = sjcl.codec.hex.fromBits(secondSHA).substr(0, 8).toUpperCase();
	pubkey = sjcl.codec.hex.fromBits(pubkeyAndVersion).toUpperCase() + checksum;
	pubkey = hexToBase58(pubkey);
	
	var keyPair = new Array(2);
	keyPair[0] = privkey;
	keyPair[1] = pubkey;
	return keyPair;
}