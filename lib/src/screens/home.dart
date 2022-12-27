import 'package:flutter/material.dart';
import 'package:movilies/src/models/view.dart';
import 'package:movilies/src/providers/home.dart';
import 'package:provider/provider.dart';

import '../components/app_bottom_nav.dart';
import '../components/app_modal_popup.dart';
import '../components/app_search_field.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    View view = context.watch<HomeProvider>().view;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: view.title == "Search"
            ? const AppSeachField()
            : Text(context.watch<HomeProvider>().view.title),
        actions: [
          view.title == "Explore"
              ? IconButton(
                  onPressed: () {
                    showModelFiter(context);
                  },
                  icon: const Icon(Icons.filter_alt_outlined),
                )
              : Container(),
        ],
      ),
      body: SafeArea(child: context.watch<HomeProvider>().view.widget),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}
