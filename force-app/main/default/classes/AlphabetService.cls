Public class AlphabetService {
	Static String someWords;
	Public String otherWords;
	
	Public AlphabetService() {}

	Public void addWord(String word) {
		someWords = word;
		otherWords = word;
	} 
	Public String getSomeWords() {
		Return someWords;
	}
	Public String getOtherWords(){
		Return otherWords;
	}

}