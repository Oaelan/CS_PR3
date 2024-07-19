@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = "org.hj.mapper.pub", sqlSessionFactoryRef = "pubSqlSessionFactory")// 매퍼 인터페이스가 위치한 패키지 지정
public class DataSourceConfigPub {
	
	@Bean(name = "pubDataSource")
    @ConfigurationProperties(prefix = "pub.datasource")
    public DataSource subDataSource() {
        return DataSourceBuilder.create().type(HikariDataSource.class).build();
    }

    @Bean(name = "pubSqlSessionFactory")
    public SqlSessionFactory subSqlSessionFactory(@Qualifier("pubDataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:org/hj/mapper/pub/*Mapper.xml"));
        return sessionFactory.getObject();
    }

    @Bean(name = "pubTransactionManager")
    public DataSourceTransactionManager subTransactionManager(@Qualifier("pubDataSource") DataSource dataSource) {
        return new DataSourceT	ransactionManager(dataSource);
    }
}
}
