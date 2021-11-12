## Objetivo do projeto
Implementar conhecimentos adquiridos nas aulas de Programação Web com JSP.
Basicamente é possível adicionar solicitações, editar, deletar e visualizar a lista.

### Rodando na sua máquina.
Para rodar em ambiente próprio, deve possuir tomcat e mysql. Alterar os parâmetros de conexão em `src/java/repository/DBConnection.java`:

`13|  private final String database = "<nome_da_base>";`

`14|  private final String user = "username";`

`15|  private final String password = "password";`

Com esses parâmetros definidos, é só rodar!

### Desenvolvido e implementado
- Importação e uso de classes Java em JSPs.
- Redirecionamentos de link.
- Recebimento de requisição GET / POST e uso dos parâmetros passados para manipulaçao necessária dos dados.
- Conexão ao banco de dados.
- Preparação de queries com dados dinâmicos e execução.
- CRUD - Create (criar), Read (ler), Update (atualizar) e Delete (deletar).

