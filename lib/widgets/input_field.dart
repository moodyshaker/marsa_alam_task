import 'package:flutter/material.dart';

class MyInputField extends StatefulWidget {
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChange;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FormFieldValidator<String>? onSaved;
  final String? hintText;
  final String? labelText;
  final bool? readOnly;
  final FocusNode? focusNode;
  final int? minLines;
  final double? radius;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final bool? isRadiusBorder;

  const MyInputField({Key? key,
    this.onTap,
    this.onChange,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.radius,
    this.minLines,
    this.isPassword = false,
    this.controller,
    this.isRadiusBorder,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.readOnly,
  }) : super(key: key);

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      readOnly: widget.readOnly ?? false,
      controller: widget.controller,
      onTap: widget.onTap,
      onSaved: widget.onSaved,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChange,
      validator: widget.validator,
      maxLines: widget.minLines ?? 1,
      focusNode: widget.focusNode,
      obscureText: widget.isPassword! ? isObscure : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        border: widget.isRadiusBorder!
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              )
            : null,
      ),
    );
  }
}
