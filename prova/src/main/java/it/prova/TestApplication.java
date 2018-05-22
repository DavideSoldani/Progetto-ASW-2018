package it.prova;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TestApplication {

	public static void main(String[] args) {
		SpringApplication.run(TestApplication.class, args);
		
		//inizializzo un oggetto Hello contenente la stringa Hello World!
		HelloObject hello = new HelloObject();
		
		//stampo la stringa dell'oggetto hello
		System.out.println(hello.getHello()); 
		
		//creo un'array lungo quanto la stringa hello
		char helloArray[] = new char[hello.getHello().length()]; 
		
		//Popolo l'array helloArray con gli elementi della stringa hello
		for(int i=0; i<hello.getHello().length(); i++) {
			helloArray[i]=hello.getHello().charAt(i);
		}
		
		//Stampo elemento per elemento helloArray
		for(char element:helloArray)
			System.out.println(element);
	}
}
