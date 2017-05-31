package pac;

/**
 * Created by 1 on 15.05.2017.
 */
public class Container {
    private String email;
    private String password;
    private long time;
    private long number;

    public Container(String email, String password, long time,long number) {
        this.email = email;
        this.password = password;
        this.time = time;
        this.number=number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }
}
