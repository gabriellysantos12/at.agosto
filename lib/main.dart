
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuPerfilApp());
}

class MeuPerfilApp extends StatelessWidget {
  const MeuPerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu Perfil Dev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const CatalogoPage(),
    );
  }
}

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil Dev'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.deepPurple,
              child: Icon(
                Icons.person,
                size: 75,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Gabrielly Ferreira Santos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Estudante de Desenvolvimento Mobile',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 25),

            const InfoPerfil(
              icone: Icons.nightlight_round,
              titulo: 'Turno',
              valor: 'Integral',
            ),

            const InfoPerfil(
              icone: Icons.groups,
              titulo: 'Turma',
              valor: 'T1DEV-T3',
            ),

            const InfoPerfil(
              icone: Icons.email,
              titulo: 'E-mail de contato',
              valor: 'gabriellyfesantos12@gmail.com',
            ),
          ],
        ),
      ),
    );
  }
}

class InfoPerfil extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String valor;

  const InfoPerfil({
    super.key,
    required this.icone,
    required this.titulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          icone,
          color: Colors.deepPurple,
          size: 30,
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(valor),
      ),
    );
  }
}

 // ATIVIDADE 2: CATÁLOGO DINÂMICO

class Produto {
  final String nome;
  final String descricao;
  final String preco;
  final IconData icone;

  const Produto({
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.icone,
  });
}

class CatalogoPage extends StatelessWidget {
  const CatalogoPage({super.key});

  static const List<Produto> produtos = [
    Produto(
      nome: 'Notebook Pro',
      descricao: 'Ideal para estudos e desenvolvimento.',
      preco: 'R\$ 4.500,00',
      icone: Icons.laptop,
    ),
    Produto(
      nome: 'Fone de Ouvido',
      descricao: 'Som de qualidade e conforto.',
      preco: 'R\$ 299,90',
      icone: Icons.headphones,
    ),
    Produto(
      nome: 'Smartwatch',
      descricao: 'Tecnologia para o dia a dia.',
      preco: 'R\$ 699,00',
      icone: Icons.watch,
    ),
    Produto(
      nome: 'Mochila',
      descricao: 'Espaço para seus materiais.',
      preco: 'R\$ 199,90',
      icone: Icons.backpack,
    ),
    Produto(
      nome: 'Teclado Gamer',
      descricao: 'Ideal para jogos e programação.',
      preco: 'R\$ 349,90',
      icone: Icons.keyboard,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Produtos'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Icon(
                produto.icone,
                color: Colors.deepPurple,
                size: 35,
              ),
              title: Text(
                produto.nome,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${produto.descricao}\n${produto.preco}',
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
