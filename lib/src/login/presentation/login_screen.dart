import 'package:app_coffee/src/login/presentation/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_button/loading_button.dart';

import '../widgets/background_coffee_image.dart';
import '../widgets/blur_box.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            Stack(
              alignment: Alignment.center,
              children: const[
                BackgroundCoffeeImage("assets/images/coffee-intro2.jpg"),
                Positioned(
                  child: _LoginForm()
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlurBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Wellcome To Coffee App :)", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary
                  ),
                ),
                const TextField(),
                const TextField(),
                LinearLoadingButton(
                  onPressed: (setLoading) async{
                    setLoading(true);
                    await Future.delayed(const Duration(seconds: 2));
                    setLoading(false);          
                  },
                  child: const Text(
                    "Login", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        const SizedBox(height: 20,),
        const _CreateAccountWidget()

      ],
    );
  }
}

class _CreateAccountWidget extends StatelessWidget {
  const _CreateAccountWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Don't an account yet?"),
        GestureDetector(
          onTap: () => Navigator.push(
            context, 
            CupertinoPageRoute(builder: (context) => const RegisterScreen(),)
          ),
          child: Text(
            "Create one HERE !", 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary
            ),
          ),
        )
      ],
    );
  }
}



