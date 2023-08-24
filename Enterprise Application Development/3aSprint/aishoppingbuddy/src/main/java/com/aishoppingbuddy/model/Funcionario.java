package com.aishoppingbuddy.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity(name = "T_AISB_FUNCIONARIO")
public class Funcionario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cd_funcionario", nullable = false)
    private long id;

    @Column(name = "nm_funcionario", nullable = false)
    private String nome;

    @Column(name = "ds_email", nullable = false)
    private String email;

    @ManyToOne
    @JoinColumn(name = "cd_parceiros")
    private Parceiro parceiro;

}
