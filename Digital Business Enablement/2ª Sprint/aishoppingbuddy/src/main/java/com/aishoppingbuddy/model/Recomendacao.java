package com.aishoppingbuddy.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity(name = "T_AISB_RECOMENDACAO")
public class Recomendacao {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cd_recomendacao", nullable = false)
    private long id;

    @Column(name = "ds_mensagem_recomendacao", nullable = false)
    private String mensagem;

    @Column(name = "dt_mensagem", nullable = false)
    private LocalDate data;

    @OneToMany(mappedBy = "recomendacao")
    @JsonIgnore
    private List<Produto> produtoList;

    @ManyToOne
    @JoinColumn(name = "cd_usuario")
    @JsonIgnore
    private Usuario usuario;

}
