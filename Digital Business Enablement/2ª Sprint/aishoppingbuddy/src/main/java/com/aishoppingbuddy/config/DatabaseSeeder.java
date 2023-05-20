package com.aishoppingbuddy.config;

import com.aishoppingbuddy.model.Parceiro;
import com.aishoppingbuddy.repository.ParceiroRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDate;
import java.util.List;

@Configuration
public class DatabaseSeeder implements CommandLineRunner {

    @Autowired
    ParceiroRepository parceiroRepository;

    @Override
    public void run(String... args) throws Exception {
        parceiroRepository.deleteAll();
        parceiroRepository.saveAll(List.of(
                Parceiro.builder().nomeFantasia("nome1").cnpj("cnpj1").dataEntrada(LocalDate.now()).build(),
                Parceiro.builder().nomeFantasia("nome2").cnpj("cnpj2").dataEntrada(LocalDate.now()).build(),
                Parceiro.builder().nomeFantasia("nome3").cnpj("cnpj3").dataEntrada(LocalDate.now()).build(),
                Parceiro.builder().nomeFantasia("nome4").cnpj("cnpj4").dataEntrada(LocalDate.now()).build()
        ));
    }

}
