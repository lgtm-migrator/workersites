/*
 * Copyright 2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.baker.social.account;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class JdbcAccountRepository implements AccountRepository {

	private  JdbcTemplate jdbcTemplate;

	private  PasswordEncoder passwordEncoder;
	
	JdbcAccountRepository() {}
	
	@Inject
	public JdbcAccountRepository(JdbcTemplate jdbcTemplate, PasswordEncoder passwordEncoder) {
		this.jdbcTemplate = jdbcTemplate;
		this.passwordEncoder = passwordEncoder;
	}

	@Transactional
	public void createAccount(Account user) throws UsernameAlreadyInUseException {
		try {
			jdbcTemplate.update(
					"insert into Account (email, password, firstName, lastName, gender, maidenname) values (?, ?, ?, ?)",
				 user.getEmail(), passwordEncoder.encode(user.getPassword()), user.getFirstName(), user.getLastName(), user.getGender(), user.getMaidenName()
			);
		} catch (DuplicateKeyException e) {
			throw new UsernameAlreadyInUseException(user.getEmail());
		}
	}

	public Account findAccountByUsername(String email) {
		return jdbcTemplate.queryForObject("select email, firstName, lastName from Account where email = ?",
				new RowMapper<Account>() {
					public Account mapRow(ResultSet rs, int rowNum) throws SQLException {
						return new Account(rs.getString("email"), null, rs.getString("fistName"), rs
								.getString("lastName"), rs.getString("gender"), rs.getString("maindenname"));
					}
				}, email);
	}

}
