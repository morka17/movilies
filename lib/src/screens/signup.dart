import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:movilies/src/components/appfield.dart';
import 'package:movilies/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../components/app_logo.dart';
import '../utils/input_validators.dart';

class SignupScreen extends StatefulWidget {
  static const String id = "/signup";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool obscurePassword = true;
  final TextFieldValidator _validator = TextFieldValidator();

  String _fullName = "";
  String _email = "";
  String _password = "";

  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Hero(
                    tag: "app_logo",
                    child: AppLogo(),
                  ),
                  const SizedBox(height: 30),
                  AppField(
                    onChanged: (value) => _fullName = value,
                    validator: _validator.forTextOnly,
                    prefixIcon: Icons.person_outline_outlined,
                    labelText: "Full name",
                  ),
                  const SizedBox(height: 30),
                  AppField(
                    onChanged: (value) => _email = value,
                    validator: _validator.forEmailOnly,
                    prefixIcon: Icons.email_outlined,
                    labelText: "Email",
                  ),
                  const SizedBox(height: 30),
                  AppField(
                    labelText: "Password",
                    validator: _validator.forPassword,
                    obscure: obscurePassword,
                    prefixIcon: Icons.lock,
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      child: Icon(
                        obscurePassword
                            ? Icons.hide_source
                            : Icons.circle_outlined,
                        size: 20,
                      ),
                    ),
                    onChanged: (value) => _password = value,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(size.width, 40),
                      maximumSize: const Size(700, 60),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<AuthProvider>()
                            .signup(context, _email, _password);
                      }
                    },
                    child: const Text("SIGN UP"),
                  ),
                  const SizedBox(height: 40),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black54),
                      children: [
                        TextSpan(
                          style: TextStyle(fontSize: 13),
                          text: "DON'T HAVE AN ACCOUNT? ",
                        ),
                        TextSpan(
                          style: TextStyle(color: Colors.green),
                          text: "SIGN UP",
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => Navigator.pushNamed(context, "/signin"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
