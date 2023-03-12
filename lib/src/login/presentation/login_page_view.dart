import 'package:app_coffee/src/login/presentation/login_screen.dart';
import 'package:app_coffee/src/login/presentation/register_screen.dart';
import 'package:flutter/material.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.9999);
    const screens = [LoginScreen(), RegisterScreen()];
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


class LoginMediator extends InheritedWidget {
  const LoginMediator({
    super.key, 
    required Widget child,  
    required this.pageController,
  }) : super(child: child);

  final PageController pageController;

  static LoginMediator of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoginMediator>()!;
  }

  @override
  bool updateShouldNotify(LoginMediator oldWidget) {
    return false;
  }
}