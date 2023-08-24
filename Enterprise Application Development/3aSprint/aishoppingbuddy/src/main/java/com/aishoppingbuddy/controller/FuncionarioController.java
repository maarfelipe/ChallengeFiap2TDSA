package com.aishoppingbuddy.controller;

import com.aishoppingbuddy.model.Credencial;
import com.aishoppingbuddy.model.Funcionario;
import com.aishoppingbuddy.model.Funcionario;
import com.aishoppingbuddy.repository.FuncionarioRepository;
import com.aishoppingbuddy.service.TokenService;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("aishoppingbuddy/api/funcionario")
public class FuncionarioController {
    
    Logger log = LoggerFactory.getLogger(getClass());
    
    @Autowired
    FuncionarioRepository funcionarioRepository;

    @Autowired
    AuthenticationManager manager;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    TokenService tokenService;
    
    @GetMapping
    public List<Funcionario> load() { return funcionarioRepository.findAll(); }

    @GetMapping("{id}")
    public ResponseEntity<Funcionario> index(@PathVariable Long id) {
        log.info("buscando funcionario " + id);
        var result = funcionarioRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Funcionario não Encontrado"));
        return ResponseEntity.ok(result);
    }

    @CrossOrigin
    @PostMapping("cadastrar")
    public ResponseEntity<Object> cadastro(@RequestBody @Valid Funcionario funcionario) {
        log.info("cadastrando funcionario");
        funcionario.setSenha(encoder.encode(funcionario.getSenha()));
        funcionarioRepository.save(funcionario);
        return ResponseEntity.status(HttpStatus.CREATED).body(funcionario);
    }

    @CrossOrigin
    @PostMapping("login")
    public ResponseEntity<Object> login(@RequestBody Credencial credencial) {
        manager.authenticate(credencial.toAuthentication());
        log.info("autenticado");
        var token = tokenService.generateToken(credencial);
        return ResponseEntity.ok(token);
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
