import psycopg2
from time import sleep

conn = psycopg2.connect("dbname=notas user=dev password=dev host=localhost port=5030")
cur = conn.cursor()

def commit(text):
		global conn
		conn.commit()
		print(text)
		sleep(2)



print('inserindo dimensão lugar')
cur.execute('''INSERT INTO lugar
SELECT id, municipio, bairro FROM covid_testes;  
''')

commit('lugares inseridos')

print('inserindo dimensão comorbidade')

cur.execute(''' 
INSERT INTO comorbidade 
	SELECT 
		id,
		CASE
			WHEN pulmao_comorbidade = '-' 
			THEN NULL
			ELSE pulmao_comorbidade = 'Sim'
		END 
		AS pulmao_comorbidade,
		CASE 
			WHEN cardio_comorbidade = '-' 
			THEN NULL
			ELSE cardio_comorbidade = 'Sim'
		END 
		AS cardio_comorbidade,
		CASE 
			WHEN rins_comorbidade = '-' 
			THEN NULL
			ELSE rins_comorbidade = 'Sim'
		END 
		AS rins_comorbidade,
		CASE 
			WHEN diabetes_comorbidade = '-' 
			THEN NULL
			ELSE diabetes_comorbidade = 'Sim'
		END 
		AS diabetes_comorbidade,
		CASE 
			WHEN tabagismo_comorbidade = '-' 
			THEN NULL
			ELSE tabagismo_comorbidade = 'Sim'
		END 
		AS tabagismo_comorbidade,
		CASE 
			WHEN obesidade_comorbidade = '-' 
			THEN NULL
			ELSE obesidade_comorbidade = 'Sim'
		END 
		AS obesidade_comorbidade
	FROM covid_testes;
''')
commit('comorbidades inseridas')


print('inserindo dimensão sintoma')
cur.execute('''	
INSERT INTO sintoma
	SELECT
		id,
		CASE
			WHEN febre = '-' THEN NULL
			ELSE febre = 'Sim'
		END 
		AS febre,
		CASE
			WHEN dificuldade_respiratoria = '-' 
			THEN NULL
			ELSE dificuldade_respiratoria = 'Sim'
		END 
		AS dificuldade_respiratoria,
		CASE
			WHEN tosse = '-' THEN NULL
			ELSE tosse = 'Sim'
		END 
		AS tosse,
		CASE
			WHEN coriza = '-' THEN NULL
			ELSE coriza = 'Sim'
		END 
		AS coriza,
		CASE
			WHEN dor_garganta = '-' THEN NULL
			ELSE dor_garganta = 'Sim'
		END 
		AS dor_garganta,
		CASE
			WHEN diarreia = '-' THEN NULL
			ELSE diarreia = 'Sim'
		END 
		AS diarreia,
		CASE
			WHEN cefaleia = '-' THEN NULL
			ELSE cefaleia = 'Sim'
		END 
		AS cefaleia
	FROM covid_testes;
''')
commit('sintomas inseridos')


print('inserindo dimensão pessoa')
cur.execute(''' 
INSERT INTO pessoa 
	SELECT
		id,
		LEFT(idade_data_notificacao, 2)::INTEGER AS idade_ano,
		sexo,
		raca_cor,
		escolaridade,
		CASE
			WHEN gestante = 'Não se aplica' 
				OR gestante = 'Ignorado' 
				OR gestante = 'Idade gestacional ignorada' 
			THEN NULL
			ELSE gestante
		END 
		AS gestante,
		CASE
			WHEN profissional_saude = 'Ignorado' OR profissional_saude = 'Não Informado' 
			THEN NULL
			ELSE profissional_saude = 'Sim'
		END 
		AS profissional_saude,
		CASE
			WHEN possui_deficiencia = 'Não Informado' 
			THEN NULL
			ELSE possui_deficiencia = 'Sim'
		END
		AS profissional_saude,
		CASE
			WHEN morador_de_rua = 'Não Informado' 
			THEN NULL
			ELSE morador_de_rua = 'Sim'
		END 
		AS morador_de_rua
	FROM covid_testes
''')
commit('pessoas inseridas')


print('inserindo hospitalizados')
cur.execute('''
	INSERT INTO hospitalizado
		SELECT
			id,
			CASE 
				WHEN ficou_internado = 'Ignorado' OR ficou_internado = 'Não Informado' 
				THEN NULL
				ELSE ficou_internado = 'Sim'
			END
			AS ficou_internado
	FROM covid_testes;''')


commit('hospitalizados inseridos')
print('inserindo se estavam viajando')
cur.execute('''
INSERT INTO estava_viajando
	SELECT
		id,
		CASE 
			WHEN viagem_internacional = 'Ignorado' OR viagem_internacional = 'Não Informado' 
			THEN NULL
			ELSE viagem_internacional = 'Sim'
		END 
		AS viagem_internacional,
		CASE 
			WHEN viagem_brasil = 'Ignorado' or viagem_brasil = 'Não Informado' 
			THEN NULL
			ELSE viagem_brasil = 'Sim'
		END 
		AS viagem_brasil
	FROM covid_testes;
''')
commit('estavam viajando inseridos')


print('inserindo resultados')
cur.execute('''
INSERT INTO resultado_teste 
	SELECT
		id,
		CASE 
			WHEN sorologia_igg_resultado = 'Reagente'
				OR sorologia_resultado = 'Reagente'
				OR rt_pcr_resultado = 'Positivo'
				OR teste_rapido_resultado = 'Positivo' 
			THEN 'Positivo'
			ELSE
				CASE 
					WHEN sorologia_igg_resultado = 'Não Reagente'
						OR sorologia_resultado = 'Não Reagente'
						OR rt_pcr_resultado = 'Negativo'
						OR teste_rapido_resultado = 'Negativo' 
					THEN 'Negativo'
					ELSE 'Inconclusivo'
				END 
		END 
		AS resultado
	FROM covid_testes;
''')

commit('resultados concluidos')


# TODO: tirar dúvida com o professor: a dimensão tempo dá pra associar com quem não morreu?
# 																		se sim, é necessário alterar o schema?
# 																				uma solucão: adicionar o valor notificacao_data
#																					a tabela tempo e criar uma associacão.
#																								|=> vai afetar as análises?

# print('inserindo datas dos óbitos')
# cur.execute('''
# INSERT INTO tempo
# SELECT GENERATE_SERIES(1,1277,1) AS id,
# GENERATE_SERIES('2020-01-01'::date, '2023-06-30'::date, '1 day') AS obito_data;
# ''')
# commit('datas concluidas')

print('inserindo fatos -- MORTOS')

# t.id as dimensao_tempo,
cur.execute(''' 
INSERT INTO mortes 
	SELECT 
		ct.id AS id,
		ct.obito_data IS NOT NULL AS morreu,
		NULL AS dimensao_tempo,
		ct.id AS dimensao_lugar,
		ct.id AS dimensao_sintoma,
		ct.id AS dimensao_comorbidade,
		ct.id AS dimensao_resultado_teste,
		ct.id AS dimensao_pessoa,
		ct.id AS dimensao_hospitalizado,
		ct.id AS dimensao_viajou
	FROM covid_testes ct;
''')
# inner join tempo t on 
# to_timestamp(ct.obito_data, 'YYYY-MM-DD') = t.obito_data

commit('fatos inseridos')
print('FIM :)')
