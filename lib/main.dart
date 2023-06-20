import 'package:flutter/material.dart';
import 'package:mindmystery/pages/NavigationPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> main() async {
  await Supabase.initialize(
    url: "https://aoztgwgrszgbxfuqhkhp.supabase.co", 
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFvenRnd2dyc3pnYnhmdXFoa2hwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODcwMjcwMzAsImV4cCI6MjAwMjYwMzAzMH0.bs6e47oKCQboee7R79sEtBDLT2FKdF2KlTyx5cPJkp8"
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const NavigationPage());
  }
}
