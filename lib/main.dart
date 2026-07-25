import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_coffee_shop/providers/cart_provider.dart';
import 'package:final_coffee_shop/screens/auth/login_screen.dart';

void main() {
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MainApp(),
    ),
  
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add to Cart App',
      theme: ThemeData(
        useMaterial3: true,
       
        primaryColor: Color.fromARGB(255, 151, 138, 77),
      
        ),
      home: LoginScreen(),
    
    );
  }
}
