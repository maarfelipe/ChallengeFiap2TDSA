package com.aishoppingbuddy.config;

import com.aishoppingbuddy.model.Parceiro;
import com.aishoppingbuddy.model.Produto;
import com.aishoppingbuddy.model.Usuario;
import com.aishoppingbuddy.repository.ParceiroRepository;
import com.aishoppingbuddy.repository.ProdutoRepository;
import com.aishoppingbuddy.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDate;
import java.util.List;

@Configuration
public class DatabaseSeeder implements CommandLineRunner {

    @Autowired
    ParceiroRepository parceiroRepository;

    @Autowired
    UsuarioRepository usuarioRepository;

    @Override
    public void run(String... args) throws Exception {
        parceiroRepository.deleteAll();
        parceiroRepository.saveAll(List.of(
                Parceiro.builder().nomeFantasia("nome1").cnpj("cnpj1").dataEntrada(LocalDate.now()).build(),
                Parceiro.builder().nomeFantasia("nome2").cnpj("cnpj2").dataEntrada(LocalDate.now()).build(),
                Parceiro.builder().nomeFantasia("nome3").cnpj("cnpj3").dataEntrada(LocalDate.now()).build(),
                Parceiro.builder().nomeFantasia("nome4").cnpj("cnpj4").dataEntrada(LocalDate.now()).build()
        ));

        usuarioRepository.deleteAll();
        usuarioRepository.saveAll(List.of(
                Usuario.builder().nome("nome1").cep("cep1").cpf("cpf1").dataNascimento(LocalDate.now()).genero("M").build(),
                Usuario.builder().nome("nome2").cep("cep2").cpf("cpf2").dataNascimento(LocalDate.now()).genero("F").build(),
                Usuario.builder().nome("nome3").cep("cep3").cpf("cpf3").dataNascimento(LocalDate.now()).genero("M").build(),
                Usuario.builder().nome("nome4").cep("cep4").cpf("cpf4").dataNascimento(LocalDate.now()).genero("F").build()
        ));
    }

}
