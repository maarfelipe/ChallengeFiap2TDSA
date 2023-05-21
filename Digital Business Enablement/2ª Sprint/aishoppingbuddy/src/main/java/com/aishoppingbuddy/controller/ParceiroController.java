package com.aishoppingbuddy.controller;

import com.aishoppingbuddy.model.Parceiro;
import com.aishoppingbuddy.model.Produto;
import com.aishoppingbuddy.model.Recomendacao;
import com.aishoppingbuddy.model.Transacao;
import com.aishoppingbuddy.repository.*;
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

    @Autowired
    RecomendacaoRepository recomendacaoRepository;

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

    @GetMapping("{id}/transacoes")
    public List<Transacao> listarTransacoes(@PathVariable Long id) {
        var parceiroResult = parceiroRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Parceiro não Encontrado"));
        return transacaoRepository.findAll();
    }

    @PostMapping("{idParceiro}/recomendacoes/{idUsuario}")
    public ResponseEntity<Recomendacao> criarRecomendacao(@PathVariable Long idParceiro, @PathVariable Long idUsuario, @RequestBody List<Transacao> transacaoList) {
        var parceiroResult = parceiroRepository.findById(idParceiro)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Parceiro não Encontrado"));
        var usuarioResult = usuarioRepository.findById(idUsuario)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Usuario não Encontrado"));

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
        produtoRepository.saveAll(produtoList);
        log.info("recuperado dados da api");

        Recomendacao recomendacao = Recomendacao
                .builder()
                .mensagem(mensagem)
                .data(data)
                .parceiro(parceiroResult)
                .usuario(usuarioResult)
                .produtoList(produtoList)
                .build();

        recomendacaoRepository.save(recomendacao);
        log.info("recomendacao "+recomendacao.getId()+" salva");
        return ResponseEntity.ok(recomendacao);
    }

    @GetMapping("{id}/recomendacoes")
    public List<Recomendacao> listarTodasRecomendacoes(@PathVariable Long id) {
        var parceiroResult = parceiroRepository.findById(id)
                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Parceiro não Encontrado"));
        return recomendacaoRepository.findByParceiroId(id);
    }

//    @GetMapping("{idParceiro}/recomendacoes/usuario/{idUsuario}")
//    public List<Recomendacao> listarRecomendacoesUsuario(@PathVariable Long idParceiro, @PathVariable Long idUsuario) {
//        var parceiroResult = parceiroRepository.findById(idParceiro)
//                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Parceiro não Encontrado"));
//        var usuarioResult = usuarioRepository.findById(idUsuario)
//                .orElseThrow(()->new ResponseStatusException(HttpStatus.NOT_FOUND, "Usuario não Encontrado"));
//        return null;
//    }

}
