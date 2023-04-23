import 'package:flutter/material.dart';

import 'package:auth_feature/src/presentation/views/home_page.dart';
import 'package:auth_feature/src/presentation/views/register_page.dart';
import 'package:auth_feature/src/presentation/widgets/widgets.dart';
import 'package:auth_feature/src/utils/constants/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isRemembered = false;
  var _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.loginTitle,
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('Email'),
                  labelStyle: const TextStyle(fontSize: 18),
                ),
                style: const TextStyle(fontSize: 20),
              ),
              AddSpace.vertical(12),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: const Text('Password'),
                  labelStyle: const TextStyle(fontSize: 18),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    icon: _isObscured
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.remove_red_eye_outlined),
                  ),
                ),
                obscureText: _isObscured,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const Text(
                    'Remember',
                    style: TextStyle(fontSize: 16),
                  ),
                  Checkbox(
                    value: _isRemembered,
                    onChanged: (_) {
                      setState(() {
                        _isRemembered = !_isRemembered;
                      });
                    },
                  ),
                ],
              ),
              AddSpace.vertical(8),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const Divider(
                color: Colors.grey,
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Don\'t have any account? ',
                    style: TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
