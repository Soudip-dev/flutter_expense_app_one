import 'package:flutter/material.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart Page'),
      ),
      body: Center(
        child: Text('This is the Chart Page'),
      ),
    );
  }
}