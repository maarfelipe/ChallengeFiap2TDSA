package com.aishoppingbuddy.controller;

import com.aishoppingbuddy.model.Parceiro;
import com.aishoppingbuddy.model.Produto;
import com.aishoppingbuddy.model.Recomendacao;
import com.aishoppingbuddy.repository.RecomendacaoRepository;
import com.aishoppingbuddy.repository.UsuarioRepository;
import com.aishoppingbuddy.service.TokenService;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("aishoppingbuddy/api/recomendacao")
public class RecomendacaoController {

    @Autowired
    RecomendacaoRepository recomendacaoRepository;

    @Autowired
    UsuarioRepository usuarioRepository;

    Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    TokenService tokenService;

    @CrossOrigin
    @GetMapping
    public List<Recomendacao> load(){
        return recomendacaoRepository.findAll();
    }

    @CrossOrigin
    @PostMapping("{idUsuario}")
    public ResponseEntity<Object> criarRecomendacao(@RequestHeader("Authorization") String header, @PathVariable Long idUsuario, @RequestBody @Valid Recomendacao recomendacao) {

        log.info("buscando usuario");
        var funcionarioResult = tokenService.validate(tokenService.getToken(header));
        var parceiroResult = funcionarioResult.getParceiro();
        var usuarioResult = usuarioRepository.findById(idUsuario)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Usuario não Encontrado"));

        String mensagem = "MENSAGEM GERADA PELO CHATGPT";

        recomendacao.setParceiro(parceiroResult);
        recomendacao.setUsuario(usuarioResult);
        recomendacao.setMensagem(mensagem);
        recomendacao.setData(LocalDate.now());

        recomendacaoRepository.save(recomendacao);
        log.info("recomendacao "+recomendacao.getId()+" salva");
        return ResponseEntity.ok(recomendacao);

    }

}
