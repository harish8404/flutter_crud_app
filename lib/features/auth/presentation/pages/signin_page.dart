import 'package:base_app/core/theme/app_pallete.dart';
import 'package:base_app/features/auth/presentation/pages/signup_page.dart';
import 'package:base_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:base_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignInPage(),
      );
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final mobileNoController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    mobileNoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sign In.',
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Aptos',
                      fontWeight: FontWeight.bold,
                      color: AppPallete.textColor)),
              const SizedBox(
                height: 30,
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
                buttonText: 'Sign In',
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignupPage.route());
                },
                child: RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account? ',
                        // style: Theme.of(context).textTheme.titleMedium,
                        style: const TextStyle(color: AppPallete.textColor),
                        children: [
                      TextSpan(
                          text: 'Sign Up',
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
