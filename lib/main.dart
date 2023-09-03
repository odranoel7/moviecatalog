import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:moviecatalogg/screens/home.dart';
import 'package:moviecatalogg/screens/home2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      blocs: [
        
      ],
      dependencies: [
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Catálogo de Filmes",
        home: Homee(),
      ),
      
    );
    
  }
}