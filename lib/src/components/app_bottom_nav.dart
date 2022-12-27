import 'package:flutter/material.dart';
import 'package:movilies/src/providers/home.dart';
import 'package:provider/provider.dart';

class AppBottomNav extends StatefulWidget {
  const AppBottomNav({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black54,
      unselectedItemColor: Colors.black38,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Notifications",
        ),
      ],
      currentIndex: context.watch<HomeProvider>().currentIndex,
      onTap: (index) {
        context.read<HomeProvider>().currentIndex = index;
      },
    );
  }
}
