
import { revalidatePath } from "next/cache"

export async function create(formData){
    console.log(JSON.stringify(formData))
    const url = "http://localhost:8080/aishoppingbuddy/api/usuario"
    const options = {
        method: "POST",
        body: JSON.stringify(Object.fromEntries(formData)),
        headers: {
            "Content-Type": "application/json", 
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlbWFpbDFAZ21haWwuY29tIiwiaXNzIjoiQUlTaG9wcGluZ0J1ZGR5IiwiZXhwIjoxNjk0NDcwMDE4fQ.B1jVW5bxqaMwgV1lPlmmO5tNgAAw8-ZslULXTp5Jkvk"
        }
    }
    const resp = await fetch(url, options)
    if (resp.status !== 201){
        return {message: "Erro ao cadastrar"}
    }

    revalidatePath("/usuario")
    return {message: "ok"}

}