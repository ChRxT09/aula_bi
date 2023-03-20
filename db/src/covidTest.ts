import { booleanHeaders } from "./booleansHeaders";
import buffer from "buffer";
// TODO: Encode to UTF-8
export class CovidTest {
	constructor(obj: any) {
		for (let key in obj) {
			if (key.endsWith("Date")) {
				if (obj[key]) {
					const [YY, MM, DD] = obj[key].split(/\-/);
					const date = new Date(YY, MM - 1, DD);
					this[key] = date;
					continue;
				} else {
					this[key] = undefined;
					continue;
				}
			}
			if (booleanHeaders.includes(key) && obj[key]) {
				if (obj[key] === "Não se aplica") {
					this[key] = false;
				} else {
					this[key] = obj[key] === "Sim";
				}
				continue;
			} else {
				this[key] = obj[key];
			}
		}
	}
}
