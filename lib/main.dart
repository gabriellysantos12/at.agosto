
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
      home: const PerfilPage(),
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
