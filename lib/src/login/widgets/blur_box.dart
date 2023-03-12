import 'dart:ui';
import 'package:flutter/material.dart';


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
        filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
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