package com.wimk.secure;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.wimk.entity.Parent;
import com.wimk.service.ParentService;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private ParentService parentService;

	public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
		Parent parent = parentService.getByLogin(login);

		if (parent == null){
			return null;
		}

		Set<GrantedAuthority> roles = new HashSet<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));

		UserDetails userDetails = new org.springframework.security.core.userdetails.User(parent.getLogin(),
				parent.getPassword(), roles);
		return userDetails;
	}

}
