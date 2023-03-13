import 'package:flutter/material.dart';
import 'package:loading_button/loading_button.dart';

import '../widgets/background_coffee_image.dart';
import '../widgets/blur_box.dart';
import '../widgets/password_field.dart';
import '../widgets/phone_number_field.dart';
import 'login_mediator.dart';


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
                const PhoneNumberField(),
                const PasswordField(),
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
    final pageController = LoginMediator.of(context).pageController;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Don't an account yet?"),
        GestureDetector(
          onTap: () => 
            pageController.animateToPage(1, 
              duration: const Duration(milliseconds: 500), 
              curve: Curves.linearToEaseOut),
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



