package com.kh.prj.common.util;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class PropertiesEncryptor {
	public static void main(String[] args) {
		StandardPBEStringEncryptor enc = new StandardPBEStringEncryptor();
		// 암호키
		enc.setPassword("audtjd");

		// db암호화
		System.out.println(enc.encrypt("oracle.jdbc.OracleDriver"));
		System.out.println(enc.encrypt("jdbc:oracle:thin:@127.0.0.1:1521:orcl"));
		System.out.println(enc.encrypt("maker"));
		System.out.println(enc.encrypt("admin1234"));

		// mail암호화
		System.out.println(enc.encrypt(""));
		System.out.println(enc.encrypt(""));

		// 복호화
		System.out.println(enc.decrypt(""));
	}
}
