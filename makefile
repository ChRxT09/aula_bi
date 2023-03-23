import:
	-make to_utf8
	-cat ./data/MICRODADOStratados.csv | PGPASSWORD=dev psql -h localhost -p 5030 -U dev -d teste -c \
	"\copy covid_testes( notificacao_data, cadastro_data, diagnostico_data, coleta_rt_pcr_data, coleta_teste_rapido_data, \
	coleta_sorologia_data, coleta_sorologia_igg_data, encerramento_data, obito_data, classificacao, evolucao, confirmacao_criterio, \
	status_notificacao, municipio, bairro, faixa_etaria, idade_data_notificacao, sexo, raca_cor, escolaridade, gestante, febre, dificuldade_respiratoria, \
	tosse, coriza, dor_garganta, diarreia, cefaleia, pulmao_comorbidade, cardio_comorbidade, rins_comorbidade, diabetes_comorbidade, tabagismo_comorbidade, \
	obesidade_comorbidade, ficou_internado, viagem_internacional, viagem_brasil, profissional_saude, possui_deficiencia, morador_de_rua, rt_pcr_resultado, \
	teste_rapido_resultado, sorologia_resultado, sorologia_igg_resultado, tipo_teste_rapido) FROM STDIN delimiter ';' csv"

preparedb:
	-cd db/ && yarn && yarn build && yarn prisma migrate deploy


to_utf8:
	-iconv -f iso-8859-1 -t utf-8 data/MICRODADOS.csv > data/MICRODADOStratados.csv
	-sed -i "s/d\"/d'/g" ./data/MICRODADOStratados.csv

query1:
	-python3 ./scripts/query1.py

python_requirements:
	-pip install requirements.txt -r