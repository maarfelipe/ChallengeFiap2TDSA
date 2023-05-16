package com.aishoppingbuddy.repository;

import com.aishoppingbuddy.model.Produto;
import com.aishoppingbuddy.model.Recomendacao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RecomendacaoRepository extends JpaRepository<Recomendacao, Long> {
}
