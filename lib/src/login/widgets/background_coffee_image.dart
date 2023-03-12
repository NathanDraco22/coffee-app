import 'package:flutter/material.dart';


class BackgroundCoffeeImage extends StatelessWidget {
  const BackgroundCoffeeImage(this.imagePath,{super.key});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: media.width,
          height: media.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover
            )
          ),
          child: const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black87,
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