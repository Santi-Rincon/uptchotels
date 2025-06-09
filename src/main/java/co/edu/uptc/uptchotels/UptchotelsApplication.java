package co.edu.uptc.uptchotels;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class UptchotelsApplication {

	public static void main(String[] args) {
		SpringApplication.run(UptchotelsApplication.class, args);
	}

	

}
