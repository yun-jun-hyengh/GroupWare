package com.team.groupware;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@MapperScan(value= {"com.team.groupware.mapper"})
@SpringBootApplication
public class GroupWareApplication {

	public static void main(String[] args) {
		SpringApplication.run(GroupWareApplication.class, args);
	}
	
}
