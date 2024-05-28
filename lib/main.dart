import 'package:base_app/core/theme/theme.dart';
import 'package:base_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:base_app/features/auth/presentation/pages/signin_page.dart';
import 'package:base_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School App',
      theme: AppTheme.darkThemeMode,
      home: const SignInPage(),
    );
  }
}
