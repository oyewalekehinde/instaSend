import 'package:flutter/material.dart';
import 'package:insta_send/core/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final Widget textfield;
  const RoundedPasswordField({
    Key? key,
    required this.textfield,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(child: textfield

        // TextField(
        //   obscureText: true,
        //   onChanged: onChanged,
        //   cursorColor: kPrimaryColor,
        //   decoration: InputDecoration(
        //     hintText: "Password",
        //     icon: Icon(
        //       Icons.lock,
        //       color: kPrimaryColor,
        //     ),
        //     suffixIcon: Icon(
        //       Icons.visibility,
        //       color: kPrimaryColor,
        //     ),
        //     border: InputBorder.none,
        //   ),
        // ),
        );
  }
}
