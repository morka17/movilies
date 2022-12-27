import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movilies/src/components/app_logo.dart';
import 'package:movilies/src/providers/auth_provider.dart';
import 'package:movilies/src/utils/input_validators.dart';
import 'package:provider/provider.dart';

import '../components/appfield.dart';

class SigninScreen extends StatefulWidget {
  static const String id = "/signin";
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool obscurePassword = true;

  final TextFieldValidator _validator = TextFieldValidator();

  final GlobalKey<FormState> _formKey = GlobalKey();

  String _email = "";
  String _password = "";

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
                  Hero(
                    tag: "app_logo",
                    child: AppLogo(
                      height: 200,
                      width: 200,
                    ),
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
                    obscure: obscurePassword,
                    validator: _validator.forTextOnly,
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
                  Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    width: double.infinity,
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black54),
                          text: "FORGOT PASSWORD",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => print("forgot password"),
                        ),
                      ),
                    ),
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
                            .signin(context, _email, _password);
                      }
                    },
                    child: const Text("SIGN IN"),
                  ),
                  const SizedBox(height: 40),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black54),
                      children: [
                        const TextSpan(
                          style: TextStyle(fontSize: 13),
                          text: "DON'T HAVE AN ACCOUNT? ",
                        ),
                        TextSpan(
                          style: const TextStyle(color: Colors.green),
                          text: "SIGN UP",
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => Navigator.pushNamed(context, "/signup"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
