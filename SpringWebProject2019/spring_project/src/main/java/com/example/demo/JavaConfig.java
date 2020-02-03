package com.example.demo;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

import dao.*;
@Configuration
public class JavaConfig {
	
	@Bean(destroyMethod="close")
	public DataSource dataSource() {
		DataSource ds = new DataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost/spring_project?characterEncoding=utf8&serverTimezone=UTC");
		ds.setUsername("root");
		ds.setPassword("1234");
		return ds;
	}
	
	@Bean
	public AssignmentDao assignmentDao() {
		return new AssignmentDao(dataSource());
	}
	
	@Bean
	public LectureDao lectureDao() {
		return new LectureDao(dataSource());
	}
	
	@Bean
	public NoteDao noteDao() {
		return new NoteDao(dataSource());
	}
	
	@Bean
	public StudentDao studentDao() {
	   return new StudentDao(dataSource());
	}
	   
	@Bean
	public RegisterDao registerDao() {
		return new RegisterDao(dataSource());
	}
}