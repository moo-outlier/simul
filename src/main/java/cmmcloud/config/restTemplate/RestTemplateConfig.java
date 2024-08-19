package cmmcloud.config.restTemplate;

import java.nio.charset.Charset;
import java.time.Duration;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.BufferingClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;

@Configuration
public class RestTemplateConfig {

  @Bean
  HttpClient httpClient() {
    return HttpClientBuilder.create()
//        .setMaxConnTotal(100)    //최대 오픈되는 커넥션 수, 연결을 유지할 최대 숫자
//        .setMaxConnPerRoute(30)   //IP, 포트 1쌍에 대해 수행할 커넥션 수, 특정 경로당 최대 숫자
        .build();
  }

  @Bean
  public HttpComponentsClientHttpRequestFactory factory(HttpClient httpClient) {
    HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
    factory.setHttpClient(httpClient);
    return factory;
  }

  @Bean
  public RestTemplate restTemplate(RestTemplateBuilder restTemplateBuilder){

    return restTemplateBuilder
        .requestFactory(() -> new HttpComponentsClientHttpRequestFactory())
        .setConnectTimeout(Duration.ofMillis(5000))
        .setReadTimeout(Duration.ofMillis(5000))
        .additionalMessageConverters(new StringHttpMessageConverter(Charset.forName("UTF-8")))
        .build();
  }
}
