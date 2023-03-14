import { PrismaClient } from "@prisma/client";
// import { parse } from "csv-parse";
import csv from "csv-parser";
import fs from "fs";
import { headers } from "./headers";

const prisma = new PrismaClient();
parser("../data/MICRODADOS.csv");

async function parser(filePath: string): Promise<Array<any>> {
	const result: any = [];
	fs.createReadStream(filePath)
		.pipe(
			csv({
				separator: ";",
        headers,
			})
		)
		.on("data", (data) => {
			console.log(data);

			result.push(data);
		})
		.on("end", () => {
			console.log(result);
		});
	return [];
}

function parseTocovidTest(data: any) {}
