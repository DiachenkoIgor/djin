package pac;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * Created by 1 on 23.05.2017.
 */
@Configurable
@EnableWebSecurity

public class SecurityConfig extends WebSecurityConfigurerAdapter{

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    public void registerGlobalAuthentication(AuthenticationManagerBuilder auth) throws Exception
    {
        auth
                .userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/regist").permitAll()

                .antMatchers("/entry").permitAll()
                .antMatchers("/registr").permitAll()
                .antMatchers("/check/{number}").permitAll()
                .antMatchers("/choose").permitAll()
                .antMatchers("/chooseFor").permitAll()
                .and()
                .exceptionHandling().accessDeniedPage("/pidr")
                .and()
                 .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/entry")
                .failureUrl("/login/spring")
                .usernameParameter("email")
                .passwordParameter("password")
                .defaultSuccessUrl("/Profile")
                .permitAll()
                .and()

                .logout()
                .permitAll()
                .logoutUrl("/exit")
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true);
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new PasswordEncoder() {
            @Override
            public String encode(CharSequence charSequence) {
                return charSequence.toString();
            }

            @Override
            public boolean matches(CharSequence charSequence, String s) {
                return charSequence != null && charSequence.toString().equals(s);
            }
        };
    }





}
