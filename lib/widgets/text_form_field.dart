import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({
    Key? key,
    required this.hintText,
    this.iconShower = false,
    this.iconPressed,
    this.customIcon,
    this.textShow = false,
    this.controller,
    this.onChanged,
    this.errorText,
    this.inputFormatter,
  }) : super(key: key);
  final String hintText;
  final bool iconShower;
  final void Function()? iconPressed;
  final Widget? customIcon;
  final bool textShow;
  final TextEditingController? controller;
  final String? errorText;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Center(
        child: SizedBox(
          width: 400,
          child: TextField(
            onChanged: onChanged,
            inputFormatters: inputFormatter,
            controller: controller,
            obscureText: textShow,
            decoration: InputDecoration(
              errorMaxLines: 2,
              errorText: errorText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: hintText,
              suffixIcon: IconButton(
                icon: iconShower ? customIcon! : const SizedBox(),
                onPressed: iconPressed,
              ),
              hintStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
