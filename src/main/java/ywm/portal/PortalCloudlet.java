package ywm.portal;

import com.wolf.Wolf;
import com.wolf.cloud.WolfCloudlet;
import org.springframework.cloud.netflix.feign.EnableFeignClients;

/**
 * Created by Herbert Yu on 2019-12-16 10:27
 */
@Wolf.BootApplication(name = "front")
@EnableFeignClients
public class PortalCloudlet implements WolfCloudlet {

    public static void main(String[] args) {
        Wolf.run(PortalCloudlet.class, args);
    }
}
