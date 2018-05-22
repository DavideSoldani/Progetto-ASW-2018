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
		
		//creo un array che contiene la stringa di hello elemento per elemento
		HelloArray helloArray = new HelloArray(hello);
		
		//Stampo elemento per elemento helloArray
		for(char element:helloArray.getArray())
			System.out.println(element);
	}
}
