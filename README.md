
# INSS Discount

Projeto teste para aplicação de valor de desconto de INSS em salários de proponentes.


## Funcionalidades

- Criação edição e exclusão de proponentes.
- Cálculo de INSS com base no salário no formulário de proponentes.
- Relatório de funcionários.
- Atualização de informações do funcionário assíncrona.

## Instalação usando docker

Dependências:
- Git
- Docker / Docker Compose

Baixe o projeto utilizando o git e acesse o diretório da aplicação.

```bash
  git clone git@github.com:jmouradeveloper/inss_discount.git
  cd inss_discount
```

Com o docker-compose é possível realizar o build da aplicação e subir o repositório como um processo em segundo plano com o comando:

```bash
  docker-compose up --build -d
```

Para finalizar a implantação deve-se rodar o comando a seguir para criar o banco de dados, carregar o schema e inicializar os dados do seed.rb nas devidas tabelas.

```bash
  docker exec inss_discount_web_1 rails db:prepare
```

Então você pode acessar via navegador o endereço local http://localhost:3000 para acessar a aplicação.

## Instalação sem docker

Dependências:
- Git
- Ruby 3.1
- Rails 7
- Redis
- Postgres

Baixe o projeto utilizando o git e acesse o diretório da aplicação.

```bash
  git clone git@github.com:jmouradeveloper/inss_discount.git
  cd inss_discount
```

Baixe e instale as dependências do projeto com:

```bash
  bundle install
```

Para finalizar a implantação deve-se rodar o comando a seguir para criar o banco de dados, carregar o schema e inicializar os dados do seed.rb nas devidas tabelas.

```bash
  rails db:prepare
```

Então você pode acessar via navegador o endereço local http://localhost:3000 para acessar a aplicação.
## Rodando os testes

Caso tenha instalado a aplicação utilizando o Docker é possível rodar os testes com o seguinte comando, após subir a aplicação local:

```bash
  docker-compose run --rm web rspec
```

Caso opte pela instalação sem o Docker, é possível apenas rodar o comando:

```bash
  rspec
```

Em ambas as opções é necessário estar no diretório raiz da aplicação para funcionar corretamente.

## Análise de código

Para realizar a análise estática do código localmente:

```bash
  # se rodando via docker
  docker-compose run --rm web rubocop

  # se rodando sem docker
  rubocop
```

Para acessar a análise estática de código automatizado no Github actions acesse:
https://github.com/jmouradeveloper/inss_discount/actions

## Documentação de Funcionalidades

Acesse o [link da documentação](https://github.com/jmouradeveloper/inss_discount/tree/main/docs) e navegue entre as funcionalidades.