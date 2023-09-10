import SideBar from "@/components/SideBar";

async function getUsuarios() {
	const url = "http://localhost:8080/aishoppingbuddy/api/usuario"
	const resp = await fetch(
		url,
		{headers:{Authorization:'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlbWFpbDFAZ21haWwuY29tIiwiaXNzIjoiQUlTaG9wcGluZ0J1ZGR5IiwiZXhwIjoxNjk0MzkzNDU1fQ.k1fZOy305rNnhbo5F3NHVx1fXFaVplnHYtjHW4tfPNY'}}
	)
	return resp.json();
}

export default async function BuscarUsuario() {

	const data = await getUsuarios();

	return (
		<div className="flex">
			<div className="w-1/5">
				<SideBar active={"buscar_usuario"} />
			</div>

			<div className="w-4/5 p-4">
				<h1 className="text-2xl font-bold mb-4">Welcome to the AI Shopping Buddy</h1>
				<p>
					{JSON.stringify(data)}
				</p>
			</div>
		</div>
	)
}