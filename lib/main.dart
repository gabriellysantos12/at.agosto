
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
      home: const CadastroPage(),
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


 // ATIVIDADE 3: FORMULÁRIO INTERATIVO COM ESTADO

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController nomeController =
      TextEditingController();

  final TextEditingController profissaoController =
      TextEditingController();

  String nomeCadastrado = '';
  String profissaoCadastrada = '';

  void cadastrar() {
    final nome = nomeController.text.trim();
    final profissao = profissaoController.text.trim();

    if (nome.isEmpty || profissao.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha os dois campos!'),
        ),
      );
      return;
    }

    setState(() {
      nomeCadastrado = nome;
      profissaoCadastrada = profissao;
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    profissaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Profissional'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.person_outline,
              size: 65,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 10),

            const Text(
              'Cadastre seu perfil profissional',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 18),

            TextFormField(
              controller: profissaoController,
              decoration: const InputDecoration(
                labelText: 'Profissão / Cargo desejado',
                prefixIcon: Icon(Icons.work),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: cadastrar,
              icon: const Icon(Icons.person_add),
              label: const Text('Cadastrar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
            ),

            if (nomeCadastrado.isNotEmpty) ...[
              const SizedBox(height: 25),

              Card(
                color: Colors.deepPurple.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.celebration,
                        size: 40,
                        color: Colors.deepPurple,
                      ),

                      const SizedBox(height: 12),

                      Text(
                        'Bem-vindo(a), $nomeCadastrado!',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Cargo cadastrado: '
                        '$profissaoCadastrada',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
