package com.aishoppingbuddy.controller;

import com.aishoppingbuddy.model.*;
import com.aishoppingbuddy.repository.ParceiroRepository;
import com.aishoppingbuddy.repository.ProdutoRepository;
import com.aishoppingbuddy.repository.RecomendacaoRepository;
import com.aishoppingbuddy.repository.UsuarioRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("aishoppingbuddy/api/recomendacao")
public class RecomendacaoController {

    Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    RecomendacaoRepository recomendacaoRepository;

    @Autowired
    ProdutoRepository produtoRepository;

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    ParceiroRepository parceiroRepository;

    /*
    @PostMapping
    public ResponseEntity<Recomendacao> criarRecomendacao(@RequestBody List<Transacao> transacaoList) {
        // DADOS GERADOS PELA API DE MACHINE LEARNING
        String mensagem = "MENSAGEM GERADA PELO CHATGPT";
        LocalDate data = LocalDate.now();
        List<Produto> produtoList = List.of(
                Produto.builder()
                        .nome("NOME DO PRODUTO RECOMENDADO PELO MACHINE LEARNING")
                        .tipo("TIPO DO PRODUTO RECOMENDADO PELO MACHINE LEARNING")
                        .valor(50)
                        .descricao("DESCRICAO DO PRODUTO RECOMENDADO PELO MACHINE LEARNING")
                        .categoria("CATEGORIA DO PRODUTO RECOMENDADO PELO MACHINE LEARNING")
                        .build()
        );
        log.info("recuperado dados da api");
        Usuario usuario = transacaoList.get(0).getUsuario();
        Parceiro parceiro = transacaoList.get(0).getParceiro();
        Recomendacao recomendacao = Recomendacao
                .builder()
                .mensagem(mensagem)
                .data(data)
                .build();
        recomendacaoRepository.save(recomendacao);
        recomendacao.setProdutoList(produtoList);
        log.info("salvando produtos na recomendacao "+recomendacao.getId());
        recomendacao.setUsuario(usuario);
        log.info("salvando usuario "+usuario.getId()+" na recomendacao "+recomendacao.getId());
        recomendacao.setParceiro(parceiro);
        log.info("salvando parceiro "+parceiro.getId()+" na recomendacao "+recomendacao.getId());
        produtoRepository.saveAll(produtoList);
        log.info("produtos salvos");
        usuarioRepository.save(usuario);
        log.info("usuario salvo");
        parceiroRepository.save(parceiro);
        log.info("parceiro salvo");
        log.info("recomendacao salva");
        return ResponseEntity.ok(recomendacao);

    }
    */
}
