package com.example.Entrevista.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.Entrevista.Entity.Colaborador;

public interface ColaboradorRepository extends JpaRepository<Colaborador, String> {
}

