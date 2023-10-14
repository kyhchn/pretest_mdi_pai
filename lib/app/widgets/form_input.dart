import 'package:flutter/material.dart';
import 'package:pretest_mdi_pai/app/data/themes/typography.dart';
import 'package:sizer/sizer.dart';

class FormInput extends StatefulWidget {
  final String label;
  final String hint;
  final TextInputType inputType;
  final TextEditingController controller;
  final bool? readOnly;
  final String? Function(String?)? validator;

  const FormInput({
    Key? key,
    required this.label,
    required this.hint,
    required this.inputType,
    required this.controller,
    this.validator,
    this.readOnly,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 2.h),
            Text(
              widget.label,
              style: TypographyStyles.b2.semibold(),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        TextFormField(
          validator: super.widget.validator,
          controller: widget.controller,
          readOnly: widget.readOnly ?? false,
          keyboardType: widget.inputType,
          obscureText: widget.inputType == TextInputType.visiblePassword
              ? !isPasswordVisible
              : false,
          style: TypographyStyles.b3.semibold(color: Colors.grey.shade600),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: Colors.grey.shade600,
            ),
            hintText: widget.hint,
            suffixIcon: widget.inputType == TextInputType.visiblePassword
                ? IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey.shade600,
                    ),
                    onPressed: togglePasswordVisibility,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
