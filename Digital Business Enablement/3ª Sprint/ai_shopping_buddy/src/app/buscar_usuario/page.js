import SideBar from "@/components/SideBar";

async function getUsuarios() {
	const url = "http://localhost:8080/aishoppingbuddy/api/usuario"
	const resp = await fetch(url, {header: {Authorization: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlbWFpbDFAZ21haWwuY29tIiwiaXNzIjoiQUlTaG9wcGluZ0J1ZGR5IiwiZXhwIjoxNjk0MzkxMDQ5fQ.2gtRBTTslk7vdMYsWtN41VY1r6HZ-XRwTc9Icr2hlyo"} })
	const data = await resp.json()
	console.log(data) 
}

export default async function BuscarUsuario() {

	return (
		<div className="flex">
			{/* <div className="w-1/5">
				<SideBar active={"buscar_usuario"} />
			</div> */}

			<div className="w-4/5 p-4">
				<h1 className="text-2xl font-bold mb-4">Welcome to the AI Shopping Buddy</h1>
				<p>
					teste
				</p>
			</div>
		</div>
	)
}