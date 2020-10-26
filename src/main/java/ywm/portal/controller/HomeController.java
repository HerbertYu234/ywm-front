package ywm.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Created by Herbert Yu on 2019-11-17 13:45
 */
@Controller
public class HomeController extends BaseController {


    @GetMapping(value = {"", "/", "/index"})
    public String index(Model model) {
        return "/index";
    }


    @GetMapping("/home")
    public String home(Model model) {
        return "/home";
    }
}
