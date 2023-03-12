import 'package:flutter/material.dart';

import '../widgets/background_coffee_image.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            Stack(
              alignment: Alignment.center,
              children: const[
                BackgroundCoffeeImage("assets/images/coffee-intro.jpg"),
                // Positioned(
                //   child: _LoginForm()
                // )
              ],
            ),
          ],
        ),
      )
    );
  }
}