import 'package:flutter/material.dart';



class RetryButton extends StatelessWidget {
  const RetryButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: onPressed,
        child: const Text("retry"),
      ),
    );
  }
}
