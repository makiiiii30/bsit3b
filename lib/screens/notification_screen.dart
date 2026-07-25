import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_coffee_shop/providers/cart_provider.dart';
import 'package:final_coffee_shop/screens/cart_screen.dart';
import 'package:final_coffee_shop/screens/message_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 117, 65, 44),
        foregroundColor: Colors.white,
        title: Text('Notifications'),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CartScreen()),
                  );
                },
                icon: Icon(Icons.shopping_cart_outlined),
              ),

              if (cart.itemCount > 0)
                Positioned(
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: Text(
                      '${cart.itemCount}',
                      style: TextStyle(color: Color.fromARGB(255, 117, 65, 44),),
                    ),
                  ),
                ),
            ],
          ),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MessageScreen()),
              );
            },
            icon: Icon(Icons.message_outlined),
          ),
        ],
      ),
      body: Center(child: Text('Notifications Page')),
    );
  }
}
