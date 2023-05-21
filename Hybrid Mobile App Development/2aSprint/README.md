![LINK GITHUB](https://github.com/maarfelipe/ChallengeFiap2TDSA)

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
  - [Listar transações do parceiro](#listar-transações-do-parceiro)
  - [Criar recomendação personalizada](#criar-recomendação-personalizada)
  - [Listar todas Recomendações](#listar-todas-recomendações)
  - [Listar Recomendações por usuário](#listar-recomendações-por-usuário)
  - [Listar Recomendações por data](#listar-recomendações-por-data)
  - [Achar Recomendação por id](#listar-recomendação-por-id)

## PARCEIRO DE NEGÓCIOS

### Cadastrar Parceiro

`POST` /aishoppingbuddy/api/parceiro

*Campos de requisição*

| campo            | tipo   | obrigatório | descrição                         |
|------------------|--------|:-----------:|-----------------------------------|
| nomeFantasia     | String |     sim     | Nome Fantasia do parceiro         |
| dataEntrada      | Date   |     sim     | Data de Entrada do parceiro       |
| dataEncerramento | Date   |     não     | Data de Encerramento do parceiro  |
| cnpj             | String |     sim     | CPNJ do parceiro                  |

*Exemplo de requisição*
```
{
  "nomeFantasia": "MercadoLivre",
  "dataEntrada": "2023-06-04",
  "dataSaida": null,
  "cnpj": "19951232000153"
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
    "nomeFantasia": "MercadoLivre",
    "dataEntrada": "2023-06-04",
    "dataSaida": null,
    "cnpj": "19951232000153"
  },
  {
    "nomeFantasia": "Amazon",
    "dataEntrada": "2023-21-07",
    "dataSaida": null,
    "cnpj": "17393772000133"
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
| nomeFantasia     | String |     sim     | Nome Fantasia do parceiro         |
| dataEntrada      | Date   |     sim     | Data de Entrada do parceiro       |
| dataEncerramento | Date   |     não     | Data de Encerramento do parceiro  |
| cnpj             | String |     sim     | CPNJ do parceiro                  |

*Exemplo de requisição*
```
{
  "nomeFantasia": "MercadoLivre",
  "dataEntrada": "2023-06-04",
  "dataSaida": null,
  "cnpj": "19951232000153"
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
  "nomeFantasia": "MercadoLivre",
  "dataEntrada": "2023-06-04",
  "dataSaida": null,
  "cnpj": "19951232000153"
}
```

*Resposta*

| código | descrição                                      |
|--------|------------------------------------------------|
| 200    | o parceiro foi detalhado com sucesso           |
| 404    | não foi possível achar um parceiro com esse id |

### Cadastrar Transações do dia

`POST` /aishoppingbuddy/api/parceiro/{id}/transacoes

*Campos de requisição*

| campo      | tipo             | obrigatório | descrição                                      |
|------------|------------------|:-----------:|------------------------------------------------|
| transacoes | List<Transacoes> |     sim     | Lista de todas as transacoes realizadas no dia |

*Exemplo de requisição*
```
[
  {
    "valorTotal":10000.00,
    "cep":"69312545",
    "data": "2023-12-27",
    "cancelado": False,
    "usuario":{
      "id":4234,
      "nome":"Pedro de Ferreira Silva",
      "cpf":"90010571019",
      "cep":"77826025",
      "dataNascimento":"1998-06-21"
      "genero":"M"
    },
    "produtoList": [
      {
        "id": 5641,
        "nome": "Iphone 15 S",
        "tipo": "Celular",
        "descricao": "Celular Iphone Apple 15 S 128GB",
        "categoria": "Eletrônicos",
        "valor": 5000.00
      },
      {
        "id": 5641,
        "nome": "Iphone 15 S",
        "tipo": "Celular",
        "descricao": "Celular Iphone Apple 15 S 128GB",
        "categoria": "Eletrônicos",
        "valor": 5000.00
      }
    ]
  },
  {
    "valorTotal":10000.00,
    "cep":"69312545",
    "data": "2023-12-27",
    "cancelado": True,
    "usuario":{
      "id":4234,
      "nome":"Pedro de Ferreira Silva",
      "cpf":"90010571019",
      "cep":"77826025",
      "dataNascimento":"1998-06-21"
      "genero":"M"
    },
    "produtoList": [
      {
        "id": 5641,
        "nome": "Iphone 15 S",
        "tipo": "Celular",
        "descricao": "Celular Iphone Apple 15 S 128GB",
        "categoria": "Eletrônicos",
        "valor": 5000.00
      },
      {
        "id": 5641,
        "nome": "Iphone 15 S",
        "tipo": "Celular",
        "descricao": "Celular Iphone Apple 15 S 128GB",
        "categoria": "Eletrônicos",
        "valor": 5000.00
      }
    ]
  }
]
```

*Resposta*

| código | descrição                                      |
|--------|------------------------------------------------|
| 201    | transações do dia cadastradas com sucesso      |
| 404    | não foi possível achar um parceiro com esse id |

### Listar Transações do Parceiro

`GET` /aishoppingbuddy/api/parceiro/{id}/transacoes

```
[
  {
    "id":1274,
    "valorTotal":10000.00,
    "cep":"69312545",
    "data": "2023-12-27",
    "cancelado": False,
    "usuario":{
      "id":4234,
      "nome":"Pedro de Ferreira Silva",
      "cpf":"90010571019",
      "cep":"77826025",
      "dataNascimento":"1998-06-21"
      "genero":"M"
    },
    "parceiro":{
      "id": 1364,
      "nomeFantasia": "MercadoLivre",
      "dataEntrada": "2023-06-04",
      "dataSaida": null,
      "cnpj": "19951232000153"
    }
    "produtoList": [
      {
        "id": 5641,
        "nome": "Iphone 15 S",
        "tipo": "Celular",
        "descricao": "Celular Iphone Apple 15 S 128GB",
        "categoria": "Eletrônicos",
        "valor": 5000.00
      },
      {
        "id": 5641,
        "nome": "Iphone 15 S",
        "tipo": "Celular",
        "descricao": "Celular Iphone Apple 15 S 128GB",
        "categoria": "Eletrônicos",
        "valor": 5000.00
      }
    ]
  },
  {
    "id":2731,
    "valorTotal":10000.00,
    "cep":"69312545",
    "data": "2023-12-27",
    "cancelado": True,
    "usuario":{
      "id":4234,
      "nome":"Pedro de Ferreira Silva",
      "cpf":"90010571019",
      "cep":"77826025",
      "dataNascimento":"1998-06-21"
      "genero":"M"
    },
    "parceiro":{
      "id": 1364,
      "nomeFantasia": "MercadoLivre",
      "dataEntrada": "2023-06-04",
      "dataSaida": null,
      "cnpj": "19951232000153"
    }
    "produtoList": [
      {
        "id": 5641,
        "nome": "Iphone 15 S",
        "tipo": "Celular",
        "descricao": "Celular Iphone Apple 15 S 128GB",
        "categoria": "Eletrônicos",
        "valor": 5000.00
      },
      {
        "id": 5641,
        "nome": "Iphone 15 S",
        "tipo": "Celular",
        "descricao": "Celular Iphone Apple 15 S 128GB",
        "categoria": "Eletrônicos",
        "valor": 5000.00
      }
    ]
  }
]
```

## Criar recomendação personalizada

`POST` /aishoppingbuddy/api/parceiro/{idParceiro}/recomendacoes/{idUsarui}

Cria uma recomendação baseada na API de machine learning com uma mensagem gerada pelo ChatGPT baseada nas transações enviadas e adiciona ela no banco de dados.

*Campos de requisição*

| campo      | tipo             | obrigatório | descrição                                      |
|------------|------------------|:-----------:|------------------------------------------------|
| transacoes | List<Transacoes> |     sim     | Lista das transacões para fazer a recomendação |

*Exemplo de requisição*
```
[
  {
    "id":1352,
    "valorTotal":10000.00,
    "cep":"69312545",
    "data": "2023-12-27",
    "cancelado": False,
    "usuario":{
      "id":4234,
      "nome":"Pedro de Ferreira Silva",
      "cpf":"90010571019",
      "cep":"77826025",
      "dataNascimento":"1998-06-21"
      "genero":"M"
    },
    "produtoList": [
      {
        "id": 5641,
        "nome": "Iphone 15 S",
        "tipo": "Celular",
        "descricao": "Celular Iphone Apple 15 S 128GB",
        "categoria": "Eletrônicos",
        "valor": 5000.00
      },
      {
        "id": 5641,
        "nome": "Iphone 15 S",
        "tipo": "Celular",
        "descricao": "Celular Iphone Apple 15 S 128GB",
        "categoria": "Eletrônicos",
        "valor": 5000.00
      }
    ]
  },
  {
    "id":2123,
    "valorTotal":10000.00,
    "cep":"69312545",
    "data": "2023-12-27",
    "cancelado": True,
    "usuario":{
      "id":4234,
      "nome":"Pedro de Ferreira Silva",
      "cpf":"90010571019",
      "cep":"77826025",
      "dataNascimento":"1998-06-21"
      "genero":"M"
    },
    "produtos": [
      {
        "id": 5641,
        "nome": "Iphone 15 S",
        "tipo": "Celular",
        "descricao": "Celular Iphone Apple 15 S 128GB",
        "categoria": "Eletrônicos",
        "valor": 5000.00
      },
      {
        "id": 5641,
        "nome": "Iphone 15 S",
        "tipo": "Celular",
        "descricao": "Celular Iphone Apple 15 S 128GB",
        "categoria": "Eletrônicos",
        "valor": 5000.00
      }
    ]
  }
]
```

*Exemplo de Resposta*
```
{
  "id":4342,
  "mensagem":"Olá Pedro,Espero que esteja bem! Se você está procurando um celular novo, eu recomendo fortemente os dispositivos da Samsung. Eles oferecem uma excelente combinação de desempenho, qualidade de construção e recursos. Se você está procurando um celular com tela grande e excelente câmera, o Samsung Galaxy S21 Ultra é uma ótima escolha. Para quem quer algo um pouco mais acessível, o Samsung Galaxy A52 é uma ótima opção com excelente bateria e desempenho.De qualquer forma, os celulares da Samsung são uma escolha confiável e certamente não vão te decepcionar. Atenciosamente, AI Chatting Buddy"
  "data":"2023-05-21",
  "usuario":{
    "id":4234,
    "nome":"Pedro de Ferreira Silva",
    "cpf":"90010571019",
    "cep":"77826025",
    "dataNascimento":"1998-06-21"
    "genero":"M"
  },
  "parceiro":{
    "id": 1364,
    "nomeFantasia": "MercadoLivre",
    "dataEntrada": "2023-06-04",
    "dataSaida": null,
    "cnpj": "19951232000153"
  }
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
    "id":2652,
    "mensagem":"Olá Pedro,Espero que esteja bem! Se você está procurando um celular novo, eu recomendo fortemente os dispositivos da Samsung. Eles oferecem uma excelente combinação de desempenho, qualidade de construção e recursos. Se você está procurando um celular com tela grande e excelente câmera, o Samsung Galaxy S21 Ultra é uma ótima escolha. Para quem quer algo um pouco mais acessível, o Samsung Galaxy A52 é uma ótima opção com excelente bateria e desempenho.De qualquer forma, os celulares da Samsung são uma escolha confiável e certamente não vão te decepcionar. Atenciosamente, AI Chatting Buddy"
    "data":"2023-05-21",
    "usuario":{
      "id":4234,
      "nome":"Pedro de Ferreira Silva",
      "cpf":"90010571019",
      "cep":"77826025",
      "dataNascimento":"1998-06-21"
      "genero":"M"
    },
    "parceiro":{
      "id": 1364,
      "nomeFantasia": "MercadoLivre",
      "dataEntrada": "2023-06-04",
      "dataSaida": null,
      "cnpj": "19951232000153"
    }
  },
  {
    "id":4342,
    "mensagem":"Olá Maria, Os iPhones são a escolha perfeita para uma experiência excepcional em smartphones. Com design elegante, desempenho incrível e câmeras impressionantes, os iPhones oferecem qualidade e praticidade. Além disso, a integração perfeita com o ecossistema Apple e a segurança avançada dos seus dados tornam esses dispositivos ainda mais atrativos. Se você busca um celular de alta qualidade e confiabilidade, os iPhones são a opção ideal. Não deixe de conferir os modelos disponíveis e aproveitar todos os benefícios que eles oferecem. Atenciosamente, AI Shopping Buddy",
    "data":"2023-06-04",
    "usuario":{
      "id":6544,
      "nome":"Maria Nacimento",
      "cpf":"87113837042",
      "cep":"68503280",
      "dataNascimento":"1981-12-11"
      "genero":"F"
    },
    "parceiro":{
      "id": 1364,
      "nomeFantasia": "MercadoLivre",
      "dataEntrada": "2023-06-04",
      "dataSaida": null,
      "cnpj": "19951232000153"
    }
  },
]
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
    "id":2652,
    "mensagem":"Olá Pedro,Espero que esteja bem! Se você está procurando um celular novo, eu recomendo fortemente os dispositivos da Samsung. Eles oferecem uma excelente combinação de desempenho, qualidade de construção e recursos. Se você está procurando um celular com tela grande e excelente câmera, o Samsung Galaxy S21 Ultra é uma ótima escolha. Para quem quer algo um pouco mais acessível, o Samsung Galaxy A52 é uma ótima opção com excelente bateria e desempenho.De qualquer forma, os celulares da Samsung são uma escolha confiável e certamente não vão te decepcionar. Atenciosamente, AI Chatting Buddy"
    "data":"2023-05-21",
    "usuario":{
      "id":4234,
      "nome":"Pedro de Ferreira Silva",
      "cpf":"90010571019",
      "cep":"77826025",
      "dataNascimento":"1998-06-21"
      "genero":"M"
    },
    "parceiro":{
      "id": 1364,
      "nomeFantasia": "MercadoLivre",
      "dataEntrada": "2023-06-04",
      "dataSaida": null,
      "cnpj": "19951232000153"
    }
  }
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
    "id":4342,
    "mensagem":"Olá Maria, Os iPhones são a escolha perfeita para uma experiência excepcional em smartphones. Com design elegante, desempenho incrível e câmeras impressionantes, os iPhones oferecem qualidade e praticidade. Além disso, a integração perfeita com o ecossistema Apple e a segurança avançada dos seus dados tornam esses dispositivos ainda mais atrativos. Se você busca um celular de alta qualidade e confiabilidade, os iPhones são a opção ideal. Não deixe de conferir os modelos disponíveis e aproveitar todos os benefícios que eles oferecem. Atenciosamente, AI Shopping Buddy",
    "data":"2023-06-04",
    "usuario":{
      "id":6544,
      "nome":"Maria Nacimento",
      "cpf":"87113837042",
      "cep":"68503280",
      "dataNascimento":"1981-12-11"
      "genero":"F"
    },
    "parceiro":{
      "id": 1364,
      "nomeFantasia": "MercadoLivre",
      "dataEntrada": "2023-06-04",
      "dataSaida": null,
      "cnpj": "19951232000153"
    }
  },
]
```

*Resposta*

| código | descrição                             |
|--------|---------------------------------------|
| 200    | os dados foram retornados com sucesso |

### Achar Recomendação por id

`GET` /aishoppingbuddy/api/recomendacoes/id/{id}

*Exemplo de resposta*
```
{
  "id":4342,
  "mensagem":"Olá Pedro,Espero que esteja bem! Se você está procurando um celular novo, eu recomendo fortemente os dispositivos da Samsung. Eles oferecem uma excelente combinação de desempenho, qualidade de construção e recursos. Se você está procurando um celular com tela grande e excelente câmera, o Samsung Galaxy S21 Ultra é uma ótima escolha. Para quem quer algo um pouco mais acessível, o Samsung Galaxy A52 é uma ótima opção com excelente bateria e desempenho.De qualquer forma, os celulares da Samsung são uma escolha confiável e certamente não vão te decepcionar. Atenciosamente, AI Chatting Buddy"
  "data":"2023-05-21",
  "usuario":{
    "id":4234,
    "nome":"Pedro de Ferreira Silva",
    "cpf":"90010571019",
    "cep":"77826025",
    "dataNascimento":"1998-06-21"
    "genero":"M"
  },
  "parceiro":{
    "id": 1364,
    "nomeFantasia": "MercadoLivre",
    "dataEntrada": "2023-06-04",
    "dataSaida": null,
    "cnpj": "19951232000153"
  }
}
```

*Resposta*

| código | descrição                             |
|--------|---------------------------------------|
| 200    | os dados foram retornados com sucesso |
| 403    | essa recomendação é de outro parceiro |
