import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_coffee_shop/models/product.dart';
import 'package:final_coffee_shop/providers/cart_provider.dart';
import 'package:final_coffee_shop/screens/cart_screen.dart';
import 'package:final_coffee_shop/screens/message_screen.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  final List<Product> products = [
    Product(id: '1', name: 'Americano', price: 120, image: 'assets/images/americano.jpg'),
    Product(id: '2', name: 'Caramel Macchiato', price: 150, image: 'assets/images/caramel machh.jpg'),
    Product(id: '3', name: 'Matcha', price: 150, image: 'assets/images/matcha.jpg'),
    Product(id: '4', name: 'Chocolate', price: 150, image: 'assets/images/chocolate.jpg'),
    Product(id: '5', name: 'Cookies', price: 150, image: 'assets/images/cookies.jpg'),
    Product(id: '6', name: 'Cheesecake', price: 150, image: 'assets/images/berrry.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 117, 65, 44),
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
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

      body: GridView.builder(
        padding: EdgeInsets.all(12),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .9,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
      
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(product.image, fit: BoxFit.contain),
                ),
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text('₱${product.price.toStringAsFixed(2)}'),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      cart.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          content: Text('${product.name} added to cart'),
                          duration: Duration(milliseconds: 700),
                        ),
                      );
                    },
                    child: Text('Add to Cart'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
