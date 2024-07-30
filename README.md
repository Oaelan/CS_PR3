이번 프로젝트에서는 저희 팀은 공급사 입장에서의 수주/출하 시스템을 만들었습니다.
다른 팀에서는 발주, 입고 시스템을 만들어 주셨습니다.
그렇기 때문에 데이터적으로 겹치는 부분들이 많았기 때문에 개별 DB / 공용 DB를 만들어 사용하였습니다.
DB 2개를 연결하는 작업은

✔ root-context.xml 파일에서 2개의 DB에 대한 설정 및 MyBatis 관련 설정도 해준다.
<!-- 공급사 DB -->
	<bean id="hikariConfig1" class="com.zaxxer.hikari.HikariConfig">
		<property name="driverClassName" value="com.mysql.cj.jdbc.Driver" />
		<property name="jdbcUrl" value="jdbc:mysql://주소/Supplier?serverTimezone=Asia/Seoul" />
		<property name="username" value="" />
		<property name="password" value="" />
	</bean>

	<bean id="subDataSource" class="com.zaxxer.hikari.HikariDataSource" destroy-method="close">
		<constructor-arg ref="hikariConfig1" />
	</bean>

	<!-- 공통 DB -->
	<bean id="hikariConfig2" class="com.zaxxer.hikari.HikariConfig">
		<property name="driverClassName" value="com.mysql.cj.jdbc.Driver" />
		<property name="jdbcUrl" value="jdbc:mysql://주소/public_schema?serverTimezone=Asia/Seoul" />
		<property name="username" value="" />
		<property name="password" value="" />
	</bean>

	<bean id="pubDataSource" class="com.zaxxer.hikari.HikariDataSource" destroy-method="close">
		<constructor-arg ref="hikariConfig2" />
	</bean>

	
	<!-- MyBatis 관련 설정 SessionFactory -->
	<bean id="subSqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean" primary="true">
    <property name="dataSource" ref="subDataSource" />
	</bean>

	<bean id="pubSqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean" >
    <property name="dataSource" ref="pubDataSource" />
	</bean>
 
✔ DataSourceConfig.java 파일을 만들어 각 DB에 맞는 설정을 해준다.
    매퍼 인터페이스가 위치한 패키지를 지정한 경로와 매퍼 인터페이스가 실제로 위치한 경로가 같아야 인식을 함
    그리고 매퍼.xml 경로도 여기서 설정한 것과 같아야함

DataSourceConfigPub.java  // 공용 테이블
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

DataSourceConfigSub.java // 공급사 전용 테이블
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

✔ 매퍼.xml 파일에서는 이런식으로 사용함
<select id="addPno"
		parameterType="org.hj.model.Product_manufacturingDto" resultType="int">
		select p_no from Supplier.productCode <!-- DB명.테이블명 -->
		where p_name = #{p_name};
</select>

-----------------------------------------------------------------------------------
✔ 프로젝트 관련 DB 

Supplier DB (공급사 전용 DB)

  - 물류 창고 온도 테이블
  CREATE TABLE `Factory_temp` (
`now_temp` double NOT NULL,
`time` datetime DEFAULT current_timestamp(),
`state` varchar(255) DEFAULT NULL
)

  - 관리자 테이블
  CREATE TABLE `Master` (
  `m_id` varchar(20) NOT NULL,
  `m_pw` varchar(20) NOT NULL,
  PRIMARY KEY (`m_id`
)

  - 상품 테이블
CREATE TABLE `productCode` (
`p_name` varchar(255) DEFAULT NULL,
`p_no` int(11) NOT NULL AUTO_INCREMENT,
`p_price` int(11) DEFAULT NULL,PRIMARY KEY (`p_no`
)

----------------------------------------------------


public_schema DB (수요자 전용 DB)

- 유저 테이블
CREATE TABLE `User` (
   `u_id` varchar(20) NOT NULL,
   `u_name` varchar(20) NOT NULL,
   `u_pw` varchar(20) NOT NULL,
   `u_email` varchar(50) NOT NULL,
   `u_address` varchar(50) NOT NULL,
   `u_no` varchar(10) NOT NULL,
   PRIMARY KEY (`u_id`)
 )
 - 상품 재고 테이블
 Product_manufacturing	CREATE TABLE `Product_manufacturing` (
   `m_date` date NOT NULL,
   `p_no` int(11) NOT NULL,
   `p_name` varchar(20) NOT NULL,
   `p_price` int(11) NOT NULL,
   `m_num` int(11) NOT NULL,
   `p_limitD` date NOT NULL
)
- 주문 테이블
OrderList	CREATE TABLE `OrderList` (
   `o_no` varchar(20) NOT NULL,
   `o_id` varchar(20) NOT NULL,
   `o_address` varchar(255) NOT NULL,
   `p_no` int(11) NOT NULL,
   `o_num` int(11) NOT NULL,
   `o_Total` varchar(20) NOT NULL,
   `o_date` date NOT NULL,
   `o_permit` tinyint(1) NULL
  )

- 배송 테이블
  Medicode_Tracking	CREATE TABLE `Medicode_Tracking` (
   `d_no` int(11) NOT NULL,
   `dep_time` timestamp NULL DEFAULT current_timestamp(),
   `hub_arr` timestamp NULL DEFAULT NULL,
   `hub_dep` timestamp NULL DEFAULT NULL,
   `del_comp` timestamp NULL DEFAULT NULL,
   `hub_name...
)

- 배송 위치 테이블
Delivery_GPS	CREATE TABLE `Delivery_GPS` (
   `d_no` int(11) NOT NULL AUTO_INCREMENT,
   `o_no` varchar(20) NOT NULL,
   `o_id` varchar(20) NOT NULL,
   `o_address` varchar(255) NOT NULL,
   `x` double DEFAULT NULL,
   `y` double DEFAULT NULL,
   `d_complete` tinyint(1) DEF...
  )
