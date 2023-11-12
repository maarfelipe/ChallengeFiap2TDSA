import SideBar from "@/components/SideBar";
import { cookies } from "next/headers";
import DataRow from "./DataRow";
import React from "react";


async function getRecomendacao() {
	const url = "http://localhost:8080/aishoppingbuddy/api/recomendacao"
	const token = cookies().get("aishoppingbuddy_token");
	const resp = await fetch(
		url,
		{ headers: { "Content-Type": "application/json", "Authorization": `Bearer ${token.value}` } }
	)
	return resp.json()
}

export default async function Ver_Recomendacoes() {
	const data = await getRecomendacao();

	if(data.length === 0){
		return (
			<>
			<h1>Buscando Recomendacao</h1>
			</>
			)
		}
	return (
		<div className="flex">
			<div className="w-64 mr-4">
				<SideBar active={"ver_recomendacoes"}/>
			</div>
			<main>
				<div className="mb-4">
					<table className="min-w-full ml-5">
						<thead>
							<tr className="border-b border-gray-200">
								<th className="px-10">ID</th>
								<th className="px-8">ID do Parceiro</th>
								<th className="px-8">Nome do Parceiro</th>
								<th className="px-8">Data de Cadastro</th>
								<th className="px-8">CNPJ</th>
							</tr>
						</thead>
						<tbody>
							{data.content.map(recomendacao => <DataRow recomendacao={recomendacao} />)}
						</tbody>
					</table>
				</div>
			</main>
		</div>
	);
}