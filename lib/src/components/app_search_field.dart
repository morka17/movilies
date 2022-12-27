import 'package:flutter/material.dart';
import 'package:movilies/src/providers/search.dart';
import 'package:provider/provider.dart';

class AppSeachField extends StatelessWidget {
  const AppSeachField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        onFieldSubmitted: (value) {
          context.read<SearchProvider>().isLoading = true;
          context.read<SearchProvider>().searchMovie(value);
        },
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: "Search here",
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          fillColor: Colors.white,
          enabled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
