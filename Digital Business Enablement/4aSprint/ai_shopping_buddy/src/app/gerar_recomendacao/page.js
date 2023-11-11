"use client"
import SideBar from "@/components/SideBar";
import { useState } from "react";
import { create } from "@/actions/gerar_recomendacao";
import { useRouter } from 'next/navigation';

export default function Gerar_Recomendacao() {
	const [erro, setErro] = useState("");
	const router = useRouter();

	const [userID, setUserID] = useState("");
	const [produtoId, setProdutoID] = useState("");

	const [campo, setCampos] = useState([{ id: 1, value: '' }]);

	const addCampo = () => {
		const newCampo = { id: campo.length + 1, value: '' };
		setCampos([...campo, newCampo]);
	};

	const removeCampo = (id) => {
		const updatedCampos = campo.filter((campo) => campo.id !== id);
		setCampos(updatedCampos);
	};

	async function onCreate() {
		const formData = {
			listProduto: listProduto,
		}
		const resp = await create(formData);
		if (resp.message === "ok") {
			router.push("/ver_recomendacoes");
			return;
		}
		setErro(resp.message);
	}

	return (
		<div className="flex">
			<div className="w-64 mr-4">
				<SideBar active={"gerar_recomendacao"}/>
			</div>
			<main className="p-10 w-500">
			<h2 className="text-2xl font-bold">Gerar Recomendações</h2>
			<div className="p-4 w-600">
			  <div className="mb-4">
				<input
				  placeholder="Digite o ID do Usuário"
				  className="border p-2 mb-2 block w-64"
				  type="text"
				  name="userid"
				  label="userid"
				  id="userid"
				  value={userID}
				  onChange={(e) => { setUserID(e.target.value) }} />
				<input
				  placeholder="Digite o ID do Produto"
				  className="border p-2 mb-2 w-64"
				  type="text"
				  name="produtoId"
				  label="produtoId"
				  id="produtoId"
				  value={produtoId} onChange={(e) => { setProdutoID(e.target.value) }} />
				  <button 
				  	onClick={addCampo}
					className="bg-purple-800 text-white py-2 px-4 rounded hover:bg-purple-600 ml-2 mb-2 w-41"
					>Adicionar Campo</button>
				<button
				  onClick={onCreate}
				  className="bg-purple-800 text-white py-2 px-4 rounded hover:bg-purple-600 block"
				>Submit</button>
				<p className="text-red-500">{erro}</p>
			  </div>
			</div>
		  </main>
		</div>
		
	)
}