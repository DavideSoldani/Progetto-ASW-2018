package it.prova;


import static org.junit.Assert.assertEquals;

import org.junit.Test;

import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestApplicationTest {

	@Test
	public void contextLoads() {
	}

	@Test
	public void testPrimoCarattereStringa() {
		HelloObject hello = new HelloObject();
		assertEquals('H',hello.getHello().charAt(0));
	}
	
	@Test
	public void testConfrontoStringaArray() {
		HelloObject objectHello = new HelloObject();
		HelloArray objectArray = new HelloArray(objectHello);
		String hello = objectHello.getHello();
		char[] array = objectArray.getArray();
		for(int i=0; i<hello.length();i++) {
			assertEquals(hello.charAt(i),array[i]);
		}
		
	}
}
