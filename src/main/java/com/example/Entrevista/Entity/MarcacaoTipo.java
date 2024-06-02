package com.example.Entrevista.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "MARCACAO_TIPO")
public class MarcacaoTipo {
    @Id
    private Long codigo;
    private String nome;
    private Long tempoRecomendadoMinutos;
    
    // Getters and setters
    
	public Long getCodigo() {
		return codigo;
	}
	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Long getTempoRecomendadoMinutos() {
		return tempoRecomendadoMinutos;
	}
	public void setTempoRecomendadoMinutos(Long tempoRecomendadoMinutos) {
		this.tempoRecomendadoMinutos = tempoRecomendadoMinutos;
	}    
    
}

