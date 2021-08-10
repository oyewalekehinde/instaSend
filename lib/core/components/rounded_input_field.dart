import 'package:flutter/material.dart';
import 'package:insta_send/core/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final IconData icon;
  final Widget textfield;
  const RoundedInputField({
    Key? key,
    this.icon = Icons.person,
    required this.textfield,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(child: textfield
        // TextField(
        //   onChanged: onChanged,
        //   cursorColor: kPrimaryColor,
        //   decoration: InputDecoration(
        //     icon: Icon(
        //       icon,
        //       color: kPrimaryColor,
        //     ),
        //     hintText: hintText,
        //     border: InputBorder.none,
        //   ),
        // ),
        );
  }
}
