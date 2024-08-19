package cmmcloud.config.database.config;

import cmmcloud.config.database.annotations.Slave;
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
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
@MapperScan(basePackages = "cbm", annotationClass = Slave.class
    , sqlSessionFactoryRef = "slaveSqlSessionFactory")
public class SlaveDatabaseConfig {

  @Bean(name = "slaveDataSource")
  @ConfigurationProperties(prefix = "spring.slave.datasource")
  public DataSource slaveDataSource() {
    return DataSourceBuilder.create().build();
  }

  @Bean(name = "slaveSqlSessionFactory")
  public SqlSessionFactory slaveSqlSessionFactory(@Qualifier("slaveDataSource") DataSource slaveDataSource) throws Exception {
    return createSessionFactory(slaveDataSource);

  }

  @Bean(name = "slaveDataSource")
  public SqlSessionTemplate slaveSqlSessionTemplate(@Qualifier("slaveSqlSessionFactory") SqlSessionFactory slaveSqlSessionFactory) {
    return new SqlSessionTemplate(slaveSqlSessionFactory);
  }

  private SqlSessionFactory createSessionFactory(DataSource slaveDataSource) throws Exception{

    final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
    sessionFactory.setDataSource(slaveDataSource);

    PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
    sessionFactory.setMapperLocations(resolver.getResources("classpath:mapper/**/*.xml"));

    Resource myBatisConfig = new PathMatchingResourcePatternResolver().getResource(
        "classpath:/mybatis-config.xml");
    sessionFactory.setConfigLocation(myBatisConfig);

    return sessionFactory.getObject();
  }
}
