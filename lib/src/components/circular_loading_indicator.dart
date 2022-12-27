import 'package:flutter/material.dart';

class CircularLoadingIndicator extends StatelessWidget {
  const CircularLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}
