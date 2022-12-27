import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movilies/src/providers/auth_provider.dart';
import 'package:movilies/src/providers/desc.dart';
import 'package:movilies/src/providers/explore.dart';
import 'package:movilies/src/providers/home.dart';
import 'package:movilies/src/providers/search.dart';
import 'package:movilies/src/providers/youtube.dart';
import 'package:movilies/src/screens/descripton.dart';
import 'package:movilies/src/screens/home.dart';
import 'package:movilies/src/screens/signin.dart';
import 'package:movilies/src/screens/signup.dart';
import 'package:provider/provider.dart';

void main()  {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ExploreProvider()),
        ChangeNotifierProvider(create: (_) => DescProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => YoutubeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movilies',
      theme: ThemeData(
        primaryColor: const Color(0XFFD16002),
        splashColor: const Color.fromARGB(255, 250, 200, 159),
      ),
      initialRoute: SigninScreen.id,
      routes: {
        SignupScreen.id: (context) => const SignupScreen(),
        SigninScreen.id: (context) => const SigninScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        DescriptionScreen.id: (context) => const DescriptionScreen(),
      },
    );
  }
}
