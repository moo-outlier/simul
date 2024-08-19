package cmm.config.cache;

import java.util.Arrays;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCache;
import org.springframework.cache.support.SimpleCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@EnableCaching
@Configuration
public class CacheConfig {

  @Bean
  public CacheManager cacheManager() {

    SimpleCacheManager simpleCacheManager = new SimpleCacheManager();

    simpleCacheManager.setCaches(
        Arrays.asList(
            new ConcurrentMapCache("SeoulWeather"),
            new ConcurrentMapCache("DaeguWeather"),
            new ConcurrentMapCache("BuasnWeather"),
            new ConcurrentMapCache("GwangjuWeather"),
            new ConcurrentMapCache("DaejeonWeather"),
            new ConcurrentMapCache("JeonjuWeather"),
            new ConcurrentMapCache("WonjuWeather"),
            new ConcurrentMapCache("CheongjuWeather"),
            new ConcurrentMapCache("ChungjuWeather"),
            new ConcurrentMapCache("PohangWeather"),
            new ConcurrentMapCache("SuwonWeather"),
            new ConcurrentMapCache("GimhaeWeather"),
            new ConcurrentMapCache("IncheonWeather"),
            new ConcurrentMapCache("UlsanWeather"),
            new ConcurrentMapCache("ChangwonWeather"),
            new ConcurrentMapCache("CheonanWeather"),
            new ConcurrentMapCache("ChuncheonWeather"),
            new ConcurrentMapCache("JejuWeather"),
            new ConcurrentMapCache("YeosuWeather"),
            new ConcurrentMapCache("JinjuWeather"),
            new ConcurrentMapCache("SuncheonWeather"),
            new ConcurrentMapCache("MasanWeather"),
            new ConcurrentMapCache("GunsanWeather"),
            new ConcurrentMapCache("MokpoWeather"),
            new ConcurrentMapCache("GumiWeather")
        ));

    return simpleCacheManager;
  }

}
