import DropMenu from "@/components/DropMenu";

export default function DataRow({ produto }) {
    return (
        <tr>
            <td className="px-4 py-2">{produto.id}</td>
            <td className="px-4 py-2">{produto.nome}</td>
            <td className="px-4 py-2">{produto.tipo}</td>
            <td className="px-4 py-2">{produto.valor}</td>
            <td className="px-4 py-2">{produto.descricao}</td>
            <td className="px-4 py-2">{produto.categoria}</td>
            <td className="px-8 py-2">{produto.parceiro.id}</td>
            <td className="px-10 py-2">{produto.parceiro.nomeFantasia}</td>
            <td className="px-10 py-2">{produto.parceiro.dataEntrada}</td>
            <td className="px-10 py-2">{produto.parceiro.cnpj}</td>
            <DropMenu />
        </tr>
    );
}
