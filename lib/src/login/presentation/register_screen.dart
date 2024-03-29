import 'package:flutter/material.dart';
import 'package:loading_button/loading_button.dart';

import '../widgets/background_coffee_image.dart';
import '../widgets/password_field.dart';
import '../widgets/blur_box.dart';
import '../widgets/phone_number_field.dart';
import 'login_mediator.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                const TextField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: Icon(Icons.account_circle)
                  ),
                ),
                const PhoneNumberField(),
                const PasswordField(
                  labelText: "Password",
                ),
                const PasswordField(
                  labelText: "Confirm Password",
                ),


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

