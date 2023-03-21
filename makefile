import:
	psql -h localhost -p 5030 -U dev -d teste -c "\copy covid_testes FROM './data/MICRODADOStratados.csv' delimiter ';' csv"
	make to_utf8

to_utf8:
	iconv -f iso-8859-1 -t utf-8 data/MICRODADOS.csv > data/MICRODADOStratados.csv

query1:
	python3 ./scripts/query1.py
