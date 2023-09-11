import SideBar from "@/components/SideBar";
import DataRow from "./DataRow";

async function getUsuarios() {
    const url = "http://localhost:8080/aishoppingbuddy/api/usuario"
    const resp = await fetch(
        url,
        { headers: { Authorization: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlbWFpbDFAZ21haWwuY29tIiwiaXNzIjoiQUlTaG9wcGluZ0J1ZGR5IiwiZXhwIjoxNjk0NDcwMDE4fQ.B1jVW5bxqaMwgV1lPlmmO5tNgAAw8-ZslULXTp5Jkvk' } }
    )
    return resp.json()
}

export default async function BuscarUsuario() {
    const data = await getUsuarios();

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