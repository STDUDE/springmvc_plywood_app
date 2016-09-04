package com.springapp.mvc.test;

import com.springapp.mvc.service.interfaces.PlywoodService;
import com.springapp.mvc.service.interfaces.WorkWithFilesService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Antony on 04.09.2016.
 */
public class Test {
    @Autowired
    static PlywoodService plywoodService;

    @Autowired
    static WorkWithFilesService workWithFilesService;

    public static void main(String... args) {

    }
}
