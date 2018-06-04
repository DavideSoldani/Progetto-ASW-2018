package it.prova;

public class HelloArray {
	
	char helloArray[];
	
	public HelloArray(HelloObject hello) {
		//creo un'array lungo quanto la stringa hello
		this.helloArray = new char[hello.getHello().length()]; 
			
		//Popolo l'array helloArray con gli elementi della stringa hello
		for(int i=0; i<hello.getHello().length(); i++) {
			helloArray[i]=hello.getHello().charAt(i);
		}
	}
	
	public char[] getArray() {
		return this.helloArray;
	}
	
}
