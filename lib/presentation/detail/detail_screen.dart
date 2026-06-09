import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int id;
  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Center(child: Text('$id')),
    );
  }
}
