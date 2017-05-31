package pac.Social;

import com.google.gson.Gson;
import org.json.JSONObject;
import pac.Recruit;
import pac.User_Role;

import javax.imageio.ImageIO;
import javax.net.ssl.HttpsURLConnection;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Random;

/**
 * Created by 1 on 29.05.2017.
 */
public class LinkedInConnection {


    public static Recruit connectionLinkedIn(String code) throws Exception
    {
        String url="https://www.linkedin.com/oauth/v2/accessToken";
        URL obj=new URL(url);
        HttpsURLConnection con=(HttpsURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("HOST","www.linkedin.com");
        con.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
        String urlParameters ="grant_type=authorization_code&code="+code+"&redirect_uri="+ commonthing.redirect_url+"&client_id="+commonthing.client_id+"&client_secret="+commonthing.client_secret+"";
        con.setDoOutput(true);
        DataOutputStream wr=new DataOutputStream(con.getOutputStream());
        wr.writeBytes(urlParameters);
        wr.flush();
        wr.close();
        int responseCode=con.getResponseCode();
        System.out.println(responseCode);
        BufferedReader in =new BufferedReader(
                new InputStreamReader(con.getInputStream())
        );
        String inputLine;
        StringBuffer responce=new StringBuffer();
        while((inputLine=in.readLine())!=null)
        {
            responce.append(inputLine);
        }
        in.close();
        System.out.println(responce.toString());
        JSONObject jsonObject=new JSONObject(
                responce.toString()
        );
        String access_token=jsonObject.getString("access_token");
        System.out.println(access_token);
        LinkedInProfile linkedInProfile=new LinkedInProfile();
       Recruit recruit=send(access_token);
        return recruit;
    }
    private static Recruit send(String token) throws Exception
    {
        LinkedInProfile prof=new LinkedInProfile();
        String url="https://api.linkedin.com/v1/people/~:(email-address,first-name,last-name)?format=json&(email-address)";
        URL o=new URL(url);
        HttpsURLConnection con=(HttpsURLConnection) o.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("HOST","api.linkedin.com");
        con.setRequestProperty("Connection","Keep-Alive");
        con.setRequestProperty("Authorization","Bearer "+token);

        int responceCode=con.getResponseCode();
        System.out.println(responceCode);
        BufferedReader in =new BufferedReader(
                new InputStreamReader(con.getInputStream())
        );
        String inputLine;
        StringBuffer responce=new StringBuffer();
        while((inputLine=in.readLine())!=null)
        {
            responce.append(inputLine);
        }
        in.close();
        System.out.println(responce.toString());
        LinkedInProfile l=new Gson().fromJson(responce.toString(),LinkedInProfile.class);
        Random h=new Random();
        String password=String.valueOf(h.nextInt(10000));

        Recruit r=new Recruit(l.getEmailAddress(),password);
        String name="igor";
        String surname="diachenko";
        r.setName(name+" "+surname);
        r.setRole(User_Role.Recruit);

        return r;


    }

    public static byte[] phot(LinkedInProfile data) throws Exception
    {
        URL ur = new URL(data.getPicture());
        BufferedImage img= ImageIO.read(ur);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(img, "jpg", baos );
        baos.flush();
        return baos.toByteArray();
    }
}
