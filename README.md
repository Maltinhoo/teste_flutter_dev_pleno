# Flutter Development Test

## Objetivo

O objetivo deste teste é avaliar minhas habilidades em desenvolvimento de aplicativos utilizando o framework Flutter, bem como as habilidades de documentação e versionamento utilizando o GitHub.

## Tarefas

### 1. Criação de Interface de Usuário

- Crie uma tela de login com campos para e-mail e senha.
- Implemente a validação dos campos (o e-mail deve ser válido e a senha deve ter pelo menos 6 caracteres).
- Adicione um botão de login que, ao ser clicado, valide os campos e exiba uma mensagem de erro se as credenciais forem inválidas.
- Após o login bem-sucedido, redirecione o usuário para uma tela inicial.

### 2. Tela Inicial

- Crie uma tela inicial com um AppBar contendo o título "Bem-vindo!".
- Adicione um botão "Logout" na AppBar, que, ao ser clicado, redireciona o usuário de volta para a tela de login.

### 3. Integração com API

- Conecte a aplicação a uma API de teste (pode ser uma API pública como JSONPlaceholder ou qualquer outra de sua escolha).
- Faça uma requisição à API para obter uma lista de objetos (por exemplo, posts, usuários, etc.).
- Exiba os dados obtidos da API em uma lista na tela inicial. Cada item da lista deve mostrar pelo menos duas informações relevantes (por exemplo, título e conteúdo do post).

### 4. Funcionalidade Adicional (Bônus)

- Implemente uma funcionalidade adicional à sua escolha para melhorar a experiência do usuário (por exemplo, filtro de pesquisa, paginação, animações, etc.).

## Instalação e Configuração

### Pré-requisitos

- Flutter SDK: [Instalação do Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Incluído com a instalação do Flutter
- Editor de código recomendado: [Visual Studio Code](https://code.visualstudio.com/) com as extensões Flutter e Dart

### Passos para Configuração

1. Clone o repositório do projeto:
   ```bash
   git clone https://github.com/Maltinhoo/teste_flutter_dev_pleno
   cd teste_flutter_dev_pleno
   ```

2. Instale as dependências do projeto:
   ```bash
   flutter pub get
   ```

3. Execute o aplicativo:
   ```bash
   flutter run
   ```

