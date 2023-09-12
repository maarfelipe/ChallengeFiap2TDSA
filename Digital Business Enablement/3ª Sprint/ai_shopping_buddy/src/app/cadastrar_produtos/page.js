"use client"

import SideBar from "@/components/SideBar";
import { useState } from "react";
import { create } from "@/actions/cadastrar_produto";
import { redirect, useRouter } from 'next/navigation';

export default function Cadastrar_Produtos() {
	const [erro, setErro] = useState("");
	const router = useRouter();

	const [nome,setNome] = useState("");
	const [tipo,setTipo] = useState("");
	const [valor,setValor] = useState("");
	const [descricao,setDescricao] = useState("");
	const [categoria,setCategoria] = useState("");
	

	async function onCreate() {
		const formData ={
			nome:nome,
			tipo:tipo,
			categoria:categoria,
			valor:valor,
			descricao:descricao
			
		}
		const resp = await create(formData); 
		if (resp.message === "ok") {
			router.push("/listar_produtos");
			return;
		}
		setErro(resp.message);
	}

	return (
		<div className="flex">
			<div className="w-64 mr-4">
				<SideBar active={"listar_produtos"} />
			</div>
			<main className="bg-slate-900 m-12 p-4 rounded">
				<h2 className="text-2xl font-bold">Produtos</h2>
				<div className="p-4">
					<input type="text" name="nome" label="nome" id="nome" value={nome} onChange={(e) => {setNome(e.target.value)}}/>
					<input type="text" name="tipo" label="tipo" id="tipo" value={tipo} onChange={(e) => {setTipo(e.target.value)}}/>
					<input type="text" name="categoria" label="categoria" id="categoria" value={categoria} onChange={(e) => {setCategoria(e.target.value)}}/>
					<input type="number" name="valor" label="valor" id="valor" value={valor} onChange={(e) => {setValor(e.target.value)}}/>
					<input type="text" name="descricao" label="descricao" id="descricao" value={descricao} onChange={(e) => {setDescricao(e.target.value)}}/>
					<button onClick={onCreate}>Submit</button>
					<p className="text-red-500">{erro}</p>
				</div>
			</main>
		</div>
	);
}
