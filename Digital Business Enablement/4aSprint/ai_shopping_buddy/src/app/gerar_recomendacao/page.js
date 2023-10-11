import SideBar from "@/components/SideBar";
import { useState } from "react";
import { create } from "@/actions/cadastrar_usuario";

export default function Gerar_Recomendacao() {
	const [erro, setErro] = useState("");
	const router = useStateseRouter();

	const [ listProduto, setListProduto ] = useState("") ;

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
		<>
			<SideBar active={"gerar_recomendacao"}/>
		</>
	)
}