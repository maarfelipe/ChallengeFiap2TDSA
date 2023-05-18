package com.aishoppingbuddy.controller;

import com.aishoppingbuddy.model.Parceiro;
import com.aishoppingbuddy.repository.ParceiroRepository;
import jakarta.validation.Valid;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("aishoppingbuddy/api/parceiro")
public class ParceiroController {

    @Autowired
    ParceiroRepository parceiroRepository;

    @GetMapping("aishoppingbuddy/api/parceiro")
    public List<Parceiro> getParceiros(Long id){
        return parceiroRepository.findAll();
    }
    @PostMapping("aishoppingbuddy/api/parceiro")
    public ResponseEntity<Parceiro> create(@RequestBody @Valid Parceiro parceiro, Logger log){
        log.info("cadastrando parceiro " + parceiro);
        parceiroRepository.save(parceiro);
        return ResponseEntity.status(HttpStatus.CREATED).body(parceiro);
    }

    @DeleteMapping("aishoppingbuddy/api/parceiro")
    public ResponseEntity<Parceiro> destroy(@PathVariable Long id, Logger log){
        log.info("deletando parceiro " + id);
        parceiroRepository.delete(getParceiros(id));
        return ResponseEntity.noContent().build();
    }

    @PutMapping("aishoppingbuddy/api/parceiro}")
    public ResponseEntity<Parceiro> update(@PathVariable Long id, @RequestBody @Valid Parceiro parceiro, Logger log){
        log.info("atualizando parceiro " + id);
        getParceiros(id);
        parceiro.setId(id);
        parceiroRepository.save(parceiro);
        return ResponseEntity.ok(parceiro);
    }
    private Parceiro geParceiro(Long id) {
        return parceiroRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "parceiro não encontrado"));
    }
}
