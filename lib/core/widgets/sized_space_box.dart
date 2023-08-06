import 'package:easycut/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SizedSpaceBox extends StatelessWidget {
  const SizedSpaceBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height20,
    );
  }
}
