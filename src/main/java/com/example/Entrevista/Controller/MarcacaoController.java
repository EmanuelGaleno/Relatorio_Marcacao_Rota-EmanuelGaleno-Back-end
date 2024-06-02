package com.example.Entrevista.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import com.example.Entrevista.Entity.Marcacao;
import com.example.Entrevista.Service.MarcacaoService;

import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/relatorio")
public class MarcacaoController {

    @Autowired
    private MarcacaoService marcacaoService;

    @GetMapping("/{cpf}")
    public Map<String, Object> getRelatorio(@PathVariable String cpf) {
    	
        List<Marcacao> marcacoes = marcacaoService.getMarcacoes(cpf);
        
        long totalRefeicao = marcacaoService.calcularTempoTotal(marcacoes, "Refeição");
        long totalEspera = marcacaoService.calcularTempoTotal(marcacoes, "Espera");
        long totalDescanso = marcacaoService.calcularTempoTotal(marcacoes, "Descanso");
        long totalJornada = marcacaoService.calcularTempoTotal(marcacoes, "Jornada");

        Map<String, Long> totais = Map.of(
                "Refeição", totalRefeicao,
                "Espera", totalEspera,
                "Descanso", totalDescanso,
                "Jornada", totalJornada
        );

        Map<String, List<Marcacao>> marcacoesPorDia = marcacoes.stream()
                .collect(Collectors.groupingBy(m -> m.getDataHoraMarcacao().toLocalDate().toString()));

        return Map.of(
                "marcacoesPorDia", marcacoesPorDia,
                "totais", totais
        );
    }
}

