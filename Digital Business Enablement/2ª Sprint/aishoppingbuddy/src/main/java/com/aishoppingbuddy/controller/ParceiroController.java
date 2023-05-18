package com.aishoppingbuddy.controller;

import com.aishoppingbuddy.repository.ParceiroRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("aishoppingbuddy/api/parceiro")
public class ParceiroController {

    @Autowired
    ParceiroRepository parceiroRepository;

    @GetMapping()

}
