import 'package:final_coffee_shop/screens/auth/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_coffee_shop/screens/auth/signup_screen.dart';
import 'package:final_coffee_shop/screens/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  final String username = 'admin';
  final String password = 'admin123';

  void login() async {
    setState(() {
      _isLoading = true;
    });

    if (username == _usernameController.text &&
        password == _passwordController.text) {
      await Future.delayed(Duration(seconds: 2));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
      );
      setState(() {
        _isLoading = false;
      });
    } else {
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        _isLoading = false;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor:  Color.fromARGB(255, 117, 65, 44), 
            content: Row(
              children: [
                Icon(Icons.warning, color: Colors.white),
                const SizedBox(width: 20),
                Text('Invalid username or password'),
              ],
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/background.jpg', width: 800),
                Text('Welcome back!!'),
            
                const SizedBox(height: 30),
            
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 117, 65, 44), ),
                    hintText: 'Input username',
                    hintStyle: TextStyle(color: Color.fromARGB(255, 117, 65, 44), ),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 117, 65, 44), ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 117, 65, 44), ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
            
                const SizedBox(height: 12),
            
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 117, 65, 44), ),
                    hintText: 'Input password',
                    hintStyle: TextStyle(color: Color.fromARGB(255, 117, 65, 44),  fontSize: 14),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.lock),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 117, 65, 44), ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 117, 65, 44), ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
            
                const SizedBox(height: 20),
            
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 117, 65, 44), 
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: _isLoading
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.0,
                            ),
                          )
                        : Text('Sign In', style: TextStyle(fontSize: 15)),
                  ),
                ),
            
                const SizedBox(height: 25),
            
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignupScreen()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Color.fromARGB(255, 117, 65, 44), ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
