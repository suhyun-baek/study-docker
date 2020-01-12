package hello;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
public class HelloController {

    @RequestMapping("/")
    public String index() {
	System.out.println("Print log~");
	try{ 
	    System.out.println( InetAddress.getLocalHost().getHostName() ); 
            System.out.println( InetAddress.getLocalHost().getHostAddress() );
            return InetAddress.getLocalHost().getHostName() + "now-02"; 
        }
        catch( UnknownHostException e ){
            e.printStackTrace(); 
        }
        return "Greetings from Spring Boot!";
    }
}
