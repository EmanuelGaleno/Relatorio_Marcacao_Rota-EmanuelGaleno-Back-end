# Relatório de Marcações de Colaboradores📊 🚚


A aplicação **Relatório de Marcações de Colaboradores** é uma API RESTful desenvolvida com Spring Boot e PostgreSQL. O objetivo é fornecer um exemplo de aplicação Spring Boot com consultas JPA para geração de relatórios de marcações de colaboradores. A aplicação permite que o usuário consulte o relatório de marcações separadas por tipo e por dia, dentro de um período especificado.

## Pré-requisitos ✅

- JDK 11+
- Maven
- Docker
- Docker Compose
- Git

**Importante:** Certifique-se de que a porta 5432 para o PostgreSQL esteja disponível 🚦 ou ajuste a configuração conforme necessário.

## Como Clonar o Projeto 📋

Para clonar o projeto, abra um terminal e execute o seguinte comando:

```bash
git clone https://github.com/EmanuelGaleno/Relatorio_Marcacao_Rota-EmanuelGaleno-Teste_Back-end.git
```

## 🎉 Após clonar o repositório, entre no diretório do projeto:


Copiar código:
```
cd EmanuelGaleno/EmanuelGaleno/Relatorio_Marcacao_Rota-EmanuelGaleno-Teste_Back-end
```

## Configuração Inicial 🔧


***Edite o arquivo application.properties conforme necessário, configurando as credenciais do banco de dados como: nome do banco, username, password, host e porta.***

## Instalação e Configuração do PostgreSQL com Docker 🐳 🚀

Inicie o contêiner Docker do PostgreSQL:

Copiar código:

```
docker-compose up -d
```

## Executando a Aplicação Spring Boot 🍃 🚀
Compile e execute a aplicação:


Copiar código:
```
./mvnw spring-boot:run
```

## Executando as Migrações para Criar as Tabelas no Banco de Dados 🗄️
Execute as migrações:


Copiar código:
```
./mvnw flyway:migrate
```

## Populando o Banco de Dados com Dados de Teste 🗄️
Para popular o banco de dados com dados de teste, execute o script dados_banco_teste_java.sql no seu banco de dados PostgreSQL. 
Este arquivo contém os scripts de criação de tabelas e inserts de dados necessários para testar a aplicação.

Exemplo de execução do script:

Acesse o contêiner Docker do PostgreSQL:


Copiar código:
```
docker exec -it <nome_do_conteiner> 
```

Conecte-se ao banco de dados PostgreSQL:


Copiar código:
```
psql -U meuusuario -d meubanco
```

Execute o script SQL:

Copiar código:
```
\i /caminho/para/dados_banco_teste_java.sql
```

## Como Rodar os Testes 🧪
Execute os testes de integração com:


Copiar código:
```
./mvnw test
```

Se tudo estiver configurado corretamente, você verá a saída dos testes no terminal.

## Acessando a Aplicação 🌐
A API estará acessível através do http://localhost:8080.


## Consultando a API com Postman 📫
Para consultar a API usando Postman, siga os passos abaixo:


## Abra o Postman e crie uma nova requisição.
Configure a requisição para o método GET.
Use a URL:

***http://localhost:8080/api/relatorio*** com o seguinte parâmetro de consulta:

cpf: CPF do colaborador

Exemplo de URL com um CPF já em uso:

 ***http://localhost:8080/relatorio/00187832013***


Copiar código:
```
http://localhost:8080/api/relatorio/(cpf)
```

## Possíveis Erros e Soluções 🛠️
Erro: Porta 5432 já está em uso 🚫.


## Solução: Verifique se nenhum outro serviço está usando a porta 5432. Se necessário, ajuste a porta no seu arquivo docker-compose.yml.

Erro: Problemas com permissões ao executar comandos Docker ⚠️.


## Solução: Execute os comandos Docker com sudo ou adicione seu usuário ao grupo Docker.


## Contribuindo 🤝

Sinta-se à vontade para contribuir com o projeto. Abra uma issue ou envie um pull request com suas sugestões e melhorias.
