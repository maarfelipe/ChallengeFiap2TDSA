package com.aishoppingbuddy.controller;

import com.aishoppingbuddy.model.Parceiro;
import com.aishoppingbuddy.model.Produto;
import com.aishoppingbuddy.model.Transacao;
import com.aishoppingbuddy.repository.ParceiroRepository;
import com.aishoppingbuddy.repository.ProdutoRepository;
import com.aishoppingbuddy.repository.TransacaoRepository;
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
@RequestMapping("aishoppingbuddy/api/parceiro")
public class ParceiroController {

    Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    ParceiroRepository parceiroRepository;

    @Autowired
    TransacaoRepository transacaoRepository;

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    ProdutoRepository produtoRepository;

    @GetMapping
    public List<Parceiro> load(){
        return parceiroRepository.findAll();
    }

    @GetMapping("{id}")
    public ResponseEntity<Parceiro> index(@PathVariable Long id) {
        log.info("Buscar parceiro: " + id);
        var result = parceiroRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Parceiro não Encontrado"));
        return ResponseEntity.ok(result);
    }

    @PostMapping
    public ResponseEntity<Parceiro> create(@RequestBody @Valid Parceiro parceiro){
        log.info("cadastrando parceiro " + parceiro);
        parceiroRepository.save(parceiro);
        return ResponseEntity.status(HttpStatus.CREATED).body(parceiro);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<Parceiro> destroy(@PathVariable Long id){
        var result = parceiroRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Parceiro não Encontrado"));
        parceiroRepository.delete(result);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("{id}")
    public ResponseEntity<Parceiro> update(@PathVariable Long id, @RequestBody @Valid Parceiro parceiro){
        var result = parceiroRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Parceiro não Encontrado"));
        parceiro.setId(id);
        parceiroRepository.save(parceiro);
        return ResponseEntity.ok(parceiro);
    }

    @PostMapping("{id}/transacoes")
    public ResponseEntity<Parceiro> cadastrarTransacoes(@PathVariable Long id, @RequestBody List<Transacao> transacaoList) {
        var result = parceiroRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Parceiro não Encontrado"));
        for (Transacao t :
                transacaoList) {
            t.setParceiro(result);
            usuarioRepository.save(t.getUsuario());
            produtoRepository.saveAll(t.getProdutoList());
            transacaoRepository.save(t);
            log.info("cadastrando transação "+t.getId()+" no parceiro "+result.getId());
        }
        return ResponseEntity.ok(result);
    }

}
