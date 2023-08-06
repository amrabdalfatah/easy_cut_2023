import 'package:easycut/core/utils/dimensions.dart';
import 'package:easycut/core/widgets/small_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final TextInputType type;
  const CustomTextFormField({
    Key? key,
    required this.text,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: TextFormField(
        keyboardType: type,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: SmallText(
            text: text,
            color: const Color(0xFF8391A1),
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w500,
            size: Dimensions.font16,
          ),
        ),
      ),
    );
  }
}
