"use server"

import { revalidatePath } from "next/cache";
import { getToken } from "./get_token";

export async function create(formData){
    const url = "http://localhost:8080/aishoppingbuddy/api/usuario";
    const token = getToken();
    console.log(token);
    console.log(JSON.stringify(formData));
    const options = {
        method: "POST",
        body: JSON.stringify(formData),
        headers: {
            "Content-Type": "application/json",
            "Authorization": `Bearer ${token}`
        }
    }
    const resp = await fetch(url, options);
    if (resp.status !== 201){
        return {message: "Erro ao cadastrar"}
    }
    revalidatePath("/buscar_usuario")
    return {message: "ok"}

}