package com.example.tracking.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tracking.Entity.Marcacao;
import com.example.tracking.Repository.MarcacaoRepository;

import java.util.List;

@Service
public class MarcacaoService {
    @Autowired
    private MarcacaoRepository marcacaoRepository;

    public List<Marcacao> getMarcacoes(String cpf) {
    	
        return marcacaoRepository.findByColaboradorAndPeriod(cpf);
    }

    
    //Faz o calculo baseado no inicio e fechamento. Ou seja sempre precisa ter MARCACAO_INICIO e MARCACAO_FIM para ser realizado o calculo e é identificado atraves do tipo de marcação
    public long calcularTempoTotal(List<Marcacao> marcacoes, String tipo) {
        return marcacoes.stream()
                .filter(m -> m.getTipoMarcacao().getNome().equals(tipo) && m.getTipoMarcacaoEvento().equals("MARCACAO_INICIO"))
                .mapToLong(m -> {
                    Marcacao marcacaoFim = marcacoes.stream()
                            .filter(f -> f.getTipoMarcacao().getNome().equals(tipo) && f.getTipoMarcacaoEvento().equals("MARCACAO_FIM") && f.getDataHoraMarcacao().isAfter(m.getDataHoraMarcacao()))
                            .findFirst().orElse(null);

                    if (marcacaoFim != null) {
                        return java.time.Duration.between(m.getDataHoraMarcacao(), marcacaoFim.getDataHoraMarcacao()).toMinutes();
                    } else {
                        return 0;
                    }
                })
                .sum();
    }
}

