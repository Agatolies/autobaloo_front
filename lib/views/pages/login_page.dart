import 'package:autobaloo/models/enums/cta_text_size.dart';
import 'package:autobaloo/models/enums/oauth_provider.dart';
import 'package:autobaloo/service_locator.dart';
import 'package:autobaloo/services/auth_service.dart';
import 'package:autobaloo/views/components/oauth_login_button.dart';
import 'package:autobaloo/views/layouts/auth_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return AuthLayout(children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            constraints: const BoxConstraints(minWidth: 200, maxWidth: 500),
            alignment: Alignment.bottomRight,
            child: Form(
              key: _formKey,
              child: Column(children: [
                Text(
                  'Bienvenue',
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(height: 20),
                Text(
                    "Bienvenue sur la page de connexion de AutoBaloo! Si vous êtes déjà membre de notre plateforme, vous pouvez vous connecter en utilisant vos informations de connexion. Si vous n'avez pas encore de compte, vous pouvez en créer un gratuitement en quelques minutes seulement. En vous connectant, vous pourrez accéder à toutes les fonctionnalités de notre plateforme, y compris la possibilité de louer ou d'acheter des véhicules. Alors n'hésitez pas à vous connecter dès maintenant et à profiter de tout ce que AutoBaloo a à vous offrir!",
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (!isEmail(value ?? '')) {
                      return 'Entrez une adresse e-mail valide';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Adresse e-mail',
                      hintText: 'Entrez votre adresse e-mail'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value != null && value.length < 8 ||
                        !value!.contains(RegExp('[0-9]')) ||
                        !value.contains(RegExp('[a-zA-Z]'))) {
                      return 'Le mot de passe doit contenir au moins 8 caractères, une lettre et un chiffre';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mot de passe',
                      hintText: 'Enter secure password'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                  child: Text(
                    'Mot de passe oublié',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 15),
                  ),
                  onPressed: () => GoRouter.of(context).goNamed(
                    'reset-password',
                  ),
                ),
                Container(
                  height: 50,
                  constraints:
                      const BoxConstraints(minWidth: 300, maxWidth: 400),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: _handleLogin,
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  child: Text(
                    'Pas encore de compte ? Créer un compte',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 15),
                  ),
                  onPressed: () => GoRouter.of(context).goNamed(
                    'register',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(),
                ),
                const OAuthLoginButton(
                    provider: OAuthProvider.google,
                    textSize: CtaTextSize.large),
              ]),
            ),
          ),
        ),
      )
    ]);
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final authService = sl.get<AuthService>();
      final email = _emailController.text;
      final password = _passwordController.text;

      final response = await authService.login(email, password);
      if (response) {
        GoRouter.of(context).goNamed('home');
      } else {
        setState(() {
          _errorMessage = 'Erreur lors de la connexion';
        });
      }
      setState(() {
        _isLoading = false;
      });
    }
  }
}
