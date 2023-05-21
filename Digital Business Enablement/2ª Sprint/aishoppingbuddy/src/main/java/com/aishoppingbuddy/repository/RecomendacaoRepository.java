package com.aishoppingbuddy.repository;

import com.aishoppingbuddy.model.Parceiro;
import com.aishoppingbuddy.model.Recomendacao;
import com.aishoppingbuddy.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecomendacaoRepository extends JpaRepository<Recomendacao, Long> {

    List<Recomendacao> findByParceiroId(Long Id);

}
