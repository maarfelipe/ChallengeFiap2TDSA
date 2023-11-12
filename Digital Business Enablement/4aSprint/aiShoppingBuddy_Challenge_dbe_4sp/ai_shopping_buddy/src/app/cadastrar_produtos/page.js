"use client"

import SideBar from "@/components/SideBar";
import { useState } from "react";
import { create } from "@/actions/cadastrar_produto";
import { redirect, useRouter } from 'next/navigation';

export default function Cadastrar_Produtos() {
	const [erro, setErro] = useState("");
	const router = useRouter();

	const [nome, setNome] = useState("");
	const [tipo, setTipo] = useState("");
	const [valor, setValor] = useState("");
	const [descricao, setDescricao] = useState("");
	const [categoria, setCategoria] = useState("");


	async function onCreate() {
		const formData = {
			nome: nome,
			tipo: tipo,
			categoria: categoria,
			valor: valor,
			descricao: descricao

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
				<SideBar active="listar_produtos" />
			</div>
			<main className="p-10">
				<h2 className="text-2xl font-bold">Produtos</h2>
				<div className="p-4">
					<div className="mb-4">
						<input
							placeholder="Nome"
							className="border p-2 mb-2 block w-64"
							type="text"
							name="nome"
							id="nome"
							value={nome}
							onChange={(e) => setNome(e.target.value)}
						/>
						<input
							placeholder="Tipo"
							className="border p-2 mb-2 block w-64"
							type="text"
							name="tipo"
							id="tipo"
							value={tipo}
							onChange={(e) => setTipo(e.target.value)}
						/>
						<input
							placeholder="Categoria"
							className="border p-2 mb-2 block w-64"
							type="text"
							name="categoria"
							id="categoria"
							value={categoria}
							onChange={(e) => setCategoria(e.target.value)}
						/>
						<input
							placeholder="Valor"
							className="border p-2 mb-2 block w-64"
							type="number"
							name="valor"
							id="valor"
							value={valor}
							onChange={(e) => setValor(e.target.value)}
						/>
						<input
							placeholder="Descricao"
							className="border p-2 block w-64"
							type="text"
							name="descricao"
							id="descricao"
							value={descricao}
							onChange={(e) => setDescricao(e.target.value)}
						/>
					</div>
					<button
						onClick={onCreate}
						className="bg-purple-800 text-white py-2 px-4 rounded hover:bg-purple-600"
					>
						Submit
					</button>
					{erro && <p className="text-red-500">{erro}</p>}
				</div>
			</main>
		</div>
	);
}
