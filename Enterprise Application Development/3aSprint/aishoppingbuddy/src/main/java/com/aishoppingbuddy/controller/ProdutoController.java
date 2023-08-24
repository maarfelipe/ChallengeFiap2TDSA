package com.aishoppingbuddy.controller;

import com.aishoppingbuddy.model.Produto;
import com.aishoppingbuddy.repository.ProdutoRepository;
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
@RequestMapping("aishoppingbuddy/api/produto")
public class ProdutoController {
    
    Logger log = LoggerFactory.getLogger(getClass());
    
    @Autowired
    ProdutoRepository produtoRepository;
    
    @GetMapping
    public List<Produto> load() { return produtoRepository.findAll(); }

    @GetMapping("{id}")
    public ResponseEntity<Produto> index(@PathVariable Long id) {
        log.info("buscando produto " + id);
        var result = produtoRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Produto não Encontrado"));
        return ResponseEntity.ok(result);
    }

    @PostMapping
    public ResponseEntity<Produto> create(@RequestBody @Valid Produto produto){
        log.info("cadastrando produto");
        produtoRepository.save(produto);
        return ResponseEntity.status(HttpStatus.CREATED).body(produto);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<Produto> destroy(@PathVariable Long id){
        log.info("deletando produto " + id);
        var result = produtoRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Produto não Encontrado"));
        produtoRepository.delete(result);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("{id}")
    public ResponseEntity<Produto> update(@PathVariable Long id, @RequestBody @Valid Produto produto){
        log.info("atualizando produto "+id);
        var result = produtoRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Produto não Encontrado"));
        produto.setId(id);
        produtoRepository.save(produto);
        return ResponseEntity.ok(produto);
    }
    
}
