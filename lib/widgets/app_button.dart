import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final String textButton;
  final TextStyle? textStyle;
  final Color? textButtonColor;
  final Widget? iconbutton;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool isLoading;
  final Color borderColor;
  final bool disabled;
  final Color loadingIndicatorColor;
  final double loadingIndicatorSize;
  final double loadingIndicatorStrockWidth;
  final Gradient? linearGradient;
  const AppButton(
      {super.key,
      required this.textButton,
      required this.onTap,
      this.width = 120,
      this.height = 50,
      this.textStyle,
      this.backgroundColor = Colors.white,
      this.borderRadius,
      this.boxShadow,
      this.iconbutton,
      this.padding,
      this.margin,
      this.textButtonColor,
      this.isLoading = false,
      this.disabled = false,
      this.borderColor = Colors.transparent,
      this.loadingIndicatorColor = Colors.white,
      this.loadingIndicatorSize = 25,
      this.loadingIndicatorStrockWidth = 4.0,
      this.linearGradient});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: isLoading || disabled ? () {} : onTap,
      child: Container(
        width: width,
        height: height,
        // constraints: BoxConstraints.expand(
        //   minHeight: height.h,
        //   minWidth: width.w,
        // ),
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: disabled
              ? const Color.fromARGB(255, 228, 227, 227)
              : backgroundColor,
          gradient: disabled ? null : linearGradient,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: loadingIndicatorSize,
                  height: loadingIndicatorSize,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: loadingIndicatorStrockWidth,
                      color: loadingIndicatorColor,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (iconbutton != null) ...[
                      iconbutton!,
                      const SizedBox(width: 7),
                    ],
                    Flexible(
                      child: Text(
                        textButton,
                        textAlign: TextAlign.center,
                        style: textStyle ??
                            TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: disabled
                                  ? theme.onBackground
                                  : textButtonColor ?? theme.onPrimary,
                            ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
