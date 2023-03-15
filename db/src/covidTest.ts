import { booleanHeaders } from "./booleansHeaders";

// TODO: Encode to UTF-8
export class CovidTest {
	constructor(obj: any) {
		for (let key in obj) {
			if (key.endsWith("Date") && obj[key]) {
				const [YY, MM, DD] = obj[key].split(/\-/);
				const date = new Date(YY, MM - 1, DD);
				this[key] = date;
				continue;
			}
			if (booleanHeaders.includes(key) && obj[key]) {
				this[key] = !(obj[key] === "N�o");
				console.log(key, obj[key] );
        continue;
			}
			this[key] == obj[key]
		}
	}
}
