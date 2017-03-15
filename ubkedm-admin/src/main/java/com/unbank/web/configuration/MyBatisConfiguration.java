package com.unbank.web.configuration;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@ComponentScan({ "com.unbank.web.configuration" })
@PropertySource(value = { "classpath:application.properties" })
@MapperScan({ "com.unbank.mybatis.mapper" })
public class MyBatisConfiguration {



}
