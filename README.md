# README
## Api de localizacao com autenticação com devise 

Este projeto esta em estudo e desenvolvimento para aprendizado de utlização do devise e api para geo-localização


<h4 align="center"> 
	🚧  Em estudo e construção...  🚧
</h4>

<p align="center">
 <a href="#Tecnologias">Tecnologias</a> •
 <a href="#Features">Features</a> • 
 <a href="#Body">Body</a> • 
</p>

### 🛠 Tecnologias

As seguintes ferramentas foram usadas na construção do projeto:

- [ruby-2.6.7](https://www.ruby-lang.org/pt/)


### Features

- [x] Cadastro de usuário
- [x] Edição de usuário
- [x] Funcionalidade de login e logout
- [x] Validação de token
- localização
	- [X] Cadastro de Localização
	- [X] Criar dependencia de autenticação
	- [X] adicionar preenchimento automatico de address por cep
	- [X] Adicionar busca Lat Lon por address
	 
- Consulta de localização
	- [X] Consulta por Ordem Alfabética 
	- [ ] Consulta por distancia geografica  
- [ ] Implementar testes com *RSpec*

## Body

### Em maquina
As gem's necessarias:
```ruby 
gem "devise_token_auth"
```
> Caso esteja iniciando um projeto sera necessario adiciona-la 
```shell 
bundle add devise_token_auth
```
> Seguindo a documentação do devise quando iniciar um projeto com devise deverá rodar o comando:
```shell 
rails g devise:install
```
> Este comando ja gera arquivos padrões para configuração para o funcionamento inclusive a criação da tabela de usuarios

Dando continuidade, apos baixar o projeto sera necessario realizar a criação do banco de dados e a configuração do mesmo para que armazene as informações de usuario e localização



### Heroku
A aplicação hoje está no heroku podendo ser acessada pelo link *https://localization-api.herokuapp.com/* podendo realizar testes.


#### Nesta api foi utilizado o devise-token-auth para autenticação de usuarios onde as rotas:

1. Criação
 - Rota: */auth*
 > campos disponiveis para criação : *email, name, nickname* e *password*
> passando via json para criação
```JSON 
{
  "email": "<email>",
  "password": "<password>",
  "password_confirmation": "<password>",
  "name": "<name>",
  "nickname": "<nickname>"
}
```
2. sing-in:
- Rota: */auth/sign_in*
> parametros:
```JSON 
{
  "email": "<email>",
  "password": "<password>"
}

```
#### O processo realizado pelo devise gera duas variaveis que são necessaria apartir do momento que realiza o login que é a *access-token* e a *client* onde será passada para as rotas via header as mesmas para validação das rotas a seguir:

3. sing-out:
- Rota: /auth/sign_out

4. validate_token:
- Rota: /auth/validate_token

### as Alterações de usuario é utilizada na rota */auth* passando os campos que deseja alterar, porém se atente ao alterar a senha tera que fornecer um campo para verificação da senha anterior chamado *current_password* exemplo:
```JSON 
{
	"current_password": "<password-old>",
	"password": "password-new",
	"password_confirmation": "password-new"
}
``` 
  
## Cadastro de Localização

> É necessario ter feito o login para cadastrar a localização, contendo os campos *cep,address, number, city,state,district,lat* e *lon*.
- Rotas */locals*

### Preenchimento de Endereco
> gem utlizada:
```ruby 
gem "correios-cep"
```
> Ao cadastrar novo endereço passando o cep ele realiza a pesquisa do *address, city, district* e *state*
 
### Preenchimento de Posição

> apos realizar a pesquisa pela gem *correios-cep* ele busca a latitude e longitude na gem:

```ruby 
gem 'geocoder', '~> 1.6', '>= 1.6.7'
```
>Pesquisando por Rua e Cidade.


## Consulta
 Foi relizado apenas a consulta por ordem Alfabética 
 - Rota: */alphabetical_order*


