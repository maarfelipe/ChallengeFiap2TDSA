import Link from "next/link";

export default function SideBar({ active }) {
    return (
        <nav className="flex flex-col bg-white w-64 p-6 h-full fixed">
            <div className="flex items-center justify-center mb-12">
                <Link href="/">
                    <img src="/logo.png" alt="Logo" className="w-38" />
                </Link>
            </div>
            <ul className="flex-grow flex flex-col gap-4">
                <li>
                    <Link className={active === "gerar_recomendacao" ? "" : "hover-link"} href="/">
                        Gerar Recomendação
                    </Link>
                </li>
                <li>
                    <Link className={active === "cadastrar_produtos" ? "text-slate-100" : "hover-link"} href="/">
                        Cadastrar Produtos
                    </Link>
                </li>
                <li>
                    <Link className={active === "listar_produtos" ? "text-slate-100" : "hover-link"} href="/">
                        Listar Produtos
                    </Link>
                </li>
                <li>
                    <Link className={active === "cadastrar_usuario" ? "text-slate-100" : "hover-link"} href="/">
                        Cadastrar Usuário
                    </Link>
                </li>
                <li>
                    <Link className={active === "buscar_usuario" ? "text-slate-100" : "hover-link"} href="/">
                        Buscar Usuário
                    </Link>
                </li>
                <li>
                    <Link className={active === "todas_recomendacoes" ? "text-slate-100" : "hover-link"} href="/">
                        Todas Recomendações
                    </Link>
                </li>
                <li>
                    <Link className={active === "buscar_por_id" ? "text-slate-100" : "hover-link"} href="/">
                        Buscar por ID
                    </Link>
                </li>
                <li>
                    <Link className={active === "buscar_por_data" ? "text-slate-100" : "hover-link"} href="/">
                        Buscar por Data
                    </Link>
                </li>
                <li>
                    <Link className={active === "buscar_por_usuario" ? "text-slate-100" : "hover-link"} href="/">
                        Buscar por Usuário
                    </Link>
                </li>
            </ul>

            <div className="mt-auto">
                <div className="h-12 w-12 rounded-full overflow-hidden">
                    <img src="https://i.pravatar.cc/100" alt="avatar do usuário" />
                </div>
            </div>
        </nav>
    );
}
