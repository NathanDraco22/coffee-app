import 'package:flutter/material.dart';

class LinearLoadingButton extends StatelessWidget {
  const LinearLoadingButton({
    super.key,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.width = 120, 
    this.child
  });

  final EdgeInsetsGeometry? padding;
  final double width;
  final void Function(void Function(bool value) setLoading ) onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);
    void setLoading( bool value ) => isLoadingNotifier.value = value;
    return ValueListenableBuilder(
      valueListenable: isLoadingNotifier,
      builder: (context, value, algo) {
        return FilledButton(
          style: FilledButton.styleFrom(
            elevation: 0.0,
            padding: padding 
          ),
          onPressed: value ? null : () => onPressed(setLoading),
          child: SizedBox(
            width: width,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: value 
                ? const LinearProgressIndicator() 
                : child
            ),
          )
        );
      }
    );
  }
}
