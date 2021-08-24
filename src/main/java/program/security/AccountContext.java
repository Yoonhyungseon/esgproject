package program.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class AccountContext extends User {
	
	private final Account account;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public AccountContext(Account account, Collection<? extends GrantedAuthority> authorities) {
        super(account.getUsername(), account.getPassword(), authorities);
        this.account = account;
    }
	
	public Account getAccount() {
        return account;
    }
}
