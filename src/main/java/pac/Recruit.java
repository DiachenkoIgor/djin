package pac;

import javax.persistence.*;
import java.util.Arrays;

/**
 * Created by 1 on 10.05.2017.
 */
@Entity
@Table(name = "Recruits")
public class Recruit implements IUser{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(nullable = false)
    private String password;
    //Публікувати чи ні
    private boolean isView;
    @Enumerated(EnumType.STRING)
    private User_Role role;
    // Опублікований чи ні
    private boolean isPublished;
    private String position;
    private int salary;
    private String city;
    private String expirience;
    private double workExperience;
    private String category;
    private String additionalCategor;
    /*
    0-Нет английского
    1-Слабый английский (Pre-Intermediate)
    2-На уровне чтения тех. документации (Intermediate)
    3-Пишу и говорю, хоть и с ошибками (Upper Intermediate)
    4-Свободный английский (Advanced/Fluent)
    */
    private byte english;
    private boolean workInOffice;
    private boolean remoteWork;
    private boolean freelance;
    private boolean removal;
    private  boolean relocate;
    private String expectations;
    private String achievement;
    private String name;
    @Lob
    @Column(columnDefinition="LONGBLOB")
    private byte[] photo;
    @Column(nullable = false)
    private String email;
    private String skype;
    private String number;
    private String LinkedIn;
    private String gitHub;
    @Lob
    @Column(columnDefinition="LONGBLOB")
    private byte[] resume;
    private String stopList;
    //Пропозиції !!!!!!!!!!!!!!!!!!!!!!!
    private int counter;
    private int firstPage;
    private String cvName;
    private boolean distribution;


    public Recruit() {
    }

    public Recruit(boolean isView, String position, int salary, String city, String expirience, double workExperience, String category, String additionalCategor, byte english, boolean workInOffice, boolean remoteWork, boolean freelance, boolean removal, boolean relocate, String expectations, String achievement) {
        this.isView=isView;
        this.position = position;
        this.salary = salary;
        this.city = city;
        this.expirience = expirience;
        this.workExperience = workExperience;
        this.category = category;
        this.additionalCategor = additionalCategor;
        this.english = english;
        this.workInOffice = workInOffice;
        this.remoteWork = remoteWork;
        this.freelance = freelance;
        this.removal = removal;
        this.relocate = relocate;
        this.expectations = expectations;
        this.achievement = achievement;

    }

    public Recruit(String email,String password) {
        this.password=password;
        this.email = email;
        this.isPublished=false;
        this.isView=false;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getExpirience() {
        return expirience;
    }

    public void setExpirience(String expirience) {
        this.expirience = expirience;
    }

    public double getWorkExperience() {
        return workExperience;
    }

    public void setWorkExperience(double workExperience) {
        this.workExperience = workExperience;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAdditionalCategor() {
        return additionalCategor;
    }

    public void setAdditionalCategor(String additionalCategor) {
        this.additionalCategor = additionalCategor;
    }

    public byte getEnglish() {
        return english;
    }

    public void setEnglish(byte english) {
        this.english = english;
    }

    public boolean isWorkInOffice() {
        return workInOffice;
    }

    public void setWorkInOffice(boolean workInOffice) {
        this.workInOffice = workInOffice;
    }

    public boolean isRemoteWork() {
        return remoteWork;
    }

    public void setRemoteWork(boolean remoteWork) {
        this.remoteWork = remoteWork;
    }

    public boolean isFreelance() {
        return freelance;
    }

    public void setFreelance(boolean freelance) {
        this.freelance = freelance;
    }

    public boolean isRemoval() {
        return removal;
    }

    public void setRemoval(boolean removal) {
        this.removal = removal;
    }

    public boolean isRelocate() {
        return relocate;
    }

    public void setRelocate(boolean relocate) {
        this.relocate = relocate;
    }

    public String getExpectations() {
        return expectations;
    }

    public void setExpectations(String expectations) {
        this.expectations = expectations;
    }

    public String getAchievement() {
        return achievement;
    }

    public void setAchievement(String achievement) {
        this.achievement = achievement;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSkype() {
        return skype;
    }

    public void setSkype(String skype) {
        this.skype = skype;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getLinkedIn() {
        return LinkedIn;
    }

    public void setLinkedIn(String linkedIn) {
        LinkedIn = linkedIn;
    }

    public String getGitHub() {
        return gitHub;
    }

    public void setGitHub(String gitHub) {
        this.gitHub = gitHub;
    }

    public byte[] getResume() {
        return resume;
    }

    public void setResume(byte[] resume) {
        this.resume = resume;
    }

    public String getstopList() {
        return stopList;
    }

    public void setStopList(String stopList) {
        this.stopList = stopList;
    }

    public int getCounter() {
        return counter;
    }

    public void setCounter(int counter) {
        this.counter = counter;
    }

    public int getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }

    public boolean isView() {
        return isView;
    }

    public void setView(boolean view) {
        isView = view;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean getisPublished() {
        return isPublished;
    }

    public void setPublished(boolean published) {
        isPublished = published;
    }

    @Override
    public User_Role getRole() {
        return role;
    }

    public void setRole(User_Role role) {
        this.role = role;
    }

    public String getCvName() {
        return cvName;
    }

    public void setCvName(String cvName) {
        this.cvName = cvName;
    }

    public boolean getisDistribution() {
        return distribution;
    }

    public void setDistribution(boolean distribution) {
        this.distribution = distribution;
    }

    @Override
    public String toString() {
        return "Recruit{" +
                "password='" + password + '\'' +
                ", isView=" + isView +
                ", position='" + position + '\'' +
                ", salary=" + salary +
                ", city='" + city + '\'' +
                ", expirience='" + expirience + '\'' +
                ", workExperience=" + workExperience +
                ", category='" + category + '\'' +
                ", additionalCategor='" + additionalCategor + '\'' +
                ", english=" + english +
                ", workInOffice=" + workInOffice +
                ", remoteWork=" + remoteWork +
                ", freelance=" + freelance +
                ", removal=" + removal +
                ", relocate=" + relocate +
                ", expectations='" + expectations + '\'' +
                ", achievement='" + achievement + '\'' +
                ", name='" + name + '\'' +

                ", email='" + email + '\'' +
                ", skype='" + skype + '\'' +
                ", number='" + number + '\'' +
                ", LinkedIn='" + LinkedIn + '\'' +
                ", gitHub='" + gitHub + '\'' +
                ", resume=" + Arrays.toString(resume) +
                ", stopList=" + stopList +
                ", counter=" + counter +
                ", firstPage=" + firstPage +
                '}';
    }

}
