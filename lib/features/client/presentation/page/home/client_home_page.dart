import 'package:flutter/material.dart';

class ClientHomePage extends StatefulWidget {
  static const String name = 'client_home_page';
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('data'),),
    );
  }
}