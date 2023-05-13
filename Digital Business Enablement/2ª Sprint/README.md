# DIGITAL BUSINESS ENABLEMENT

**Documentação (30%)**

Documento no formato pdf ou readme.md contendo:

- Objetivo e escopo do projeto: descrever a solução proposta pelo grupo de forma textual.
- Arquitetura da solução: digrama de blocos com os principais componentes da aplicação de forma que eles se comunicam.
- Tabela dos endpoints atualizada.

**Implementação do backend (70%)**

Implementação de uma API RESTful com as principais funcionalidades da solução proposta.

Entrega: Código fonte e documentação devem ser entregues via link de repositório do GitHub.

## Diagrama de Classes
![DIAGRAMA](diagrama_uml.png)

## Endpoints
- Parceiro de Negócios
  - [Cadastrar Parceiro](#cadastrar-parceiro)
  - [Listar Todos Parceiros](#listar-parceiros)
  - [Apagar Parceiro](#apagar-parceiro)
  - [Atualizar Parceiro](#atualizar-parceiro)
  - [Detalhar Parceiro](#detalhar-parceiro)
  - [Cadastrar transações do dia](#cadastrar-transações-do-dia)
- Recomendações
  - [Criar mensagem personalizada](#criar-mensagem-personalizada)
  - [Listar todas Recomendações](#listar-todas-recomendações)
  - [Listar Recomendações por data](#listar-recomendações-por-data)
  - [Listar Recomendação por id](#listar-recomendação-por-id)
  - [Listar Recomendações por usuário](#listar-recomendações-por-usuário)

## PARCEIRO DE NEGÓCIOS

### Cadastrar Parceiro

`POST` /aishoppingbuddy/api/parceiro

*Campos de requisição*

| campo            | tipo   | obrigatório | descrição                         |
|------------------|--------|:-----------:|-----------------------------------|
| id               | long   |     sim     | Número indentificador do parceiro |
| nomeFantasia     | String |     sim     | Nome Fantasia do parceiro         |
| dataEntrada      | Date   |     sim     | Data de Entrada do parceiro       |
| dataEncerramento | Date   |     não     | Data de Encerramento do parceiro  |
| cnpj             | String |     sim     | CPNJ do parceiro                  |

*Exemplo de requisição*
```
{
  "id": 1364,
  "nomeFantasia": 'MercadoLivre',
  "dataEntrada": '2023-06-04',
  "dataSaida": null,
  "cnpj": '19951232000153'
}
```

*Resposta*

| código | descrição                             |
|--------|---------------------------------------|
| 201    | o parceiro foi cadastrado com sucesso |
| 400    | dados inválidos                       |

### Listar Parceiros

`GET` /aishoppingbuddy/api/parceiro

*Exemplo de resposta*
```
[
  {
    "id": 1364,
    "nomeFantasia": 'MercadoLivre',
    "dataEntrada": '2023-06-04',
    "dataSaida": null,
    "cnpj": '19951232000153'
  },
  {
    "id": 2432,
    "nomeFantasia": 'Amazon',
    "dataEntrada": '2023-21-07',
    "dataSaida": null,
    "cnpj": '17393772000133'
  }
]
```

*Resposta*

| código | descrição                             |
|--------|---------------------------------------|
| 200    | os dados foram retornados com sucesso |

### Apagar Parceiro

`DELETE` /aishoppingbuddy/api/parceiro/{id}

*Resposta*

| código | descrição                                      |
|--------|------------------------------------------------|
| 200    | o parceiro foi removido com sucesso            |
| 404    | não foi possível achar um parceiro com esse id |

### Atualizar Parceiro

`PUT` /aishoppingbuddy/api/parceiro/{id}

*Campos de requisição*

| campo            | tipo   | obrigatório | derscrição                        |
|------------------|--------|:-----------:|-----------------------------------|
| id               | long   |     sim     | Número indentificador do parceiro |
| nomeFantasia     | String |     sim     | Nome Fantasia do parceiro         |
| dataEntrada      | Date   |     sim     | Data de Entrada do parceiro       |
| dataEncerramento | Date   |     não     | Data de Encerramento do parceiro  |
| cnpj             | String |     sim     | CPNJ do parceiro                  |

*Exemplo de requisição*
```
{
  "id": 1364,
  "nomeFantasia": 'MercadoLivre',
  "dataEntrada": '2023-06-04',
  "dataSaida": null,
  "cnpj": '19951232000153'
}
```

*Resposta*

| código | descrição                                      |
|--------|------------------------------------------------|
| 200    | o parceiro foi atualizado com sucesso          |
| 404    | não foi possível achar um parceiro com esse id |

### Detalhar Parceiro

`GET` /aishoppingbuddy/api/parceiro/{id}

*Exemplo de resposta*
```
{
  "id": 1364,
  "nomeFantasia": 'MercadoLivre',
  "dataEntrada": '2023-06-04',
  "dataSaida": null,
  "cnpj": '19951232000153'
}
```

*Resposta*

| código | descrição                                      |
|--------|------------------------------------------------|
| 200    | o parceiro foi detalhado com sucesso           |
| 404    | não foi possível achar um parceiro com esse id |

### Cadastrar Transações do dia

`POST` /aishoppingbuddy/api/parceiro/transacoes

*Campos de requisição*

| campo      | tipo             | obrigatório | descrição                                      |
|------------|------------------|:-----------:|------------------------------------------------|
| transacoes | List<Transacoes> |     sim     | Lista de todas as transacoes realizadas no dia |

*Exemplo de requisição*
```
{
  "transacoes":[
    {
      "id":1247,
      "valorTotal":10000.00,
      "cep":'69312545',
      "data": '2023-12-27T10:30',
      "cancelado": False,
      "parceiro": {
        "id": 1364,
        "nomeFantasia": 'MercadoLivre',
        "dataEntrada": '2023-06-04',
        "dataSaida": null,
        "cnpj": '19951232000153'
      },
      "usuario":{
        "id":4234,
        "nome":'Pedro de Ferreira Silva',
        "cpf":'90010571019',
        "cep":'77826025',
        "dataNascimento":'1998-06-21'
        "genero":'M'
      },
      "produtos": [
        {
          "id": 5641,
          "nome": 'Iphone 15 S',
          "tipo": 'Celular',
          "descricao": 'Celular Iphone Apple 15 S 128GB',
          "categoria": 'Eletrônicos',
          "valor": 5000.00
        },
        {
          "id": 5641,
          "nome": 'Iphone 15 S',
          "tipo": 'Celular',
          "descricao": 'Celular Iphone Apple 15 S 128GB',
          "categoria": 'Eletrônicos',
          "valor": 5000.00
        }
      ]
    },
    {
      "id":1247,
      "valorTotal":10000.00,
      "cep":'69312545',
      "data": '2023-12-27T10:30',
      "cancelado": True,
      "parceiro": {
        "id": 1364,
        "nomeFantasia": 'MercadoLivre',
        "dataEntrada": '2023-06-04',
        "dataSaida": null,
        "cnpj": '19951232000153'
      },
      "usuario":{
        "id":4234,
        "nome":'Pedro de Ferreira Silva',
        "cpf":'90010571019',
        "cep":'77826025',
        "dataNascimento":'1998-06-21'
        "genero":'M'
      },
      "produtos": [
        {
          "id": 5641,
          "nome": 'Iphone 15 S',
          "tipo": 'Celular',
          "descricao": 'Celular Iphone Apple 15 S 128GB',
          "categoria": 'Eletrônicos',
          "valor": 5000.00
        },
        {
          "id": 5641,
          "nome": 'Iphone 15 S',
          "tipo": 'Celular',
          "descricao": 'Celular Iphone Apple 15 S 128GB',
          "categoria": 'Eletrônicos',
          "valor": 5000.00
        }
      ]
    }
  ]
}
```

*Resposta*

| código | descrição                                      |
|--------|------------------------------------------------|
| 201    | transações do dia cadastradas com sucesso      |
| 404    | não foi possível achar um parceiro com esse id |

## RECOMENDAÇÃO

## Criar mensagem personalizada

`POST` /aishoppingbuddy/api/parceiro/{id}/transacoes

Cria uma recomendação no banco e cria a resposta do

*Campos de requisição*

| campo      | tipo             | obrigatório | descrição                                      |
|------------|------------------|:-----------:|------------------------------------------------|
| transacoes | List<Transacoes> |     sim     | Lista das transacões para fazer a recomendação |

*Exemplo de requisição*
```
{
  "transacoes":[
    {
      "id":1247,
      "valorTotal":10000.00,
      "cep":'69312545',
      "data": '2023-12-27T10:30',
      "cancelado": True,
      "parceiro": {
        "id": 1364,
        "nomeFantasia": 'MercadoLivre',
        "dataEntrada": '2023-06-04',
        "dataSaida": null,
        "cnpj": '19951232000153'
      },
      "usuario":{
        "id":4234,
        "nome":'Pedro de Ferreira Silva',
        "cpf":'90010571019',
        "cep":'77826025',
        "dataNascimento":'1998-06-21'
        "genero":'M'
      },
      "produtos": [
        {
          "id": 5641,
          "nome": 'Iphone 15 S',
          "tipo": 'Celular',
          "descricao": 'Celular Iphone Apple 15 S 128GB',
          "categoria": 'Eletrônicos',
          "valor": 5000.00
        },
        {
          "id": 5641,
          "nome": 'Iphone 15 S',
          "tipo": 'Celular',
          "descricao": 'Celular Iphone Apple 15 S 128GB',
          "categoria": 'Eletrônicos',
          "valor": 5000.00
        }
      ]
    },
    {
      "id":1247,
      "valorTotal":10000.00,
      "cep":'69312545',
      "data": '2023-12-27T10:30',
      "cancelado": True,
      "parceiro": {
        "id": 1364,
        "nomeFantasia": 'MercadoLivre',
        "dataEntrada": '2023-06-04',
        "dataSaida": null,
        "cnpj": '19951232000153'
      },
      "usuario":{
        "id":4234,
        "nome":'Pedro de Ferreira Silva',
        "cpf":'90010571019',
        "cep":'77826025',
        "dataNascimento":'1998-06-21'
        "genero":'M'
      },
      "produtos": [
        {
          "id": 5641,
          "nome": 'Iphone 15 S',
          "tipo": 'Celular',
          "descricao": 'Celular Iphone Apple 15 S 128GB',
          "categoria": 'Eletrônicos',
          "valor": 5000.00
        },
        {
          "id": 5641,
          "nome": 'Iphone 15 S',
          "tipo": 'Celular',
          "descricao": 'Celular Iphone Apple 15 S 128GB',
          "categoria": 'Eletrônicos',
          "valor": 5000.00
        }
      ]
    }
  ]
}
```

*Exemplo de Resposta*
```
{
  "mensagem":'Olá Pedro,Espero que esteja bem! Se você está procurando um celular novo, eu recomendo fortemente os dispositivos da Samsung. Eles oferecem uma excelente combinação de desempenho, qualidade de construção e recursos. Se você está procurando um celular com tela grande e excelente câmera, o Samsung Galaxy S21 Ultra é uma ótima escolha. Para quem quer algo um pouco mais acessível, o Samsung Galaxy A52 é uma ótima opção com excelente bateria e desempenho.De qualquer forma, os celulares da Samsung são uma escolha confiável e certamente não vão te decepcionar. Atenciosamente, AI Chatting Buddy'
}
```

*Resposta*

| código | descrição                                 |
|--------|-------------------------------------------|
| 201    | mensagem personalizada criada com sucesso |
| 400    | dados inválidos                           |

### Listar Todas Recomendações

`GET` /aishoppingbuddy/api/recomendacoes

*Exemplo de resposta*
```
[
  {
    "id": 1364,
    "data": '2023-06-04',
    "mensagem": 'Olá Pedro,Espero que esteja bem! Se você está procurando um celular novo, eu recomendo fortemente os dispositivos da Samsung. Eles oferecem uma excelente combinação de desempenho, qualidade de construção e recursos. Se você está procurando um celular com tela grande e excelente câmera, o Samsung Galaxy S21 Ultra é uma ótima escolha. Para quem quer algo um pouco mais acessível, o Samsung Galaxy A52 é uma ótima opção com excelente bateria e desempenho.De qualquer forma, os celulares da Samsung são uma escolha confiável e certamente não vão te decepcionar. Atenciosamente, AI Chatting Buddy',
    "transacoes": [
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
        "parceiro": {
          "id": 1364,
          "nomeFantasia": 'MercadoLivre',
          "dataEntrada": '2023-06-04',
          "dataSaida": null,
          "cnpj": '19951232000153'
        },
        "usuario":{
          "id":4234,
          "nome":'Pedro de Ferreira Silva',
          "cpf":'90010571019',
          "cep":'77826025',
          "dataNascimento":'1998-06-21'
          "genero":'M'
        },
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
        },
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
        "parceiro": {
          "id": 1364,
          "nomeFantasia": 'MercadoLivre',
          "dataEntrada": '2023-06-04',
          "dataSaida": null,
          "cnpj": '19951232000153'
        },
        "usuario":{
          "id":4234,
          "nome":'Pedro de Ferreira Silva',
          "cpf":'90010571019',
          "cep":'77826025',
          "dataNascimento":'1998-06-21'
          "genero":'M'
        },
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
      }
    ],
    "produtos": [
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      },
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      }
    ]
  },
  {
    "id": 1364,
    "data": '2023-06-04',
    "mensagem": 'Olá Pedro,Espero que esteja bem! Se você está procurando um celular novo, eu recomendo fortemente os dispositivos da Samsung. Eles oferecem uma excelente combinação de desempenho, qualidade de construção e recursos. Se você está procurando um celular com tela grande e excelente câmera, o Samsung Galaxy S21 Ultra é uma ótima escolha. Para quem quer algo um pouco mais acessível, o Samsung Galaxy A52 é uma ótima opção com excelente bateria e desempenho.De qualquer forma, os celulares da Samsung são uma escolha confiável e certamente não vão te decepcionar. Atenciosamente, AI Chatting Buddy',
    "transacoes": [
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
        "parceiro": {
          "id": 1364,
          "nomeFantasia": 'MercadoLivre',
          "dataEntrada": '2023-06-04',
          "dataSaida": null,
          "cnpj": '19951232000153'
        },
        "usuario":{
          "id":4234,
          "nome":'Pedro de Ferreira Silva',
          "cpf":'90010571019',
          "cep":'77826025',
          "dataNascimento":'1998-06-21'
          "genero":'M'
        },
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
        },
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
          "parceiro": {
          "id": 1364,
          "nomeFantasia": 'MercadoLivre',
          "dataEntrada": '2023-06-04',
          "dataSaida": null,
          "cnpj": '19951232000153'
        },
        "usuario":{
          "id":4234,
          "nome":'Pedro de Ferreira Silva',
          "cpf":'90010571019',
          "cep":'77826025',
          "dataNascimento":'1998-06-21'
          "genero":'M'
        },
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
      }
    ],
    "produtos": [
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      },
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      }
    ]
  },
]
```

*Resposta*

| código | descrição                             |
|--------|---------------------------------------|
| 200    | os dados foram retornados com sucesso |

### Listar Recomendações por data

`GET` /aishoppingbuddy/api/recomendacoes/data/{data}

*Exemplo de resposta*
```
[
  {
    "id": 1364,
    "data": '2023-06-04',
    "mensagem": 'Olá Pedro,Espero que esteja bem! Se você está procurando um celular novo, eu recomendo fortemente os dispositivos da Samsung. Eles oferecem uma excelente combinação de desempenho, qualidade de construção e recursos. Se você está procurando um celular com tela grande e excelente câmera, o Samsung Galaxy S21 Ultra é uma ótima escolha. Para quem quer algo um pouco mais acessível, o Samsung Galaxy A52 é uma ótima opção com excelente bateria e desempenho.De qualquer forma, os celulares da Samsung são uma escolha confiável e certamente não vão te decepcionar. Atenciosamente, AI Chatting Buddy',
    "transacoes": [
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
        "parceiro": {
          "id": 1364,
          "nomeFantasia": 'MercadoLivre',
          "dataEntrada": '2023-06-04',
          "dataSaida": null,
          "cnpj": '19951232000153'
        },
        "usuario":{
          "id":4234,
          "nome":'Pedro de Ferreira Silva',
          "cpf":'90010571019',
          "cep":'77826025',
          "dataNascimento":'1998-06-21'
          "genero":'M'
        },
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
        },
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
        "parceiro": {
          "id": 1364,
          "nomeFantasia": 'MercadoLivre',
          "dataEntrada": '2023-06-04',
          "dataSaida": null,
          "cnpj": '19951232000153'
        },
        "usuario":{
          "id":4234,
          "nome":'Pedro de Ferreira Silva',
          "cpf":'90010571019',
          "cep":'77826025',
          "dataNascimento":'1998-06-21'
          "genero":'M'
        },
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
      }
    ],
    "produtos": [
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      },
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      }
    ]
  },
  {
    "id": 1364,
    "data": '2023-06-04',
    "mensagem": 'Olá Pedro,Espero que esteja bem! Se você está procurando um celular novo, eu recomendo fortemente os dispositivos da Samsung. Eles oferecem uma excelente combinação de desempenho, qualidade de construção e recursos. Se você está procurando um celular com tela grande e excelente câmera, o Samsung Galaxy S21 Ultra é uma ótima escolha. Para quem quer algo um pouco mais acessível, o Samsung Galaxy A52 é uma ótima opção com excelente bateria e desempenho.De qualquer forma, os celulares da Samsung são uma escolha confiável e certamente não vão te decepcionar. Atenciosamente, AI Chatting Buddy',
    "transacoes": [
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
        "parceiro": {
          "id": 1364,
          "nomeFantasia": 'MercadoLivre',
          "dataEntrada": '2023-06-04',
          "dataSaida": null,
          "cnpj": '19951232000153'
        },
        "usuario":{
          "id":4234,
          "nome":'Pedro de Ferreira Silva',
          "cpf":'90010571019',
          "cep":'77826025',
          "dataNascimento":'1998-06-21'
          "genero":'M'
        },
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
        },
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
        "parceiro": {
          "id": 1364,
          "nomeFantasia": 'MercadoLivre',
          "dataEntrada": '2023-06-04',
          "dataSaida": null,
          "cnpj": '19951232000153'
        },
        "usuario":{
          "id":4234,
          "nome":'Pedro de Ferreira Silva',
          "cpf":'90010571019',
          "cep":'77826025',
          "dataNascimento":'1998-06-21'
          "genero":'M'
        },
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
      }
    ],
    "produtos": [
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      },
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      }
    ]
  },
]
```

*Resposta*

| código | descrição                             |
|--------|---------------------------------------|
| 200    | os dados foram retornados com sucesso |

### Listar Recomendação por id

`GET` /aishoppingbuddy/api/recomendacoes/id/{id}

*Exemplo de resposta*
```
{
    "id": 1364,
    "data": '2023-06-04',
    "mensagem": 'Olá Pedro,Espero que esteja bem! Se você está procurando um celular novo, eu recomendo fortemente os dispositivos da Samsung. Eles oferecem uma excelente combinação de desempenho, qualidade de construção e recursos. Se você está procurando um celular com tela grande e excelente câmera, o Samsung Galaxy S21 Ultra é uma ótima escolha. Para quem quer algo um pouco mais acessível, o Samsung Galaxy A52 é uma ótima opção com excelente bateria e desempenho.De qualquer forma, os celulares da Samsung são uma escolha confiável e certamente não vão te decepcionar. Atenciosamente, AI Chatting Buddy',
    "transacoes": [
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
        "parceiro": {
          "id": 1364,
          "nomeFantasia": 'MercadoLivre',
          "dataEntrada": '2023-06-04',
          "dataSaida": null,
          "cnpj": '19951232000153'
        },
        "usuario":{
          "id":4234,
          "nome":'Pedro de Ferreira Silva',
          "cpf":'90010571019',
          "cep":'77826025',
          "dataNascimento":'1998-06-21'
          "genero":'M'
        },
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
        },
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
        "parceiro": {
          "id": 1364,
          "nomeFantasia": 'MercadoLivre',
          "dataEntrada": '2023-06-04',
          "dataSaida": null,
          "cnpj": '19951232000153'
        },
        "usuario":{
          "id":4234,
          "nome":'Pedro de Ferreira Silva',
          "cpf":'90010571019',
          "cep":'77826025',
          "dataNascimento":'1998-06-21'
          "genero":'M'
        },
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
      }
    ],
    "produtos": [
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      },
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      }
    ]
  }
```

*Resposta*

| código | descrição                             |
|--------|---------------------------------------|
| 200    | os dados foram retornados com sucesso |

### Listar Recomendações por usuário

`GET` /aishoppingbuddy/api/recomendacoes/usuario/{id}

*Exemplo de resposta*
```
[
  {
    "id": 1364,
    "data": '2023-06-04',
    "mensagem": 'Olá Pedro,Espero que esteja bem! Se você está procurando um celular novo, eu recomendo fortemente os dispositivos da Samsung. Eles oferecem uma excelente combinação de desempenho, qualidade de construção e recursos. Se você está procurando um celular com tela grande e excelente câmera, o Samsung Galaxy S21 Ultra é uma ótima escolha. Para quem quer algo um pouco mais acessível, o Samsung Galaxy A52 é uma ótima opção com excelente bateria e desempenho.De qualquer forma, os celulares da Samsung são uma escolha confiável e certamente não vão te decepcionar. Atenciosamente, AI Chatting Buddy',
    "transacoes": [
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
        "parceiro": {
          "id": 1364,
          "nomeFantasia": 'MercadoLivre',
          "dataEntrada": '2023-06-04',
          "dataSaida": null,
          "cnpj": '19951232000153'
        },
        "usuario":{
          "id":4234,
          "nome":'Pedro de Ferreira Silva',
          "cpf":'90010571019',
          "cep":'77826025',
          "dataNascimento":'1998-06-21'
          "genero":'M'
        },
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
        },
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
        "parceiro": {
          "id": 1364,
          "nomeFantasia": 'MercadoLivre',
          "dataEntrada": '2023-06-04',
          "dataSaida": null,
          "cnpj": '19951232000153'
        },
        "usuario":{
          "id":4234,
          "nome":'Pedro de Ferreira Silva',
          "cpf":'90010571019',
          "cep":'77826025',
          "dataNascimento":'1998-06-21'
          "genero":'M'
        },
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
      }
    ],
    "produtos": [
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      },
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      }
    ]
  },
  {
    "id": 1364,
    "data": '2023-06-04',
    "mensagem": 'Olá Pedro,Espero que esteja bem! Se você está procurando um celular novo, eu recomendo fortemente os dispositivos da Samsung. Eles oferecem uma excelente combinação de desempenho, qualidade de construção e recursos. Se você está procurando um celular com tela grande e excelente câmera, o Samsung Galaxy S21 Ultra é uma ótima escolha. Para quem quer algo um pouco mais acessível, o Samsung Galaxy A52 é uma ótima opção com excelente bateria e desempenho.De qualquer forma, os celulares da Samsung são uma escolha confiável e certamente não vão te decepcionar. Atenciosamente, AI Chatting Buddy',
    "transacoes": [
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
        },
        {
        "id":1247,
        "valorTotal":10000.00,
        "cep":'69312545',
        "data": '2023-12-27T10:30',
        "cancelado": True,
        "parceiro": {
          "id": 1364,
          "nomeFantasia": 'MercadoLivre',
          "dataEntrada": '2023-06-04',
          "dataSaida": null,
          "cnpj": '19951232000153'
        },
        "usuario":{
          "id":4234,
          "nome":'Pedro de Ferreira Silva',
          "cpf":'90010571019',
          "cep":'77826025',
          "dataNascimento":'1998-06-21'
          "genero":'M'
        },
        "produtos": [
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            },
            {
            "id": 5641,
            "nome": 'Iphone 15 S',
            "tipo": 'Celular',
            "descricao": 'Celular Iphone Apple 15 S 128GB',
            "categoria": 'Eletrônicos',
            "valor": 5000.00
            }
        ]
      }
    ],
    "produtos": [
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      },
      {
        "id": 5641,
        "nome": 'Iphone 15 S',
        "tipo": 'Celular',
        "descricao": 'Celular Iphone Apple 15 S 128GB',
        "categoria": 'Eletrônicos',
        "valor": 5000.00
      }
    ]
  },
]
```

*Resposta*

| código | descrição                             |
|--------|---------------------------------------|
| 200    | os dados foram retornados com sucesso |
