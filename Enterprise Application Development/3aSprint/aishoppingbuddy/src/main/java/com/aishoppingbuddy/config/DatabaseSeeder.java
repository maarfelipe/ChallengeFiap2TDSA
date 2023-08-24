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
    }

}
