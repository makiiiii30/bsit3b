import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 151, 138, 77),
        foregroundColor: Colors.white,
        title: Text('Message'),
      ),
      body: Center(child: Text('No message')),
    );
  }
}
