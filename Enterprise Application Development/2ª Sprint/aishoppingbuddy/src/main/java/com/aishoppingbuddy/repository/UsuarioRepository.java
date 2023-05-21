package com.aishoppingbuddy.repository;

import com.aishoppingbuddy.model.Transacao;
import com.aishoppingbuddy.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
}
