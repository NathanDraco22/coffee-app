import 'package:app_coffee/src/login/presentation/login_screen.dart';
import 'package:app_coffee/src/login/presentation/register_screen.dart';
import 'package:flutter/material.dart';

import 'login_mediator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.9999);
    const screens = [LoginPage(), RegisterPage()];
    return LoginMediator(
      pageController: pageController,
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: screens.length,
        itemBuilder: (BuildContext context, int index) { 
            return screens[index];
         },
      ),
    );
  }
}


