# language: pt

Funcionalidade: Cadastre Usuário

  Cenário: Cadastro de usuário com sucesso
    Dado que acesse a tela de cadastro com um cpf válido
    Quando efetuo o cadastro
    Então verifico que o nome do usuário é exibido no menu
