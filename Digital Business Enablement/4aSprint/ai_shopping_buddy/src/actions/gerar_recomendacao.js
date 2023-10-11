"use server"

import { revalidatePath } from "next/cache";
import { cookies } from "next/headers";

export async function create(formData){
    const url = "http://localhost:8080/aishoppingbuddy/api/recomendacao";
    const token = cookies().get("aishoppingbuddy_token")
    console.log(token);
    console.log(JSON.stringify(formData));
    const options = {
        method: "POST",
        body: JSON.stringify(formData),
        headers: {
            "Content-Type": "application/json",
            "Authorization": `Bearer ${token.value}`
        }
    }
    try {
        console.log({options})
        const resp = await fetch(url, options);
        console.log({resp});
        revalidatePath("/recomendacao")
        return { message: "ok" }
    } catch (error) {
        console.log({error})
        return { message: "Erro ao gerar" }
    }
}