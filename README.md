이번 프로젝트에서는 저희 팀은 공급사 입장에서의 수주/출하 시스템을 만들었습니다.
다른 팀에서는 발주, 입고 시스템을 만들어 주셨습니다.
그렇기 때문에 데이터적으로 겹치는 부분들이 많았기 때문에 개별 DB / 공용 DB를 만들어 사용하였습니다.
DB 2개를 연결하는 작업은

✔ root-context.xml 파일에서 2개의 DB에 대한 설정 및 MyBatis 관련 설정도 해준다.
```xml
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
 ```
✔ DataSourceConfig.java 파일을 만들어 각 DB에 맞는 설정을 해준다.
    매퍼 인터페이스가 위치한 패키지를 지정한 경로와 매퍼 인터페이스가 실제로 위치한 경로가 같아야 인식을 함
    그리고 매퍼.xml 경로도 여기서 설정한 것과 같아야함
```java
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
```
✔ 매퍼.xml 파일에서는 이런식으로 사용함
```xml
<select id="addPno"
		parameterType="org.hj.model.Product_manufacturingDto" resultType="int">
		select p_no from Supplier.productCode <!-- DB명.테이블명 -->
		where p_name = #{p_name};
</select>
```
-----------------------------------------------------------------------------------
✔ 프로젝트 관련 DB 

Supplier DB (공급사 전용 DB)

  - 물류 창고 온도 테이블
    
<details><summary>SQL Factory_temp 테이블 생성문
</summary>

CREATE TABLE `Factory_temp` (
`now_temp` double NOT NULL,
`time` datetime DEFAULT current_timestamp(),
`state` varchar(255) DEFAULT NULL
)
</details>   
  

| now_temp | time | state |
| --- | --- | --- |
| double | datetime | varchar(255) |


  - 관리자 테이블
<details><summary>SQL Master 테이블 생성문
</summary>

CREATE TABLE `Master` (
  `m_id` varchar(20) NOT NULL,
  `m_pw` varchar(20) NOT NULL,
  PRIMARY KEY (`m_id`
)
</details>  
    
  

| m_id | m_pw |
| --- | --- |
| varchar(20) | varchar(20) |


  - 상품 테이블
<details><summary>SQL productCode 테이블 생성문
</summary>
	
CREATE TABLE `productCode` (
`p_name` varchar(255) DEFAULT NULL,
`p_no` int(11) NOT NULL AUTO_INCREMENT,
`p_price` int(11) DEFAULT NULL,PRIMARY KEY (`p_no`
)

</details>      


| p_name | p_no | p_price |
| --- | --- | --- |
| varchar(255) | int(11) | int(11) |

----------------------------------------------------


public_schema DB (수요자 전용 DB)

- 유저 테이블
<details><summary>SQL User 테이블 생성문
</summary>

CREATE TABLE `User` (
   `u_id` varchar(20) NOT NULL,
   `u_name` varchar(20) NOT NULL,
   `u_pw` varchar(20) NOT NULL,
   `u_email` varchar(50) NOT NULL,
   `u_address` varchar(50) NOT NULL,
   `u_no` varchar(10) NOT NULL,
   PRIMARY KEY (`u_id`)
  )

</details>   

  
| u_id | u_name | u_pw | u_email | u_address | u_no |
| --- | --- | --- | --- | --- | --- |
| varchar(20) | varchar(20) | varchar(20) | varchar(50) | varchar(50) | varchar(10) |


 - 상품 재고 테이블
 <details><summary>SQL Product_manufacturing 테이블 생성문
</summary>

CREATE TABLE `Product_manufacturing` (
   `m_date` date NOT NULL,
   `p_no` int(11) NOT NULL,
   `p_name` varchar(20) NOT NULL,
   `p_price` int(11) NOT NULL,
   `m_num` int(11) NOT NULL,
   `p_limitD` date NOT NULL
)

</details>   
 

| m_date | p_no | p_name | p_price | m_num | p_limitD |
| --- | --- | --- | --- | --- | --- |
| date | int(11) | varchar(20) | int(11) | int(11) | date |


- 주문 테이블
<details><summary>SQL OrderList 테이블 생성문
</summary>
CREATE TABLE `OrderList` (
   `o_no` varchar(20) NOT NULL,
   `o_id` varchar(20) NOT NULL,
   `o_address` varchar(255) NOT NULL,
   `p_no` int(11) NOT NULL,
   `o_num` int(11) NOT NULL,
   `o_Total` varchar(20) NOT NULL,
   `o_date` date NOT NULL,
   `o_permit` tinyint(1) NULL
  )

</details>   

  
| o_no | o_id | o_address | p_no | o_num | o_Total | o_date | o_permit |
| --- | --- | --- | --- | --- | --- | --- | --- |
| varchar(20) | varchar(20) | varchar(255) | int(11) | int(11) | varchar(20) | date | tinyint(1) |



- 배송 테이블
<details><summary>SQL Medicode_Tracking 테이블 생성문
</summary>

CREATE TABLE `Medicode_Tracking` (
   `d_no` int(11) NOT NULL,
   `dep_time` timestamp NULL DEFAULT current_timestamp(),
   `hub_arr` timestamp NULL DEFAULT NULL,
   `hub_dep` timestamp NULL DEFAULT NULL,
   `del_comp` timestamp NULL DEFAULT NULL,
   `hub_name...
)

</details>   
  

- 배송 위치 테이블
<details><summary> SQL Delivery_GPS 테이블 생성문
</summary>

CREATE TABLE `Delivery_GPS` (
   `d_no` int(11) NOT NULL AUTO_INCREMENT,
   `o_no` varchar(20) NOT NULL,
   `o_id` varchar(20) NOT NULL,
   `o_address` varchar(255) NOT NULL,
   `x` double DEFAULT NULL,
   `y` double DEFAULT NULL,
   `d_complete` tinyint(1) DEF...
  )

</details> 

  
| d_no | o_no | o_id | o_address | x | y | d_complete |
| --- | --- | --- | --- | --- | --- | --- |
| int(11) | varchar(20) | varchar(20) | varchar(255) | double | double | tinyint(1) |


--------------------------------------------------------------------


##구현한 페이지들


✨ 제품 등록 페이지

![image](https://github.com/user-attachments/assets/04ee983d-920c-439f-9782-5c4b796f59ec)

- 재고 관리 기능 추가 (재고 추가 / 수정 / 폐기)
- 재고 검색 기능 추가 (제품코드 또는 제품명으로 검색 가능 / 재고 목록을 누르면 전체 재고 리스트 다시 나옴)
- 상품 등록 기능 추가 (품명, 단가 만 입력하면 제품 코드는 자동으로 생김(autoincrement))
- 온도 관련 기능 추가 (물류 창고 데이터 가져오기/현재 창고 온도에 따라 생기는 토스트창 구현)




  
✨ 수주 내역 페이지

![image](https://github.com/user-attachments/assets/74bc79a0-77d9-4d1a-93cc-ec4f2c582958)

- 수주 내역 조회 기능(수주 들어온 날짜 정렬기능, 수주 상태 필터 기능 추가)
- 상세 주문 내역 확인 modal(클릭으로 띄움)
- 수주 수락, 거절 기능(수락, 거절에 따른 데이터 변경)




  
✨ 출하 관리 페이지

![image](https://github.com/user-attachments/assets/367ba30b-aee0-4961-9280-04c4bc37ec84)
- 출하 상태에 따른 내역 확인
- 출하 시작 상태로 변경(배송 데이터로 값이 넘어감)




  
✨ 배송 상태 페이지

![image](https://github.com/user-attachments/assets/c2b04bf0-f4ca-423a-b141-816ce89d62d9)
- 전체 배송 내역 조회(클릭으로 확인)
- 배송 내역마다 위치 확인 기능
  


