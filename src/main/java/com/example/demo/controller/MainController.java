package com.example.demo.controller;

import com.example.demo.usecase.ActualizarInsertarRangos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@RestController
public class MainController {
    @Autowired
    private ActualizarInsertarRangos actualizarInsertarRangos;
    @GetMapping("/ping")
    public String healthStatus() {
        return "¡Hola, mundo!";
    }
    @PostMapping("/actualizarInsertarRangos")
    public String actualizarInsertarRangos(@RequestBody Map<String, Object> ctx) {
        actualizarInsertarRangos.execute(ctx);


        return "OK : registro actualizado o insertado";
    }
    //ahora maneja los errores
    @ExceptionHandler(Exception.class)
    public String handleException(Exception e) {
        return e.getMessage();
    }

}

