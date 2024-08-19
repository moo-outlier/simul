package cbm;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.ThreadLocalRandom;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

//@SpringBootTest
@Slf4j
public class GoPosApplicationTests {

  @Test
  public void contextLoads() {
    LocalDate startDate = LocalDate.of(2024, 1, 1);
    LocalDate endDate = LocalDate.of(2024, 4, 17);

    long randomEpochDay = ThreadLocalRandom.current().nextLong(startDate.toEpochDay(), endDate.toEpochDay() + 1);
    LocalDate randomDate = LocalDate.ofEpochDay(randomEpochDay);

    // 랜덤한 시간 생성
    int hour = ThreadLocalRandom.current().nextInt(0, 24); // 0부터 23 사이의 랜덤한 시간
    int minute = ThreadLocalRandom.current().nextInt(0, 60); // 0부터 59 사이의 랜덤한 분
    int second = ThreadLocalRandom.current().nextInt(0, 60); // 0부터 59 사이의 랜덤한 초
    LocalTime randomTime = LocalTime.of(hour, minute, second);

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String formattedDateTime = randomDate.atTime(randomTime).format(formatter);
    log.info(formattedDateTime);
  }

}
