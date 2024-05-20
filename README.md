# Flutter Development Test

## Objetivo

O objetivo deste teste é avaliar as habilidades do candidato em desenvolvimento de aplicativos utilizando o framework Flutter, bem como suas habilidades de documentação e versionamento utilizando o GitHub.

## Instruções

- Este teste consiste em várias tarefas que devem ser completadas em um prazo de 3 dias.
- O candidato deve criar um repositório público no GitHub para o projeto.
- O código deve ser organizado, limpo e comentado sempre que necessário.
- Além do código, o candidato deve documentar o projeto em um arquivo README.md fornecendo instruções claras sobre como instalar, configurar e executar o aplicativo.

## Tarefas

### 1. Criação de Interface de Usuário

- Crie uma tela de login com campos para e-mail e senha.
- Implemente a validação dos campos (o e-mail deve ser válido e a senha deve ter pelo menos 6 caracteres).
- Adicione um botão de login que, ao ser clicado, valide os campos e exiba uma mensagem de erro se as credenciais forem inválidas.
- Após o login bem-sucedido, redirecione o usuário para uma tela inicial.

### 2. Tela Inicial

- Crie uma tela inicial com um AppBar contendo o título "Bem-vindo!".
- Adicione um botão "Logout" na AppBar, que, ao ser clicado, redireciona o usuário de volta para a tela de login.


## Instalação e Configuração

### Pré-requisitos

- Flutter SDK: [Instalação do Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Incluído com a instalação do Flutter
- Editor de código recomendado: [Visual Studio Code](https://code.visualstudio.com/) com as extensões Flutter e Dart

### Passos para Configuração

1. Clone o repositório do projeto:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   cd seu-repositorio
   ```

2. Instale as dependências do projeto:
   ```bash
   flutter pub get
   ```

3. Execute o aplicativo:
   ```bash
   flutter run
   ```


## Comentários sobre o Código

- **main.dart**: Contém a função principal `main` e configurações iniciais de rotas.
- **login_screen.dart**: Implementa a interface de login e validação de campos.
- **home_screen.dart**: Contém a tela inicial e a lógica de exibição dos dados obtidos da API.


