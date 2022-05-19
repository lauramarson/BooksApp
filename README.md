# Studio Sol App

## Como rodar

Acessar o XCode através do arquivo studiosol_teste.xcworkspace

## Principais Tecnologias
- Swift e UIKit
- Arquitetura MVVM
- Testes unitários com cobertura de X%
- Gerenciador de dependências Cocoapods
- Apollo para requisições GraphQL

## Sobre o aplicativo

O aplicativo possui 2 telas principais, sendo uma de Home e outra de detalhes dos filmes, a qual pode ser acessada clicando na seção de Livros Favoritos ou na seção Todos os Livros.

1) Tela de Início:
- Primeira seção é feita a requisição da foto do usuário;
- Segunda seção é feita a requisição da lista de livros favoritos do usuário (clicável), com apenas as informações necessárias (sem descrição);
- Terceira seção é feita a requisição de autores favoritos;
- Quarta seção possui os botões com as respectivas categorias de livros, com a interação desabilitada;
- Quinta seção possui uma lista de todos os livros (clicável);

2) Tela de detalhes:
- A tela será exibida ao clicar em algum livro, mostrando mais informações como a descrição do livro e o botão favoritar/desfavoritar (sem interação habilitada).

