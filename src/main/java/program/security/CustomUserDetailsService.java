package program.security;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import program.admin.member.mapper.AdminMemberMapper;
import program.common.CamelMap;
import program.common.DataMap;

@Service("userDetailsService")
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private AdminMemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		Account account = mapper.getLoginInfo(username);
		
		if(account == null) {
			throw new UsernameNotFoundException("UsernameNotFoundException");
		}
		DataMap paramMap = new DataMap();
		paramMap.put("userSeq", account.getId());
		try {
		CamelMap cMap = mapper.selectMemberInfo(paramMap);
		cMap.put("userPwd", null);
		account.setDetail(cMap);
		}catch(SQLException se) {
			se.printStackTrace();
		}
		
		List<GrantedAuthority> roles = new ArrayList<>();
        roles.add(new SimpleGrantedAuthority(account.getRole()));

        AccountContext accountContext = new AccountContext(account,roles);

        return accountContext;
	}
	
}
