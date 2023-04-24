import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth_feature/src/presentation/bloc/auth/auth_state.dart';
import 'package:auth_feature/src/presentation/bloc/credential/credential_state.dart';
import 'package:auth_feature/src/presentation/views/home_page.dart';
import 'package:auth_feature/src/presentation/widgets/widgets.dart';
import 'package:auth_feature/src/utils/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _emailController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  var _isObscured = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            showException('Successful');
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialState is CredentialLoading) {
            showException('Processing');
          }
          if (credentialState is CredentialFailure) {
            showException('Invalid email or password');
          }
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return const HomePage();
                } else {
                  return _bodyWidget();
                }
              },
            );
          }
          return _bodyWidget();
        },
      ),
    );
  }

  Widget _bodyWidget() {
    return SafeArea(
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
              controller: _emailController,
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
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                label: const Text('Username'),
                labelStyle: const TextStyle(fontSize: 18),
              ),
              style: const TextStyle(fontSize: 20),
            ),
            AddSpace.vertical(12),
            TextFormField(
              controller: _passwordController,
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
            AddSpace.vertical(20),
            ElevatedButton(
              onPressed: _signUpUser,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Sign Up',
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
                  'Already have an account? ',
                  style: TextStyle(fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Pages.loginPage,
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Sign In',
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
    );
  }

  Future<void> _signUpUser() async {
    BlocProvider.of<CredentialCubit>(context).signUp(
      email: _emailController.text,
      username: _usernameController.text,
      password: _passwordController.text,
    );
  }

  _clear() {
    setState(() {
      _usernameController.clear();
      _emailController.clear();
      _passwordController.clear();
    });
  }
}
