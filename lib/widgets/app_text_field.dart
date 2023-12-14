import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onchange;
  final Widget? icon;
  final bool obscureText;
  final Widget? suffexicon;
  final Widget? prefexicon;
  final BorderRadius borderRadius;
  final TextInputType type;
  final int? maxLine;
  final EdgeInsetsGeometry? contentPadding;
  final bool readOnly;
  final TextInputAction textInputAction;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final Color fillColor;
  final double prefexIconWidth;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool enabled;

  const AppTextField(
      {Key? key,
      required this.hintText,
      this.prefexicon,
      this.prefexIconWidth = 10,
      this.maxLength,
      this.maxLengthEnforcement,
      this.obscureText = false,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      required this.validator,
      this.onchange,
      this.icon,
      required this.controller,
      required this.type,
      this.suffexicon,
      this.maxLine,
      this.readOnly = false,
      this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
      this.textInputAction = TextInputAction.done,
      this.onFieldSubmitted,
      this.focusNode,
      this.fillColor = const Color(0xFFF0F2F5),
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return TextFormField(
      enabled: enabled,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      textInputAction: textInputAction,
      controller: controller,
      validator: validator,
      onChanged: onchange,
      obscureText: obscureText,
      keyboardType: type,
      maxLines: obscureText ? 1 : maxLine,
      readOnly: readOnly,
      decoration: InputDecoration(
        counterText: "",
        filled: true,
        fillColor: readOnly ? const Color(0xFFE4E3E3) : fillColor,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            width: 1.0,
            // color: Color(0xffF5F8FD),
            color: theme.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            width: 1.0,
            color: Color(0xffF5F8FD),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            width: 1.0,
            color: theme.primary,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            width: 1.0,
            color: Color(0xffF5F8FD),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            width: 1.0,
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            width: 1.0,
            // color: Color(0xffF5F8FD),
            color: theme.primary,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: theme.surface),
        suffixIcon: suffexicon,
        prefixIcon: icon == null
            ? null
            : Container(
                width: prefexIconWidth,
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                child: Center(child: icon),
              ),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
