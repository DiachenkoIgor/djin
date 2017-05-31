package pac.Social;

import com.google.gson.Gson;
import org.json.JSONObject;
import pac.Recruit;
import pac.User_Role;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.Random;

/**
 * Created by 1 on 29.05.2017.
 */
public class GoogleConnection {
    private String client_id="927027748363-ks6je7ak0fiike6r3fojmg43mbrvpf1s.apps.googleusercontent.com";
    private String client_secret="ssObp7x-Hka1fH0uIi7lbKpJ";
    private String redirect_uri="http://localhost:8080/auth/google/callback";
     public static Recruit googleLogin(String code) throws Exception
     {
         String urlParameters = "code="
                 + code
                 + "&client_id=927027748363-ks6je7ak0fiike6r3fojmg43mbrvpf1s.apps.googleusercontent.com"
                 + "&client_secret=ssObp7x-Hka1fH0uIi7lbKpJ"
                 + "&redirect_uri=http://localhost:8080/auth/google/callback"
                 + "&grant_type=authorization_code";

         URL url = new URL("https://accounts.google.com/o/oauth2/token");
         URLConnection urlConn = url.openConnection();
         urlConn.setDoOutput(true);
         OutputStreamWriter writer = new OutputStreamWriter(
                 urlConn.getOutputStream());
         writer.write(urlParameters);
         writer.flush();

         //get output in outputString
         String line, outputString = "";
         BufferedReader reader = new BufferedReader(new InputStreamReader(
                 urlConn.getInputStream()));
         while ((line = reader.readLine()) != null) {
             outputString += line;
         }
         System.out.println(outputString);

         //get Access Token
         JSONObject js=new JSONObject(outputString);

         String access_token = js.getString("access_token");
         System.out.println(access_token);

         //get User Info
         url = new URL(
                 "https://www.googleapis.com/oauth2/v1/userinfo?access_token="
                         + access_token);
         urlConn = url.openConnection();
         outputString = "";
         reader = new BufferedReader(new InputStreamReader(
                 urlConn.getInputStream()));
         while ((line = reader.readLine()) != null) {
             outputString += line;
         }
         System.out.println(outputString);

         // Convert JSON response into Pojo class
         GooglePojo data = new Gson().fromJson(outputString, GooglePojo.class);
         writer.close();
         reader.close();
         Random h=new Random();
         String password=String.valueOf(h.nextInt(10000));
         Recruit r=new Recruit(data.email,password);
         r.setView(false);
         r.setPublished(false);
         r.setName(data.getName()+" "+data.getFamily_name());

         r.setPhoto(photo(data));
         r.setEmail(data.getEmail());
         r.setRole(User_Role.Recruit);
         /*URLConnection urlCon = url.openConnection();
         String picture = "";
         line="";
         BufferedReader readerForPic = new BufferedReader(new InputStreamReader(
                 urlCon.getInputStream()));
         while ((line = reader.readLine()) != null) {
             outputString += line;
         }
         System.out.println(line);*/
         return  r;



     }
     public static byte[] photo(GooglePojo data) throws Exception
     {
         URL ur = new URL(data.picture);
         BufferedImage img= ImageIO.read(ur);
         ByteArrayOutputStream baos = new ByteArrayOutputStream();
         ImageIO.write(img, "jpg", baos );
         baos.flush();
         return baos.toByteArray();
     }
}
