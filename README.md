Processo para consumo API



1 - Adicionar a dependencia HTTP em pubspec.yaml 

 Referencia => https://pub.dev/packages/http#-installing-tab- 


dependencies:
 flutter:
   sdk: flutter
 http: ^0.12.1



2 - Importar o pacote no arquivo onde for configurar a lógica da API


import 'package:http/http.dart' as http;


3- Criar o modelo de dados 

Em nosso cenário iremos usar o site https://jsonplaceholder.typicode.com/users

É necessário copiar a API para o site https://javiercbk.github.io/json_to_dart/

criando a classe com o nome desejado. 

Em nosso caso iremos criar a classe Api

Basta criar um arquivo chamado Api.dart e copiar o resultado do site json to dart. 










4 - No espaço comentado abaixo iremos declarar a nossa lógica de consumo de api 

class MyHome extends StatefulWidget {
 @override
 _MyHomeState createState() => _MyHomeState();
}
 
class _MyHomeState extends State<MyHome> {
 
//declarando consumo de api
 
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(
 
  
   body: SafeArea(


5 - Primeiro criamos uma lista para acessar o nosso arquivo API

class MyHome extends StatefulWidget {
 @override
 _MyHomeState createState() => _MyHomeState();
}
 
class _MyHomeState extends State<MyHome> {
 
//declarando consumo de api
List<Api>_api;
 
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(
 






6 - Criamos a conexão FUTURE Assync 


class MyHome extends StatefulWidget {
 @override
 _MyHomeState createState() => _MyHomeState();
}
 
class _MyHomeState extends State<MyHome> {
//declarando consumo de api
 List<Api> _api;
 
 Future<List<Api>> _getUser() async {}
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(


7 - Dentro das chaves do async usaremos um bloco { try catch ) para validar a resposta da API 

class _MyHomeState extends State<MyHome> {
//declarando consumo de api
 List<Api> _api;
 
 Future<List<Api>> _getUser() async {
   try {
    
   } catch (e) {
   }
 }
 
 @override











8 - Dentro do bloco Try Catch iniciamos a nossa lista

class _MyHomeState extends State<MyHome> {
//declarando consumo de api
 List<Api> _api;
 
 Future<List<Api>> _getUser() async {
   try {
     List<Api> listUser = List();
    
   } catch (e) {
   }
 }
 
 @override
 



9 - Adicionamos a origem da resposta 

class _MyHomeState extends State<MyHome> {
//declarando consumo de api
 List<Api> _api;
 
 Future<List<Api>> _getUser() async {
   try {
     List<Api> listUser = List();
     final response =
         await http.get('https://jsonplaceholder.typicode.com/users');
   } catch (e) {}
 }














10 - Vamos gerar a nossa condição, adicionando um bloco { if else } dentro do try

class _MyHomeState extends State<MyHome> {
//declarando consumo de api
 List<Api> _api;
 
 Future<List<Api>> _getUser() async {
   try {
     List<Api> listUser = List();
     final response =
         await http.get('https://jsonplaceholder.typicode.com/users');
     if (response.statusCode == 200) {
       var decodeJson = jsonDecode(response.body);
       decodeJson.forEach((item) => listUser.add(Api.fromJson(item)));
       return listUser;
     } else {}
   } catch (e) {}
 }
 
 @override


























11 - Tratamos agora a condição else e o bloco catch

class _MyHomeState extends State<MyHome> {
//declarando consumo de api
 List<Api> _api;
 
 Future<List<Api>> _getUser() async {
   try {
     List<Api> listUser = List();
     final response =
         await http.get('https://jsonplaceholder.typicode.com/users');
     if (response.statusCode == 200) {
       var decodeJson = jsonDecode(response.body);
       decodeJson.forEach((item) => listUser.add(Api.fromJson(item)));
       return listUser;
     } else {
       print("Erro ao carregar a lista");
       return null;
     }
   } catch (e) {
     print("Erro ao carregar a lista");
     return null;
   }
 }




12 - Precisamos criar o state de inicialização do getUser()


@override
 void initState() {
   super.initState();
   _getUser().then((map){
     _api = map;
     //somente para validar se os dados estão corretos
     print(_api.length);
   });
 }





13 - Lógica completa 

class _MyHomeState extends State<MyHome> {
//declarando consumo de api
 List<Api> _api;
 
 Future<List<Api>> _getUser() async {
   try {
     List<Api> listUser = List();
     final response =
         await http.get('https://jsonplaceholder.typicode.com/users');
     if (response.statusCode == 200) {
       var decodeJson = jsonDecode(response.body);
       decodeJson.forEach((item) => listUser.add(Api.fromJson(item)));
       return listUser;
     } else {
       print("Erro ao carregar a lista");
       return null;
     }
   } catch (e) {
     print("Erro ao carregar a lista");
     return null;
   }
 }
 
 @override
 void initState() {
   super.initState();
   _getUser().then((map) {
     _api = map;
     //somente para validar se os dados estão corretos
     print(_api.length);
   });
 }
 








14 - Adicionando o list view 

@override
 Widget build(BuildContext context) {
   return Scaffold(
     body: ListView.builder(
       itemCount: _api.length,
       itemBuilder: (BuildContext context,  int index){
         return Column(
           children: <Widget>[
             ListTile(
               title: Text(_api[index].name),
               subtitle: Text(_api[index].email),
               leading: Icon(Icons.add_a_photo),
               trailing: Icon(Icons.add_call),
             )
           ],
         );
        
      
       }
      
     )
   );
 }
}



15 - Conclusão - visão app 



















15.1 - Conclusão - Código inteiro 

import 'dart:convert';
 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oneapi/api.dart';
 
class MyHome extends StatefulWidget {
 @override
 _MyHomeState createState() => _MyHomeState();
}
 
class _MyHomeState extends State<MyHome> {
//declarando consumo de api
 List<Api> _api;
 
 Future<List<Api>> _getUser() async {
   try {
     List<Api> listUser = List();
     final response =
         await http.get('https://jsonplaceholder.typicode.com/users');
     if (response.statusCode == 200) {
       var decodeJson = jsonDecode(response.body);
       decodeJson.forEach((item) => listUser.add(Api.fromJson(item)));
       return listUser;
     } else {
       print("Erro ao carregar a lista");
       return null;
     }
   } catch (e) {
     print("Erro ao carregar a lista");
     return null;
   }
 }
 
 @override
 void initState() {
   super.initState();
   _getUser().then((map) {
     _api = map;
     //somente para validar se os dados estão corretos
     print(_api.length);
   });
 }
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: ListView.builder(
       itemCount: _api.length,
       itemBuilder: (BuildContext context,  int index){
         return Column(
           children: <Widget>[
             ListTile(
               title: Text(_api[index].name),
               subtitle: Text(_api[index].email),
               leading: Icon(Icons.add_a_photo),
               trailing: Icon(Icons.add_call),
             )
           ],
         );
        
      
       }
      
     )
   );
 }
}
 











