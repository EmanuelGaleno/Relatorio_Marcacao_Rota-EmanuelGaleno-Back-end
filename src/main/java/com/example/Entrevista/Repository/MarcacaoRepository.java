package com.example.Entrevista.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.Entrevista.Entity.Marcacao;


import java.util.List;

public interface MarcacaoRepository extends JpaRepository<Marcacao, Long> {
    @Query("SELECT m FROM Marcacao m WHERE m.colaborador.cpf = :cpf ORDER BY m.dataHoraMarcacao")
    List<Marcacao> findByColaboradorAndPeriod(@Param("cpf") String cpf);
}

