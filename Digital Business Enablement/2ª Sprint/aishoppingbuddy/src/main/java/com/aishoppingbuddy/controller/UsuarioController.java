package com.aishoppingbuddy.controller;

import com.aishoppingbuddy.model.Usuario;
import com.aishoppingbuddy.repository.UsuarioRepository;
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
@RequestMapping("aishoppingbuddy/api/usuario")
public class UsuarioController {
    
    Logger log = LoggerFactory.getLogger(getClass());
    
    @Autowired
    UsuarioRepository usuarioRepository;
    
    @GetMapping
    public List<Usuario> load() { return usuarioRepository.findAll(); }

    @GetMapping("{id}")
    public ResponseEntity<Usuario> index(@PathVariable Long id) {
        log.info("buscando usuario " + id);
        var result = usuarioRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Usuario não Encontrado"));
        return ResponseEntity.ok(result);
    }

    @PostMapping
    public ResponseEntity<Usuario> create(@RequestBody @Valid Usuario usuario){
        log.info("cadastrando usuario");
        usuarioRepository.save(usuario);
        return ResponseEntity.status(HttpStatus.CREATED).body(usuario);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<Usuario> destroy(@PathVariable Long id){
        log.info("deletando usuario " + id);
        var result = usuarioRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Usuario não Encontrado"));
        usuarioRepository.delete(result);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("{id}")
    public ResponseEntity<Usuario> update(@PathVariable Long id, @RequestBody @Valid Usuario usuario){
        log.info("atualizando usuario "+id);
        var result = usuarioRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Usuario não Encontrado"));
        usuario.setId(id);
        usuarioRepository.save(usuario);
        return ResponseEntity.ok(usuario);
    }
    
}
