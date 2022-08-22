package sn.youdev.footballrest.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class BaseController {
    protected ResponseEntity<Object> returnValue (Object o){
        try {
            return new ResponseEntity<>(o, HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
        }
    }
}

