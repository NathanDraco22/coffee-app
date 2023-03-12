import 'package:flutter/material.dart';
import 'package:loading_button/loading_button.dart';

import '../widgets/background_coffee_image.dart';
import '../widgets/blur_box.dart';
import 'login_mediator.dart';

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
                Positioned(
                  child: _RegisterForm()
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}




class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

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
                  "Create new User :D", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary
                  ),
                ),
                const TextField(),
                const TextField(),
                const TextField(),
                LinearLoadingButton(
                  onPressed: (setLoading) async{
                    setLoading(true);
                    await Future.delayed(const Duration(seconds: 2));
                    setLoading(false);          
                  },
                  child: const Text(
                    "SignUp", 
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
    final pageController = LoginMediator.of(context).pageController;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("If you have an account"),
        GestureDetector(
          onTap: () => 
            pageController.animateToPage(0, 
              duration: const Duration(milliseconds: 500), 
              curve: Curves.linearToEaseOut),
          child: Text(
            "LogIn HERE !", 
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

