"use client"
import SideBar from "@/components/SideBar";
import { useState } from "react";
import { create } from "@/actions/cadastrar_usuario";
import { redirect, useRouter } from 'next/navigation';

export default function CadastrarUsuario() {
	const [erro, setErro] = useState("");
	const router = useRouter();

	const [nome, setNome] = useState("");
	const [cpf, setCpf] = useState("");
	const [cep, setCep] = useState("");
	const [genero, setGenero] = useState("M");
	const [dataNascimento, setDataNascimento] = useState("");

	async function onCreate() {
		const formData = {
			nome: nome,
			cep: cep,
			cpf: cpf,
			genero: genero,
			dataNascimento: dataNascimento.split('-').map(parseFloat)
		}
		const resp = await create(formData);
		if (resp.message === "ok") {
			router.push("/buscar_usuario");
			return;
		}
		setErro(resp.message);
	}

	return (
		<div className="flex">
		  <div className="w-64 mr-4">
			<SideBar active={"buscar_usuario"} />
		  </div>
		  <main className="p-10">
			<h2 className="text-2xl font-bold">Usuario</h2>
			<div className="p-4">
			  <div className="mb-4">
				<input
				  placeholder="Nome"
				  className="border p-2 mb-2 block w-64"
				  type="text"
				  name="nome"
				  label="nome"
				  id="nome"
				  value={nome}
				  onChange={(e) => { setNome(e.target.value) }} />
				<input
				  placeholder="Digite seu CPF"
				  className="border p-2 mb-2 block w-64"
				  type="text"
				  name="cpf"
				  label="cpf"
				  id="cpf"
				  value={cpf} onChange={(e) => { setCpf(e.target.value) }} />
				<input
				  placeholder="Digite seu CEP"
				  className="border p-2 mb-2 block w-64"
				  type="text"
				  name="cep"
				  label="cep"
				  id="cep"
				  value={cep}
				  onChange={(e) => { setCep(e.target.value) }} />
				<select
				  className="border p-2 mb-2 block w-64"
				  name="genero"
				  label="genero"
				  id="genero"
				  value={genero}
				  onChange={(e) => { setGenero(e.target.value) }}>
				  <option value="M">Masculino</option>
				  <option value="F">Feminino</option>
				  <option value="NB">Não Binário</option>
				</select>
				<input
				  className="border p-2 mb-2 block w-64"
				  type="date"
				  name="dataNascimento"
				  label="dataNascimento"
				  id="dataNascimento"
				  value={dataNascimento} onChange={(e) => { setDataNascimento(e.target.value) }} />
				<button
				  onClick={onCreate}
				  className="bg-purple-800 text-white py-2 px-4 rounded hover:bg-purple-600"
				>Submit</button>
				<p className="text-red-500">{erro}</p>
			  </div>
			</div>
		  </main>
		</div>
	  );
	}
	