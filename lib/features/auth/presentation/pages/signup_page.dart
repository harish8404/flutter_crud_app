import 'package:base_app/core/theme/app_pallete.dart';
import 'package:base_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:base_app/features/auth/presentation/pages/signin_page.dart';
import 'package:base_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:base_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignupPage(),
      );
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final mobileNoController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    mobileNoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sign Up.',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: AppPallete.textColor)),
              const SizedBox(
                height: 30,
              ),
              AuthField(hintText: 'Name', controller: nameController),
              const SizedBox(
                height: 15,
              ),
              AuthField(
                hintText: 'Mobile Number',
                controller: mobileNoController,
              ),
              const SizedBox(
                height: 15,
              ),
              AuthField(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              AuthGradientButton(
                buttonText: 'Sign Up',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(AuthSignUp(
                        mobile: mobileNoController.text.trim(),
                        password: passwordController.text.trim(),
                        name: nameController.text.trim()));
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignInPage.route());
                },
                child: RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account? ',
                        // style: Theme.of(context).textTheme.titleMedium,
                        style: const TextStyle(color: AppPallete.textColor),
                        children: [
                      TextSpan(
                          text: 'Sign In',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold))
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
