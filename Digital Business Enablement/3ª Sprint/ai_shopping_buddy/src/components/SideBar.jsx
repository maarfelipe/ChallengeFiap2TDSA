import Link from "next/link";
import { CreditCardIcon } from "@heroicons/react/24/outline";

export default function SideBar({ active }) {
    return (
        <nav className="flex flex-col bg-white w-64 p-6 h-full fixed">
            <div className="flex items-center justify-center mb-12">
                <Link href="/">
                    <img src="/logo.png" alt="Logo" />
                </Link>
            </div>
            <ul className="flex-grow flex flex-col gap-4">
                <li className={`flex ${active === "gerar_recomendacao" ? "" : "hover-link"}`}>
                    <CreditCardIcon className="h-6 w-6 mr-2" />
                    <Link href="/gerar_recomendacao">
                        Gerar Recomendação
                    </Link>
                </li>
                <li className={`flex ${active === "cadastrar_produtos" ? "" : "hover-link"}`}>
                    <CreditCardIcon className="h-6 w-6 mr-2" />
                    <Link href="/cadastrar_produtos">
                        Cadastrar Produtos
                    </Link>
                </li>
                <li className={`flex ${active === "listar_produtos" ? "" : "hover-link"}`}>
                    <CreditCardIcon className="h-6 w-6 mr-2" />

                    <Link href="/listar_produtos">
                        Listar Produtos
                    </Link>
                </li>
                <li className={`flex ${active === "cadastrar_usuario" ? "" : "hover-link"}`}>
                    <CreditCardIcon className="h-6 w-6 mr-2" />
                    <Link className={active === "cadastrar_usuario" ? "" : "hover-link"} href="/cadastrar_usuario">
                        Cadastrar Usuário
                    </Link>
                </li>
                <li className={`flex ${active === "buscar_usuario" ? "" : "hover-link"}`}>
                    <CreditCardIcon className="h-6 w-6 mr-2" />
                    <Link href="/buscar_usuario">
                        Buscar Usuários
                    </Link>
                </li>
                <li className={`flex ${active === "ver_recomendacoes" ? "" : "hover-link"}`}>
                    <CreditCardIcon className="h-6 w-6 mr-2" />
                    <Link href="/ver_recomendacoes">
                        Recomendações
                    </Link>
                </li>
                <li className={`flex ${active === "recomendacoes_por_id" ? "" : "hover-link"}`}>
                    <CreditCardIcon className="h-6 w-6 mr-2" />
                    <Link href="/recomendacoes_por_id">
                        Buscar por ID
                    </Link>
                </li>
                <li className={`flex ${active === "recomendacoes_por_data" ? "" : "hover-link"}`}>
                    <CreditCardIcon className="h-6 w-6 mr-2" />
                    <Link href="/recomendacoes_por_data">
                        Buscar por Data
                    </Link>
                </li>
                <li className={`flex ${active === "recomendacoes_por_usuario" ? "" : "hover-link"}`}>
                    <CreditCardIcon className="h-6 w-6 mr-2" />
                    <Link href="/recomendacoes_por_usuario">
                        Buscar por Usuário
                    </Link>
                </li>
            </ul>

            <div>
                <Link href="/">
                    <span className="text-red-500">
                        Log Out
                    </span>
                </Link>
            </div>
        </nav>
    );
}
