package com.kh.prj.common;

import org.springframework.stereotype.Service;

import com.kh.prj.common.util.PasswordGenerator;


@Service
public class PasswordGeneratorSVC {


	public String geneterPassword(int passwordLength) {
		PasswordGenerator passwordGenerator 
			= new PasswordGenerator.PasswordGeneratorBuilder()//
				.useDigits(true) 																// 숫자포함
				.useLower(true) 																// 소문자포함
				.useUpper(true) 																// 대문자포함
				.usePunctuation(true) 													// 특수문자포함
				.build();
		return passwordGenerator.generate(passwordLength); 	// 비밀번호 길이		
	}
}