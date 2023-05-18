package com.aishoppingbuddy.repository;

import com.aishoppingbuddy.model.Funcionario;
import com.aishoppingbuddy.model.Parceiro;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ParceiroRepository extends JpaRepository<Parceiro, Long> {
    void delete(List<Parceiro> parceiros);
}
