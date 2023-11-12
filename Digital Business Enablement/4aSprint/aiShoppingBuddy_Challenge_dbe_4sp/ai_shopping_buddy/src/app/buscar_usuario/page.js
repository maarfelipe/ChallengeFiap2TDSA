import SideBar from "@/components/SideBar";
import DataRow from "./DataRow";
import { cookies } from "next/headers";
import React from "react";


async function getUsuarios() {
    const url = "http://localhost:8080/aishoppingbuddy/api/usuario"
    const token = cookies().get("aishoppingbuddy_token");
    const resp = await fetch(
        url,
        { headers: { Authorization: `Bearer ${token.value}` } }
    )
    return resp.json()
}

export default async function BuscarUsuario() {
    const data = await getUsuarios()

    if(data.length === 0){
    return (
        <>
        <h1>Buscando Usuários</h1>
        </>
        )
    }
    data?.content.sort((a, b) => {
        const nameA = a.nome.toUpperCase();
        const nameB = b.nome.toUpperCase();
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
      
        // names must be equal
        return 0;
      });
    return (
        <div className="flex">
            <div className="w-64 mr-4">
                <SideBar active={"buscar_usuario"} />
            </div>
            <main>
                <div className="mb-4">
                    <table className="min-w-full">
                        <thead>
                            <tr className="border-b border-gray-200">
                                <th className="px-6 py-2">ID</th>
                                <th className="px-6 py-2">Nome</th>
                                <th className="px-6 py-2">CPF</th>
                                <th className="px-6 py-2">CEP</th>
                                <th className="px-6 py-2">Data de Nascimento</th>
                                <th className="px-6 py-2">Gênero</th>
                            </tr>
                        </thead>
                        <tbody>
                            {data.content.map(usuario => <DataRow usuario={usuario} />)}
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    );
}