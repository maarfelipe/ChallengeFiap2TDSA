"use client"
import SideBar from "@/components/SideBar";
import { create } from "@/actions/gerar_recomendacao";
import { useRouter } from 'next/navigation';
import React, { useState } from 'react';

const SuaRecomendacao = () => {
  const [userID, setUserID] = useState('');
  const [camposProdutos, setCamposProdutos] = useState([{ id: 1, value: '' }]);
  
  const [erro, setErro] = useState('');
  const router = useRouter();

  const handleInputChange = (id, value) => {
    const novosCampos = camposProdutos.map(c => (c.id === id ? { ...c, value } : c));
    setCamposProdutos(novosCampos);
  };

  const addCampo = () => {
    const novoCampo = { id: camposProdutos.length + 1, value: '' };
    setCamposProdutos([...camposProdutos, novoCampo]);
  };

  const removeCampo = (id) => {
    const novosCampos = camposProdutos.filter(c => c.id !== id);
    setCamposProdutos(novosCampos);
  };

  const onCreate = async () => {
    const formData = {
      userID: userID,
      produtos: camposProdutos.map(campo => campo.value),
    };

    const resp = await create(formData);

    if (resp.message === "ok") {
      router.push("/ver_recomendacoes");
      return;
    }

    setErro(resp.message);
  };

  return (
    <div className="flex">
      <div className="w-64 mr-4">
        <SideBar active={"gerar_recomendacao"}/>
      </div>
      <div className="flex">
        <main className="p-10 w-500">
          <div>
            <h2 className="text-2xl font-bold">Gerar Recomendações</h2>
          </div>
          <div>
            <input
              placeholder="Digite o ID do Usuário"
              className="border p-2 mb-2 w-64"
              type="text"
              name="userid"
              label="userid"
              id="userid"
              value={userID}
              onChange={(e) => setUserID(e.target.value)}
            />
			<button
                onClick={addCampo}
                className="bg-purple-800 text-white py-2 px-4 rounded hover:bg-purple-600 ml-2 mb-2 w-41"
            >
                Adicionar Campo
            </button>
          </div>
          <div>
            {camposProdutos.map((campo) => (
              <div key={campo.id}>
                <input
                  placeholder="Digite o ID do Produto"
                  className="border p-2 mb-2 w-64"
                  type="text"
                  name="produtoId"
                  label="produtoId"
                  id="produtoId"
                  value={campo.value}
                  onChange={(e) => handleInputChange(campo.id, e.target.value)}
                />
                <button
                  onClick={() => removeCampo(campo.id)}
                  className="bg-purple-800 text-white py-2 px-4 rounded hover:bg-purple-600 ml-2 mb-2 w-41"
                >
                  Remover
                </button>
              </div>
            ))}
          </div>
          <div className="p-4 w-600">
            <button
              onClick={onCreate}
              className="bg-purple-800 text-white py-2 px-4 rounded hover:bg-purple-600 block"
            >
              Submit
            </button>
            <p className="text-red-500">{erro}</p>
          </div>
        </main>
      </div>
    </div>
  );
};

export default SuaRecomendacao;
