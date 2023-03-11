import 'dart:ui';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1f1b),
      body: Column(
        children:  [
          Stack(
            alignment: Alignment.center,
            children: [
              const _BackGround(),
              Positioned(
                child: Column(
                  children: [
                    BlurBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Wellcome To Coffee App :)", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary
                            ),),
                            const TextField(),
                            const TextField(),
                            FilledButton(
                              style: FilledButton.styleFrom(
                                elevation: 0.0,
                                padding: const EdgeInsets.symmetric(horizontal:40 )
                              ),
                              onPressed: () {}, 
                              child: const Text("Login")
                            )
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),
                    
                    const _CreateAccountWidget()



                  ],
                )
              )
            ],
          ),
        ],
      )
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
          onTap: () => print("Tapped"),
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

class BlurBox extends StatelessWidget {
  const BlurBox({
    super.key,
    this.child
  });
  
  final Widget? child;


  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8,sigmaY: 8),
        child: Container(
          width: media.width *0.85,
          height: media.height * 0.5,
          decoration: BoxDecoration(
           border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 2
           ),
           color: const Color(0Xff1a1f1b).withOpacity(0.7),
           borderRadius: BorderRadius.circular(20)
          ),
          child: child,
        ),
      ),
    );
  }
}

class _BackGround extends StatelessWidget {
  const _BackGround();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: media.width,
          height: media.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/coffee-intro.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Colors.black26,
                ]
              )
            ),
          )
        ),
      ],
    );
  }
}