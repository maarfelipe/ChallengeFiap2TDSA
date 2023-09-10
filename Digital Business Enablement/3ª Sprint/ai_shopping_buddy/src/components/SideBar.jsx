import Link from "next/link";

export default function SideBar({ active }) {
    return (
        <nav className="flex flex-col bg-white w-64 p-6 h-full fixed">
            <div className="flex items-center justify-center mb-12">
                <Link href="/">
                    <img src="/logo.png" alt="Logo"/>
                </Link>
            </div>
            <ul className="flex-grow flex flex-col gap-4">
                <li>
                    <Link className={active === "gerar_recomendacao" ? "" : "hover-link"} href="/gerar_recomendacao">
                        Gerar Recomendação
                    </Link>
                </li>
                <li>
                    <Link className={active === "cadastrar_produtos" ? "" : "hover-link"} href="/cadastrar_produtos">
                        Cadastrar Produtos
                    </Link>
                </li>
                <li>
                    <Link className={active === "listar_produtos" ? "" : "hover-link"} href="/listar_produtos">
                        Listar Produtos
                    </Link>
                </li>
                <li>
                    <Link className={active === "cadastrar_usuario" ? "" : "hover-link"} href="/cadastrar_usuario">
                        Cadastrar Usuário
                    </Link>
                </li>
                <li>
                    <Link className={active === "buscar_usuario" ? "" : "hover-link"} href="/buscar_usuario">
                        Buscar Usuários
                    </Link>
                </li>
                <li>
                    <Link className={active === "ver_recomendacoes" ? "" :  "hover-link"} href="/ver_recomendacoes">
                        Recomendações
                    </Link>
                </li>
                <li>
                    <Link className={active === "recomendacoes_por_id" ? "" :  "hover-link"} href="/recomendacoes_por_id">
                        Buscar por ID
                    </Link>
                </li>
                <li>
                    <Link className={active === "recomendacoes_por_data" ? "" :  "hover-link"} href="/recomendacoes_por_data">
                        Buscar por Data
                    </Link>
                </li>
                <li>
                    <Link className={active === "recomendacoes_por_usuario" ? "" :  "hover-link"} href="/recomendacoes_por_usuario">
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
