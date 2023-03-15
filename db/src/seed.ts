import { PrismaClient } from "@prisma/client";
// import { parse } from "csv-parse";
import csv from "csv-parser"; // faz o parse do csv para objeto
import fs from "fs";  // File system: nativo node 
import { headers } from "./headers";
import { CovidTest } from './covidTest'
const prisma = new PrismaClient();
parser("../data/MICRODADOS.csv");

async function parser(filePath: string): Promise<Array<any>> {
	const result: CovidTest[] = [];
	fs.createReadStream(filePath)
		.pipe(
			csv({
				separator: ";",
        headers,
			})
		)
		.on("data", async (data) => {
			const test = new CovidTest(data)
			result.push(data);
			await prisma.covidTestsCsv.create({data: test})
		})
		.on("end", () => {
			
		});
	return [];
}


