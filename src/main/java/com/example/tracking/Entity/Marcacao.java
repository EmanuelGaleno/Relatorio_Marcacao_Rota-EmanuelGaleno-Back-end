package com.example.tracking.Entity;

import jakarta.persistence.*;
import org.antlr.v4.runtime.misc.NotNull;

import java.time.ZonedDateTime;

@Entity
@Table(name = "MARCACAO")
public class Marcacao {
    @Id
	@NotNull
    private Long codigo;
    
    @ManyToOne
    @JoinColumn(name = "cod_tipo_marcacao")
    private MarcacaoTipo tipoMarcacao;
    
    @ManyToOne
    @JoinColumn(name = "cpf_colaborador")
    private Colaborador colaborador;
    
    private ZonedDateTime dataHoraMarcacao;
    
    @Column(name = "tipo_marcacao")
    private String tipoMarcacaoEvento; // Pode ser 'MARCACAO_INICIO' ou 'MARCACAO_FIM'
    
    // Getters and setters
    
	public Long getCodigo() {
		return codigo;
	}
	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}
	public MarcacaoTipo getTipoMarcacao() {
		return tipoMarcacao;
	}
	public void setTipoMarcacao(MarcacaoTipo tipoMarcacao) {
		this.tipoMarcacao = tipoMarcacao;
	}
	public Colaborador getColaborador() {
		return colaborador;
	}
	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}
	public ZonedDateTime getDataHoraMarcacao() {
		return dataHoraMarcacao;
	}
	public void setDataHoraMarcacao(ZonedDateTime dataHoraMarcacao) {
		this.dataHoraMarcacao = dataHoraMarcacao;
	}
	public String getTipoMarcacaoEvento() {
		return tipoMarcacaoEvento;
	}
	public void setTipoMarcacaoEvento(String tipoMarcacaoEvento) {
		this.tipoMarcacaoEvento = tipoMarcacaoEvento;
	}

}

