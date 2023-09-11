"use client"
import SideBar from "@/components/SideBar";
import Button from "@/components/Button";
import InputText from "@/components/InputText";
import { PlusIcon } from "@heroicons/react/24/outline";
import { useState } from "react";



async function getUsuarios() {
    const url = "http://localhost:8080/aishoppingbuddy/api/cadastrar_usuario"
    const resp = await fetch(
        url,
        { headers: { Authorization: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlbWFpbDFAZ21haWwuY29tIiwiaXNzIjoiQUlTaG9wcGluZ0J1ZGR5IiwiZXhwIjoxNjk0NDcwMDE4fQ.B1jVW5bxqaMwgV1lPlmmO5tNgAAw8-ZslULXTp5Jkvk' } }
    )
    return resp.json()
}
export default function CadastrarUsuario() {
	const [erro, setErro] = useState("");
  
	async function onCreate(formData) {
	  const resp = await create(formData); // Certifique-se de que a função create existe e faz o que é esperado
	  if (resp.message === "ok") {
		redirect("/usuario");
		return;
	  }
	  setErro(resp.message);
	}
  
	return (
	  <div className="flex">
		<div className="w-64 mr-4">
		  <SideBar active={"buscar_usuario"} />
		</div>
		<main className="bg-slate-900 m-12 p-4 rounded">
		  <h2 className="text-2xl font-bold">Criar conta</h2>
		  <div className="flex justify-between items-center">
			<h2 className="text-2xl font-bold">Usuario</h2>
			<Button icon={<PlusIcon className="h-6 w-6" />} href="/usuario/form">
			  Cadastrar Usuario
			</Button>
		  </div>
		  <form onSubmit={onCreate} className="p-4">
			<InputText name="nome" label="nome" id="nome" />
			<InputText name="cpf" label="cpf" id="cpf" />
			<InputText name="cep" label="cep" id="cep" />
			
  
			<div className="flex justify-around mt-4">
			  <Button href="/contas" variant="secondary">
				Cancelar
			  </Button>
			  <Button type="submit">Salvar</Button>
			</div>
			<p className="text-red-500">{erro}</p>
		  </form>
		</main>
	  </div>
	);
  }