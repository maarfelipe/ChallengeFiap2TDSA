"use server"

import { revalidatePath } from "next/cache";
import { cookies } from 'next/headers'

export async function create(formData) {
    //console.log(token);
    //console.log({formData});
    const url = "http://localhost:8080/aishoppingbuddy/api/usuario";
    const token = cookies().get("aishoppingbuddy_token")
    console.log(token);
    //console.log(JSON.stringify(formData));  
    console.log({ formData });
    const options = {
        method: "POST",
        body: formData ? JSON.stringify(formData) : null,
        headers: {
            "Content-Type": "application/json",
            "Authorization": `Bearer ${token.value}`
        }
    }
    try {
        console.log({options})
        const resp = await fetch(url, options);
        console.log({resp})
        revalidatePath("/buscar_usuario")
        return { message: "ok" }
    } catch (error) {
        console.log({error})
        return { message: "Erro ao cadastrar" }
    }

}