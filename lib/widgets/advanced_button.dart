
import 'package:adaptive_flutter/widgets/utils/colors.dart';
import 'package:flutter/material.dart';

class AdvancedButton extends StatelessWidget {
  const AdvancedButton({
    Key? key, required this.onPressed, required this.text, required this.colors, this.borderColor, required this.textColor,
  }) : super(key: key);
  final Function() onPressed;
  final String text;
  final Color colors;
  final Color? borderColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Center(
        child: SizedBox(
          width: 400,
          height: 50,
          child: MaterialButton(
            onPressed: onPressed,
            height: 40,
            color:   colors,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),

            ),
            child: Row(
              children:  [
                const SizedBox(width: 140),
                Text(
                  text,
                  style:  TextStyle(
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
