# PROJETO BI

primeiramente, baixe o arquivo `MICRODADOS.csv` no site
do painel da COVID-19 [clicando aqui](https://coronavirus.es.gov.br/painel-covid-19-es) e, em seguida, copie e cole o
arquivo na pasta `data` do projeto.

### consulta do exercício proposto
``` bash
make query1
```


## Baixando o GNU Make

o GNU Make irá agilizar algumas tarefas do projeto. Para instalar, digite no terminal:

```bash
sudo apt update && sudo apt upgrade
sudo apt install make -y
```

## Preparando o banco

Crie uma database no Postgresql e, em seguida, pegue o link do banco.
Depois, copie o arquivo `env.example` e cole no mesmo diretório em que se localiza, renomeando para `.env`. Cole o link na variável `DATABASE_URL`.

## _All-in-one Command_

Para executar todos os scripts necessários de uma vez só, utilize o seguinte comando no terminal:

```bash
cd /home/$USER/diretorio_do_projeto/
make etl
```

caso seja necessário, consulte o arquivo `scripts.md` para conferir os scripts
que podem ser executados com o GNU Make.

### Organização de diretórios

o projeto possui os seguintes diretórios:

- `data` onde estarão os csv a serem analisados;
- `db` onde estará um projeto baseado no Prisma
  para controle do banco de dados;
- `scripts` onde estarão os scripts Python de consulta e manipulação
de dados;
- `docs` onde estará a documentação do projeto e de alguns diretórios específicos
  como: `scripts` e `db` ;
