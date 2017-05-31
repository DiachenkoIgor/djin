package pac;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by 1 on 23.05.2017.
 */
@Service
public class UserDetailsServiceIml implements UserDetailsService {
    @Autowired
    RecruitInst recruitInst;


    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        IUser user=recruitInst.find(s);
        if(user==null)
        {
            throw new UsernameNotFoundException("not found");
        }
        Set<GrantedAuthority> roles=new HashSet<>();
        roles.add(new SimpleGrantedAuthority(user.getRole().toString()));
User r=new User(user.getEmail(),user.getPassword(),roles);
        return r;
    }
}
