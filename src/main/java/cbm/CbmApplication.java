package cbm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication(scanBasePackages = {"cbm", "cmm", "cmmcloud"})
@EnableScheduling
public class CbmApplication {

  public static void main(String[] args) {
    SpringApplication.run(CbmApplication.class, args);
  }

}
