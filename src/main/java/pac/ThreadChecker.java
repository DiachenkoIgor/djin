package pac;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.ArrayList;

/**
 * Created by 1 on 26.05.2017.
 */
@EnableScheduling
@Component
public class ThreadChecker {

    @Scheduled(fixedRate = 300000)
    public void check()
    {
        for(int i=0;i<MyController.list.size();i++)
        {
            //600000
            if(System.currentTimeMillis()-MyController.list.get(i).getTime()>600000)
            {
                MyController.list.remove(i);
            }
        }
    }





}
