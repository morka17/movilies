import 'package:flutter/material.dart';

class AppField extends StatelessWidget {
  const AppField({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    this.obscure = false,
    this.suffix,
    this.onChanged, this.validator,
  }) : super(key: key);

  final IconData prefixIcon;
  final String labelText;
  final bool obscure;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscure,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: const Color(0XFFD16002),
        ),
        suffix: suffix,
        labelText: labelText,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFFD16002),
          ),
        ),
      ),
    );
  }
}
