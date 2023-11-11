import DropMenu from "@/components/DropMenu";

export default function DataRow({ recomendacao }) {
    return (
        <tr>
            <td className="px-11 py-3">{recomendacao.id}</td>
            <td className="px-20 py-4">{recomendacao.parceiro.id}</td>
            <td className="px-20 py-3">{recomendacao.parceiro.nomeFantasia}</td>
            <td className="px-20 py-3">{recomendacao.parceiro.dataEntrada}</td>
            <td className="px-10 py-3">{recomendacao.parceiro.cnpj}</td>
            <DropMenu />
        </tr>
    );
}