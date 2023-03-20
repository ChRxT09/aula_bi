import { PrismaClient } from "@prisma/client";
// import { parse } from "csv-parse";
import csv from "csv-parser"; // faz o parse do csv para objeto
import fs from "fs";  // File system: nativo node 
import { headers } from "./headers";
import { CovidTest } from './covidTest'
const prisma = new PrismaClient();
parser("../data/MICRODADOStratados.csv");
let counter = 0
const interval = setInterval(() => console.log(`${counter} registros inseridos no banco`), 25000)

async function parser(filePath: string): Promise<Array<any>> {
	console.time('duracao')
	fs.createReadStream(filePath)
		.pipe(
			csv({
				separator: ";",
        headers,
			})
		)
		.on("data", async (data) => {
			const test = new CovidTest(data)
			await prisma.covidTestsCsv.create({data: test})
			counter++
		})
		.on("end", () => {
			clearInterval(interval)
			console.log('fim!')
			console.timeEnd('duracao')
		});
	return [];
}


