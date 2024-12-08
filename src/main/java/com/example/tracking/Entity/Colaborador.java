package com.example.tracking.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import org.antlr.v4.runtime.misc.NotNull;


@Entity
@Table(name = "COLABORADOR")
public class Colaborador {
    @Id

	@NotNull
    private String cpf;
	@NotNull
    private String name;
    
 // Getters and setters
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}

