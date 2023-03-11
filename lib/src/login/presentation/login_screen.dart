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
                child: BlurBox(
                  child: Column(
                    children: [
                      Text("HOLA MUNDO"),

                      TextField()
                    ],
                  ),
                )
              )
            ],
          ),
        ],
      )
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
            width: 2
           ),
           color: const Color(0Xff1a1f1b).withOpacity(0.6),
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