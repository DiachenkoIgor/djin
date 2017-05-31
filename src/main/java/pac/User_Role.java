package pac;

/**
 * Created by 1 on 10.05.2017.
 */
public enum User_Role {
    Recruit,Employer,Admin;

    @Override
    public String toString() {
        return "Role_"+name();
    }
}
