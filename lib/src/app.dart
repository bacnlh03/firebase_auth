import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth_feature/src/dependency_injector.dart' as di;
import 'package:auth_feature/src/presentation/bloc/auth/auth_state.dart';
import 'package:auth_feature/src/presentation/bloc/credential/credential_state.dart';
import 'package:auth_feature/src/presentation/views/home_page.dart';
import 'package:auth_feature/src/presentation/views/register_page.dart';
import 'package:auth_feature/src/utils/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (_) => di.sl<CredentialCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.appTitle,
        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: '/',
        routes: {
          '/': (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return const HomePage();
                } else {
                  return const RegisterPage();
                }
              },
            );
          }
        },
      ),
    );
  }
}
