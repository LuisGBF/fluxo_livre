import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();

  void _cadastrar() {
    if (_formKey.currentState!.validate()) {
      // Passa o nome para a próxima tela
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: _nomeController.text, // Passa o nome do usuário
      );
    }
  }

  void _cancelar() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty ? 'Informe seu nome' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.contains('@') ? null : 'E-mail inválido',
              ),
              TextFormField(
                controller: _cpfController,
                decoration: InputDecoration(labelText: 'CPF'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.length == 11 ? null : 'CPF inválido',
              ),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) => value!.length >= 6 ? null : 'Senha muito curta',
              ),
              TextFormField(
                controller: _confirmarSenhaController,
                decoration: InputDecoration(labelText: 'Confirmar Senha'),
                obscureText: true,
                validator: (value) => value == _senhaController.text ? null : 'As senhas não coincidem',
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _cadastrar,
                    child: Text('Cadastrar'),
                  ),
                  OutlinedButton(
                    onPressed: _cancelar,
                    child: Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
