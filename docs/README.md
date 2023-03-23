# PROJETO BI

primeiramente, baixe o arquivo `MICRODADOS.csv` no site
do painel da COVID-19 [clicando aqui](https://coronavirus.es.gov.br/painel-covid-19-es) e, em seguida, copie e cole o
arquivo na pasta `data` do projeto.

## Preparando o banco

Crie uma database no Postgresql e, em seguida, pegue o link do banco.
Depois, copie o arquivo `env.example` e cole no mesmo diretório em que se localiza, renomeando para `.env`. Cole o link na variável `DATABASE_URL`.
em seguida execute:

```bash
cd /home/$USER/diretorio_do_projeto/
make preparedb
```

O comando irá aplicar as Migrations existentes do Prisma e preparar
os models dos objetos.

Após isso, será necessário importar o csv para o banco
gerenciado pelo Postgresql usando o psql. basta executar:

```bash
cd /home/$USER/diretorio_do_projeto/
make import
```

Esse comando converterá o arquivo do encode `LATIN1` para `UTF-8`
e o deixará no arquivo de nome `MICRODADOStratados.csv`. Em seguida,
começará a copiar os dados do csv para o banco de dados.

## Organização de diretórios

o projeto possui os seguintes diretórios:

- `data` onde estarão os csv a serem analisados;
- `db` onde estará um projeto baseado no Prisma
  para controle do banco de dados;
- `scripts` onde estarão os scripts de consulta propostos em sala de aula;
- `docs` onde estará a documentação do projeto e de alguns dfiretórios específicos
  como: `scripts` e `db` ;

### Observações

1. O projeto utiliza o `make` para automatizar alguns processos do projeto;
2. O projeto Prisma está em fase de construção
3. Adicione as bibliotecas necessárias do Python com o seguinte comando:

```bash
cd /home/$USER/diretorio_do_projeto/
make python_requirements
```
