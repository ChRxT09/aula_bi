# PROJETO BI

primeiramente, baixe o arquivo `MICRODADOS.csv` no site
do painel da COVID-19 [clicando aqui](https://coronavirus.es.gov.br/painel-covid-19-es) e, em seguida, copie e cole o
arquivo na pasta `data` do projeto

depois, execute o comando a seguir no terminal linux

```bash
cd /home/$USER/diretorio_do_projeto/
make to_utf8
```

ele converterá o arquivo do encode `LATIN1` para `UTF-8`
e o deixará no arquivo de nome `MICRODADOStratados.csv`.

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
