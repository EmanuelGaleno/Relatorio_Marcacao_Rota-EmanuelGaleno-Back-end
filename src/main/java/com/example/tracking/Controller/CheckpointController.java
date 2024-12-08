package com.example.tracking.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;

import com.example.tracking.Entity.Marcacao;
import com.example.tracking.Service.MarcacaoService;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/relatorio")
public class CheckpointController {

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
    @GetMapping("/{cpf}/por-data")
    public Map<String, Object> getRelatorioPorData(@PathVariable String cpf,
                                                   @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dataInicio,
                                                   @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dataFim) {
        List<Marcacao> marcacoes = marcacaoService.getMarcacoes(cpf).stream()
                .filter(m -> !m.getDataHoraMarcacao().toLocalDate().isBefore(dataInicio) &&
                        !m.getDataHoraMarcacao().toLocalDate().isAfter(dataFim))
                .collect(Collectors.toList());

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


