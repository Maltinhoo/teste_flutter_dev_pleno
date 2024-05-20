import 'package:flutter/material.dart';
import 'package:teste_dev_pleno/core/core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  hint: 'Email',
                  focusNode: emailFocus,
                  onFieldSubmitted: (p0) {
                    passwordFocus.requestFocus();
                  },
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Email é obrigatório';
                    } else if (!p0.contains('@')) {
                      return 'Email inválido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                CustomPasswordField(
                  hint: 'Password',
                  focusNode: passwordFocus,
                  onFieldSubmitted: (p0) {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, Routes.home);
                    }
                  },
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Senha é obrigatória';
                    } else if (p0.length < 6) {
                      return 'A senha deve ter no mínimo 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                CommonButton(
                  width: double.infinity,
                  color: Colors.black,
                  label: 'Login',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, Routes.home);
                      ServiceLocator.locator<AppStorage>().setIsLogged();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
