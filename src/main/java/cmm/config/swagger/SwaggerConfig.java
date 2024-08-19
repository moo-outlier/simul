package cmm.config.swagger;

import static springfox.documentation.builders.PathSelectors.regex;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.util.ReflectionUtils;
import org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.AuthorizationScope;
import springfox.documentation.service.SecurityReference;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.spring.web.plugins.WebFluxRequestHandlerProvider;
import springfox.documentation.spring.web.plugins.WebMvcRequestHandlerProvider;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@Profile({"!prod"})
@EnableSwagger2
public class SwaggerConfig {

  @Bean
  public Docket allUserApi() {
    return new Docket(DocumentationType.SWAGGER_2)
        .groupName("AllUser")
        .consumes(getConsumeContentTypes())
        .produces(getProduceContentTypes())
        .apiInfo(apiInfo())
        .securityContexts(Arrays.asList(securityContext()))    // 전역 auth 설정을 위한 추가
        .securitySchemes(Arrays.asList(apiKey()))              // 전역 auth 설정을 위한 추가
        .useDefaultResponseMessages(false)
        .select()
        .apis(RequestHandlerSelectors.basePackage("cbm"))
        .paths(regex("/(test)/.*"))
        .build();
  }

  // Actuator와 Swagger 충돌 오류로 인한 springfoxHandlerProvider 추가
  // Swagger는 모든 endpoint에 대해 문서를 작성하는 기능이지만,
  // Actuator 또한 endpoint를 직접 생성하는 역할이다보니 충돌하게 됨
  @Bean
  public BeanPostProcessor springfoxHandlerProviderBeanPostProcessor() {
    return new BeanPostProcessor() {
      @Override
      public Object postProcessAfterInitialization(Object bean, String beanName)
          throws BeansException {
        if (bean instanceof WebMvcRequestHandlerProvider || bean instanceof WebFluxRequestHandlerProvider) {
          customizeSpringfoxHandlerMappings(getHandlerMappings(bean));
        }
        return bean;
      }

      private <T extends RequestMappingInfoHandlerMapping> void customizeSpringfoxHandlerMappings(List<T> mappings) {
        List<T> copy = mappings.stream()
            .filter(mapping -> mapping.getPatternParser() == null)
            .collect(Collectors.toList());
        mappings.clear();
        mappings.addAll(copy);
      }

      @SuppressWarnings("unchecked")
      private List<RequestMappingInfoHandlerMapping> getHandlerMappings(Object bean) {
        try {
          Field field = ReflectionUtils.findField(bean.getClass(), "handlerMappings");
          field.setAccessible(true);
          return (List<RequestMappingInfoHandlerMapping>) field.get(bean);
        } catch (IllegalArgumentException | IllegalAccessException e) {
          throw new IllegalStateException(e);
        }
      }
    };
  }

  private Set<String> getConsumeContentTypes() {
    Set<String> consumes = new HashSet<>();
    consumes.add("application/json;charset=UTF-8");
    consumes.add("application/x-www-form-urlencoded");
    return consumes;
  }

  private Set<String> getProduceContentTypes() {
    Set<String> produces = new HashSet<>();
    produces.add("application/json;charset=UTF-8");
    return produces;
  }

  private ApiInfo apiInfo() {
    return new ApiInfoBuilder()
        .title("GoPos Backend API")
        .description("GoPos Backend API Document")
        .version("1.0")
        .build();
  }

  // Swagger 전역에 JWT token값 세팅을 위해 추가 ->
  // "X-AUTH-TOKEN" 명으로 받아서 세팅하기때문에 "X-AUTH-TOKEN" 명 주의
  private ApiKey apiKey() {
    return new ApiKey("JWT", "X-AUTH-TOKEN", "header");
  }

  private SecurityContext securityContext() {
    return SecurityContext
        .builder()
        .securityReferences(defaultAuth()).forPaths(PathSelectors.any()).build();
  }

  private List<SecurityReference> defaultAuth() {
    AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
    AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
    authorizationScopes[0] = authorizationScope;
    return Arrays.asList(new SecurityReference("JWT", authorizationScopes));
  }

}