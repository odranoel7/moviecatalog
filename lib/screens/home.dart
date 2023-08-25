import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Text("Catálogo de filmes"),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: const _homeList(),
    );
  }
}

class _homeList extends StatelessWidget {
  const _homeList({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Hello world")
      ],
    );
  }
}