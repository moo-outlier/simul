package cmmcloud.config.database.config;

import cmmcloud.config.database.annotations.Master;
import javax.sql.DataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
@MapperScan(basePackages = "cbm", annotationClass = Master.class
    , sqlSessionFactoryRef = "masterSqlSessionFactory")
public class MasterDatabaseConfig {

  @Bean(name = "masterDataSource")
  @ConfigurationProperties(prefix = "spring.master.datasource")
  @Primary
  public DataSource masterDataSource() {
    return DataSourceBuilder.create().build();
  }

  @Bean(name = "masterSqlSessionFactory")
  @Primary
  public SqlSessionFactory masterSqlSessionFactory(@Qualifier("masterDataSource") DataSource masterDataSource) throws Exception {
    return createSessionFactory(masterDataSource);
  }

  @Bean(name = "masterDataSource")
  @Primary
  public SqlSessionTemplate msaterSqlSessionTemplate(@Qualifier("masterSqlSessionFactory") SqlSessionFactory masterSqlSessionFactory) {
    return new SqlSessionTemplate(masterSqlSessionFactory);
  }

  private SqlSessionFactory createSessionFactory(DataSource masterDataSource) throws Exception{

    final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
    sessionFactory.setDataSource(masterDataSource);

    PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
    sessionFactory.setMapperLocations(resolver.getResources("classpath:mapper/**/*.xml"));

    Resource myBatisConfig = new PathMatchingResourcePatternResolver().getResource(
        "classpath:/mybatis-config.xml");
    sessionFactory.setConfigLocation(myBatisConfig);

    return sessionFactory.getObject();
  }
}
