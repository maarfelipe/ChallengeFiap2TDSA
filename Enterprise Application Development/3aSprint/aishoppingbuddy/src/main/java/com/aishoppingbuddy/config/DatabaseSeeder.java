package com.aishoppingbuddy.config;

import com.aishoppingbuddy.model.Funcionario;
import com.aishoppingbuddy.model.Parceiro;
import com.aishoppingbuddy.model.Produto;
import com.aishoppingbuddy.model.Usuario;
import com.aishoppingbuddy.repository.FuncionarioRepository;
import com.aishoppingbuddy.repository.ParceiroRepository;
import com.aishoppingbuddy.repository.ProdutoRepository;
import com.aishoppingbuddy.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDate;
import java.util.List;

@Configuration
public class DatabaseSeeder implements CommandLineRunner {

    @Autowired
    ParceiroRepository parceiroRepository;

    @Autowired
    UsuarioRepository usuarioRepository;

    @Autowired
    ProdutoRepository produtoRepository;

    @Autowired
    FuncionarioRepository funcionarioRepository;

    @Autowired
    PasswordEncoder encoder;

    @Override
    public void run(String... args) throws Exception {

        Parceiro parceiro1 = Parceiro.builder().nomeFantasia("nome1").cnpj("cnpj1").dataEntrada(LocalDate.now()).build();
        Parceiro parceiro2 = Parceiro.builder().nomeFantasia("nome2").cnpj("cnpj2").dataEntrada(LocalDate.now()).build();
        // Parceiro parceiro3 = Parceiro.builder().nomeFantasia("nome3").cnpj("cnpj3").dataEntrada(LocalDate.now()).build();
        // Parceiro parceiro4 = Parceiro.builder().nomeFantasia("nome4").cnpj("cnpj4").dataEntrada(LocalDate.now()).build();

        parceiroRepository.deleteAll();
        parceiroRepository.saveAll(List.of(
                parceiro1, parceiro2
        ));

        funcionarioRepository.saveAll(List.of(
                Funcionario.builder().nome("nome1").email("email1@gmail.com").senha(encoder.encode("senha1")).parceiro(parceiro1).build(),
                Funcionario.builder().nome("nome2").email("email2@gmail.com").senha(encoder.encode("senha2")).parceiro(parceiro2).build()
        ));

        usuarioRepository.deleteAll();
        usuarioRepository.saveAll(List.of(
                Usuario.builder().nome("nome1").cep("cep1").cpf("cpf1").dataNascimento(LocalDate.now()).genero("M").build(),
                Usuario.builder().nome("nome2").cep("cep2").cpf("cpf2").dataNascimento(LocalDate.now()).genero("F").build(),
                Usuario.builder().nome("nome3").cep("cep3").cpf("cpf3").dataNascimento(LocalDate.now()).genero("M").build(),
                Usuario.builder().nome("nome4").cep("cep4").cpf("cpf4").dataNascimento(LocalDate.now()).genero("F").build()
        ));

        produtoRepository.deleteAll();
        produtoRepository.saveAll(List.of(
                Produto.builder().nome("nome1").tipo("tipo1").categoria("categoria1").valor(10.10).descricao("descricao1").parceiro(parceiro1).build(),
                Produto.builder().nome("nome2").tipo("tipo2").categoria("categoria2").valor(20.20).descricao("descricao2").parceiro(parceiro1).build(),
                Produto.builder().nome("nome3").tipo("tipo3").categoria("categoria3").valor(30.30).descricao("descricao3").parceiro(parceiro2).build(),
                Produto.builder().nome("nome4").tipo("tipo4").categoria("categoria4").valor(40.40).descricao("descricao4").parceiro(parceiro2).build()
        ));
    }

}
