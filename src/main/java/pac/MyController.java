package pac;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import pac.Social.GoogleConnection;
import pac.Social.LinkedInConnection;
import pac.Social.LinkedInProfile;
import pac.Social.commonthing;


import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Random;


@Controller
public class MyController {
    @Autowired
    private RecruitInst intstument;
    @Autowired
    private UserDetailsServiceIml userDetailsServiceIml;



    public static ArrayList<Container> list =new ArrayList<Container>();
    private boolean a=false;
    private String ex="Введите корректное имя пользователя.\n" +
            "\n" +
            "Имя и пароль не совпадают. :(";

   /* @RequestMapping(name = "/", method = RequestMethod.GET)
    public String root(ModelAndView modelAndView, StringHttpMessageConverter stringHttpMessageConverter){
        System.out.println(stringHttpMessageConverter.getDefaultCharset());
        return "";
    }*/


   @RequestMapping("/auth/linkedin/callback")
   public String link(@RequestParam String code) throws Exception
   {
       Recruit recruit;
       try {


           recruit = LinkedInConnection.connectionLinkedIn(code);
       }catch (Exception r)
       {
           return "redirect:login";
       }
       Recruit t=intstument.find(recruit.getEmail());
       if(t ==null) {
           intstument.addRecruit(recruit);
           Authentication auth = new UsernamePasswordAuthenticationToken(userDetailsServiceIml.loadUserByUsername(recruit.getEmail()), null);
           SecurityContextHolder.getContext().setAuthentication(auth);
           return "redirect:/newProfile";
       }
       else
       {
           Authentication auth = new UsernamePasswordAuthenticationToken(userDetailsServiceIml.loadUserByUsername(t.getEmail()), null);
           SecurityContextHolder.getContext().setAuthentication(auth);
           return "redirect:/Profile";
       }


   }

   @RequestMapping("/auth/google/callback")
   public String googleLink(@RequestParam String code)
   {
       Recruit recruit;
       try {


           recruit = GoogleConnection.googleLogin(code);
       }catch (Exception r)
       {
           return "redirect:login";
       }
       Recruit t=intstument.find(recruit.getEmail());
       if(t ==null) {
           intstument.addRecruit(recruit);
           Authentication auth = new UsernamePasswordAuthenticationToken(userDetailsServiceIml.loadUserByUsername(recruit.getEmail()), null);
           SecurityContextHolder.getContext().setAuthentication(auth);
           return "redirect:/newProfile";
       }
       else
       {
           Authentication auth = new UsernamePasswordAuthenticationToken(userDetailsServiceIml.loadUserByUsername(t.getEmail()), null);
           SecurityContextHolder.getContext().setAuthentication(auth);
           return "redirect:/Profile";
       }
   }
    @RequestMapping("/")
    public String hello()
    {

return "HelloPage";
    }


    @RequestMapping("/login")
    public String login(Model model)
    {
        if(a)        {
            model.addAttribute("sentence",ex);
            a=false;
        }

        return "LogIn";
    }
    @RequestMapping("/login/spring")
    public String loginSpring(Model model)
    {

            model.addAttribute("sentence",ex);
            a=false;


        return "LogIn";
    }
    @RequestMapping("/entry")
    public String entry(@RequestParam String email,
                        @RequestParam String password,
                        Model model, HttpSession httpSession)
    {
        Recruit r=intstument.find(email);

        if(r==null)
        {
            a=true;
            return "redirect:login";

        }
        else
        {
Recruit p=intstument.find(email);
if(p.getPassword().equals(password))
{



    return "redirect:Profile";
}
else
{
    a=true;
    return "redirect:login";
}

        }


    }
    @RequestMapping("/choose")
    public String choo()
    {
        return "Choosing";
    }

    @RequestMapping("/profile")
    public String prof(@RequestParam String position,
                       @RequestParam int salary_min,
                       @RequestParam String location,
                       @RequestParam String moreinfo,
                       @RequestParam String primary_keyword_cache,
                       @RequestParam double experience,
                       @RequestParam String secondary_keyword,
                       @RequestParam byte english_level,
                       @RequestParam String employment_options[],
                       @RequestParam String looking_for,
                       @RequestParam String highlights,
                       @RequestParam(required = false) String save_only,
                       HttpSession httpSession,
                       Model model)
    {
        boolean workInOffice=false;
        boolean remoteWork=false;
        boolean freelance=false;
        boolean removal=false;
        boolean relocate=false;
 for(int i=0;i<employment_options.length;i++)
 {
     switch (employment_options[i])
     {
         case "fulltime":
             workInOffice=true;
             break;
         case "remote":
             remoteWork=true;
             break;
         case "freelance":
                 freelance=true;
             break;
         case  "move":
             removal =true;
             break;
         case "relocate":
             relocate=true;
             break;


     }

 }
 Recruit r;

     User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
     r=intstument.find(user.getUsername());



        r.setView(false);
        r.setPosition(position);
        r.setSalary(salary_min);
        r.setCity(location);
        r.setExpirience(moreinfo);
        r.setWorkExperience(experience);
        r.setCategory(primary_keyword_cache);
        r.setAdditionalCategor(secondary_keyword);
        r.setEnglish(english_level);
        r.setWorkInOffice(workInOffice);
        r.setRemoteWork(remoteWork);
        r.setFreelance(freelance);
        r.setRemoval(removal);
        r.setRelocate(relocate);
        r.setExpectations(looking_for);
        r.setAchievement(highlights);
        intstument.update(r);


model.addAttribute("show",true);
httpSession.setAttribute("show",true);
model.addAttribute("recruit",r);
        return "redirect:Profile";
    }
    @RequestMapping("/registr")
    public String reist()
    {
        return "registr";
    }
    @RequestMapping("/regist")
    public String reg(@RequestParam String password,
                      @RequestParam String email,
                      Model model)
    {
        Recruit r=intstument.find(email);

        if(r!=null)
        {
         model.addAttribute("sentence","Уже есть такой пользователь");
            return "registr";

        }
        for (Container l:list) {
            if(l.getEmail().equalsIgnoreCase(email))
            {
                model.addAttribute("sentence","Ожидает подтверждения почты");
                return "registr";

            }
        }

        Random p=new Random();

        long m=p.nextInt(1000)*100000;
Container c=new Container(email,password,System.currentTimeMillis(),m);
list.add(c);
String em="http://localhost:8080/check/"+m;
        Sender sender = new Sender("dioasgid@gmail.com", "vape_me_kiev");
        sender.send("vape", "Подтвердите почту: "+em, "dioasgid@gmail.com", email);
        model.addAttribute("sentence","Подтвердите почту");
        return "registr";

    }
    @RequestMapping(value = "/check/{number}",method = RequestMethod.GET)
    public String checker(@PathVariable("number") long id, Model model,HttpSession httpSession)
    {

        for(int i=0;i<list.size();i++)
        {
            if(list.get(i).getNumber()==id)
            {
                httpSession.setAttribute("Container",list.get(i));
                list.remove(i);
                return "redirect:/choose";
            }
        }
            return "pidrPage";
    }
    @RequestMapping("/chooseFor")
    public String chooseFor(HttpSession httpSession,@RequestParam String account_select)
    {
        if(account_select.equalsIgnoreCase("candidate"))
        {
            Container n=(Container) httpSession.getAttribute("Container");
            Recruit r=new Recruit(n.getEmail(),n.getPassword());
            r.setRole(User_Role.Recruit);
            intstument.addRecruit(r);
            Authentication auth=new UsernamePasswordAuthenticationToken(userDetailsServiceIml.loadUserByUsername(n.getEmail()),null);
            SecurityContextHolder.getContext().setAuthentication(auth);
            httpSession.setAttribute("recruit",r);
            return "redirect:newProfile";
        }
        return "redirect";
    }
    @RequestMapping("/newProfile")
    public String pr()
    {
        return "NewProfile";
    }
    @RequestMapping("/Profile")
    public String prof(HttpSession httpSession,Model model)
    {
        User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Recruit r=intstument.find(user.getUsername());
        model.addAttribute("recruit",r);
        boolean b=true;
        try {
            b = (boolean) httpSession.getAttribute("show");
        }catch (Exception ex)
        {
            b=false;
        }
        model.addAttribute("show",b);
        httpSession.setAttribute("show",false);
        return "Profile";
    }
    @RequestMapping("/account")
    public String account(HttpSession httpSession,Model model)
    {
        User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Recruit r=intstument.find(user.getUsername());
        model.addAttribute("recruit",r);
        model.addAttribute("isView",r.isView());
        model.addAttribute("LinkedIn",r.getLinkedIn());

        return "account";
    }
    @RequestMapping("/updateAcc")
    public String updateAcc(@RequestParam String name,
                          @RequestParam(required = false) MultipartFile photo,
                          @RequestParam(required = false) String skype,
                          @RequestParam(required = false) String phone,
                          @RequestParam(required = false) String linkedin,
                          @RequestParam(required = false) String github,
                          @RequestParam(required = false) MultipartFile cv,
                            @RequestParam(required = false) String cvName,
                          HttpSession httpSession,
                            Model model)
    {


        User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Recruit r=intstument.find(user.getUsername());
r.setName(name);
r.setSkype(skype);
r.setNumber(phone);
r.setLinkedIn(linkedin);
r.setGitHub(github);
r.setCvName(cvName);
try {


    r.setPhoto(photo.getBytes());
    r.setResume(cv.getBytes());
}catch (Exception ex)
{

}
intstument.update(r);
model.addAttribute("recruit",r);
model.addAttribute("LinkedIn",r.getLinkedIn());
model.addAttribute("isView",r.isView());
return "account";

    }
    @RequestMapping("/recPhoto/{id}")
    public ResponseEntity<byte[]> photo(@PathVariable("id") long id)
    {
        Recruit r=intstument.findById(id);
        byte photo[]=r.getPhoto();
        HttpHeaders headers=new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<byte[]>(photo,headers, HttpStatus.OK);
    }

    @RequestMapping("/stop-list")
    public  String stop(HttpSession httpSession,Model model,@RequestParam(required = false) String stoplist)
    {
       Recruit r=(Recruit) httpSession.getAttribute("recruit");
       if(stoplist!=null) {
           r.setStopList(stoplist);
           intstument.update(r);
       }
       httpSession.setAttribute("recruit",r);
       model.addAttribute("recruit",r);
       return "/stop-list";
    }
    @RequestMapping("/subs")
    public String subs(HttpSession httpSession,Model model)
    {
        Recruit r;

        User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        r=intstument.find(user.getUsername());

        httpSession.setAttribute("recruit",r);
        model.addAttribute("recruit",r);
        return "/subscriptions";
    }
    @RequestMapping("/subss")
    public String subss(HttpSession httpSession,Model model,@RequestParam(required = false) String jobs_push)
    {
        User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Recruit r=intstument.find(user.getUsername());
        if(jobs_push!=null)
        {
            r.setDistribution(true);
            intstument.update(r);
        }
        else
        {
            r.setDistribution(false);
            intstument.update(r);
        }

        httpSession.setAttribute("recruit",r);
        model.addAttribute("recruit",r);
        return "redirect:subs";
    }
    @RequestMapping("/kill")
public String kill(HttpSession httpSession,Model model)
    {
        User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Recruit r=intstument.find(user.getUsername());
        model.addAttribute("recruit",r);
        return "kill";
    }
    @RequestMapping("/toKill")
    public String toKill(HttpSession httpSession)
    {
        User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Recruit r=intstument.find(user.getUsername());
        intstument.update(r);
        httpSession.setAttribute("recruit",null);
        intstument.remove(r);
        return "redirect:/";
    }
    @RequestMapping("/exit")
    public String exit(HttpSession httpSession)
    {
        httpSession.setAttribute("recruit",null);
        return "redirect:/";
    }
    @RequestMapping("/pidr")
    public String pidr()
    {
        return "pidrPage";
    }

    @RequestMapping("/forgetPassword")
    public String email(@RequestParam String email,HttpSession httpSession)
    {
        Recruit r=intstument.find(email);
        if(r==null)
        {
            httpSession.setAttribute("sentence","Пользователя не существует");
            return "redirect:/pass";
        }
        Sender sender = new Sender("dioasgid@gmail.com", "vape_me_kiev");
        sender.send("djin", "Ваш пароль: "+r.getPassword(), "dioasgid@gmail.com", email);
        httpSession.setAttribute("sentence","Пароль отпрален на почту");
        return "redirect:/pass";
    }
    @RequestMapping("/pass")
    public String password(Model model,HttpSession httpSession)
    {
        model.addAttribute("sentence",httpSession.getAttribute("sentence"));
        return "ForgetPassword";
    }


}
