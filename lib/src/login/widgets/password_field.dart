import 'package:flutter/material.dart';


class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) { 
    bool isObscured = true;
    return  StatefulBuilder(
      builder: (context, setState) {
        final visibilityIcon = isObscured ? Icons.visibility_off : Icons.visibility;
        return TextField(
          textAlignVertical: TextAlignVertical.center,
          obscureText: isObscured,
          style: const TextStyle(
            fontSize: 18
          ),
          decoration: InputDecoration(
            labelText: "Password",
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: InkWell(
              onTap: () => setState(()=> isObscured = !isObscured),
              child: Icon(visibilityIcon)
            )
          ),
        );
      }
    );
  }
}