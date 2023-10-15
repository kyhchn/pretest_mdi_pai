import 'package:flutter/material.dart';
import 'package:pretest_mdi_pai/app/data/themes/colors.dart';
import 'package:pretest_mdi_pai/app/data/themes/typography.dart';
import 'package:sizer/sizer.dart';

enum Type { primary, secondary, warning }

class DefaultButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Type type;
  const DefaultButton(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            side: BorderSide(
                width: 1,
                color: type == Type.primary
                    ? CustomColor.primary
                    : type == Type.warning
                        ? Colors.red
                        : Colors.grey.shade300),
            backgroundColor: type == Type.primary
                ? CustomColor.primary
                : type == Type.warning
                    ? Colors.red
                    : Colors.white,
            elevation: 0,
            textStyle: TypographyStyles.b2.semibold(
                color:
                    type == Type.primary ? Colors.white : CustomColor.primary),
            foregroundColor:
                type == Type.secondary ? Colors.grey.shade600 : Colors.white,
            padding: EdgeInsets.symmetric(vertical: 1.5.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: child);
  }
}
