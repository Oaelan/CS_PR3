@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = "org.hj.mapper.sub", sqlSessionFactoryRef = "subSqlSessionFactory")// 매퍼 인터페이스가 위치한 패키지 지정
public class DataSourceConfigSub {

    @Primary
    @Bean(name = "subDataSource")
    @ConfigurationProperties(prefix = "sub.datasource")
   
    public DataSource primaryDataSource() {
        return DataSourceBuilder.create().type(HikariDataSource.class).build();
    }

    @Primary
    @Bean(name = "subSqlSessionFactory")
    public SqlSessionFactory primarySqlSessionFactory(@Qualifier("subDataSource") DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:org/hj/mapper/sub/*Mapper.xml"));
        return sessionFactory.getObject();
    }

    @Primary
    @Bean(name = "subTransactionManager")
    public DataSourceTransactionManager primaryTransactionManager(@Qualifier("subDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }
}
