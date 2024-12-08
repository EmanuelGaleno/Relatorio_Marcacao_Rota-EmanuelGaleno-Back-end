package com.example.tracking;

import com.example.tracking.Entity.Colaborador;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class StartApplicationTests {

	@Autowired
	private ApplicationContext context;

	@Test
	void contextLoads() {
		// Verifica se o contexto da aplicação está carregando corretamente
		assertThat(context).isNotNull();
	}

	@Test
	void testEntityLoad() {
		// Verifica se a entidade 'Colaborador' está no contexto da aplicação
		assertThat(context.getBean(Colaborador.class