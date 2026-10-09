import 'package:flutter/material.dart';
import 'package:x_clone_ec/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  bool _isPasswordHidden = true;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(), // texte, champs et icônes passent en clair
      child: Scaffold(
        backgroundColor: Colors.black, 
        appBar: AppBar(
          title: Image.asset('assets/x-logo.png', height: 30),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Entrez vos identifiants',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez votre adresse email';
                    }
                    return null;
                  },
                  onSaved: (value) => email = value ?? '',
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: _isPasswordHidden,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordHidden = !_isPasswordHidden;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez votre mot de passe';
                    }
                    if (value.length < 12) {
                      return 'Entrez un mot de passe plus long (12 caractères minimum)';
                    }
                    return null;
                  },
                  onSaved: (value) => password = value ?? '',
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      debugPrint('Email: $email');
                      // Code d'authentification
                      // ...
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}