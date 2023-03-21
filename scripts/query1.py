import pandas as pd
table = pd.read_csv('data/MICRODADOStratados.csv', sep=';',encoding='utf-8')
print(table.query('Municipio == "CARIACICA" and ComorbidadeTabagismo == "Sim" and DataObito != ""'))