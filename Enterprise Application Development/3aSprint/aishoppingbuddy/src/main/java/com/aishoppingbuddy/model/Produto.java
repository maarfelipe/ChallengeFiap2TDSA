package com.aishoppingbuddy.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity(name = "T_AISB_PRODUTO")
public class Produto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cd_produto", nullable = false)
    private long id;

    @Column(name = "nm_produto", nullable = false)
    private String nome;

    @Column(name = "ds_tipo", nullable = false)
    private String tipo;

    @Column(name = "vl_produto", nullable = false)
    private double valor;

    @Column(name = "ds_produto", nullable = false)
    private String descricao;

    @Column(name = "ds_categoria", nullable = false)
    private String categoria;

    @ManyToOne
    @JoinColumn(name = "cd_parceiros")
    @JsonIgnore
    private Parceiro parceiro;

    @ManyToOne
    @JoinColumn(name = "cd_recomendacao")
    @JsonIgnore
    private Recomendacao recomendacao;

    @ManyToOne
    @JoinColumn(name = "cd_transacao")
    @JsonIgnore
    private Transacao transacao;

}
