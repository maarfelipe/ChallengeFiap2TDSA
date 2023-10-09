import SideBar from "@/components/SideBar";
import DataRow from "./DataRow";
import React from "react";
import { cookies } from "next/headers";


async function getProdutos() {
	const url = "http://localhost:8080/aishoppingbuddy/api/produto"
	const token = cookies().get("aishoppingbuddy_token");
	const resp = await fetch(
		url,
		{ headers: { Authorization: `Bearer ${token.value}` } }
	)
	return resp.json()
}

export default async function ListarProdutos() {
	const data = await getProdutos();

	if(data.length === 0){
		return (
			<>
			<h1>Buscando Produtos</h1>
			</>
			)
		}
	return (
		<div className="flex">
			<div className="w-64 mr-4">
				<SideBar active={"listar_produtos"} />
			</div>
			<main>
				<div className="mb-4">
					<table className="min-w-full">
						<thead>
							<tr className="border-b border-gray-200">
								<th className="px-2">ID</th>
								<th className="px-2">Nome</th>
								<th className="px-2">Tipo</th>
								<th className="px-2">Valor</th>
								<th className="px-2">Descrição</th>
								<th className="px-2">Categoria</th>
								<th className="px-2">ID do Parceiro</th>
								<th className="px-2">Nome do Parceiro</th>
								<th className="px-2">Data de Cadastro</th>
								<th className="px-2">CNPJ</th>
							</tr>
						</thead>
						<tbody>
							{data.content.map(produto => <DataRow produto={produto} />)}
						</tbody>
					</table>
				</div>
			</main>
		</div>
	);
}