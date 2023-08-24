package com.aishoppingbuddy.controller;

import com.aishoppingbuddy.model.Funcionario;
import com.aishoppingbuddy.model.Funcionario;
import com.aishoppingbuddy.repository.FuncionarioRepository;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("aishoppingbuddy/api/funcionario")
public class FuncionarioController {
    
    Logger log = LoggerFactory.getLogger(getClass());
    
    @Autowired
    FuncionarioRepository funcionarioRepository;
    
    @GetMapping
    public List<Funcionario> load() { return funcionarioRepository.findAll(); }

    @GetMapping("{id}")
    public ResponseEntity<Funcionario> index(@PathVariable Long id) {
        log.info("buscando funcionario " + id);
        var result = funcionarioRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Funcionario não Encontrado"));
        return ResponseEntity.ok(result);
    }

    @PostMapping
    public ResponseEntity<Funcionario> create(@RequestBody @Valid Funcionario funcionario){
        log.info("cadastrando funcionario");
        funcionarioRepository.save(funcionario);
        return ResponseEntity.status(HttpStatus.CREATED).body(funcionario);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<Funcionario> destroy(@PathVariable Long id){
        log.info("deletando funcionario " + id);
        var result = funcionarioRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Funcionario não Encontrado"));
        funcionarioRepository.delete(result);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("{id}")
    public ResponseEntity<Funcionario> update(@PathVariable Long id, @RequestBody @Valid Funcionario funcionario){
        log.info("atualizando funcionario "+id);
        var result = funcionarioRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Funcionario não Encontrado"));
        funcionario.setId(id);
        funcionarioRepository.save(funcionario);
        return ResponseEntity.ok(funcionario);
    }
    
}
