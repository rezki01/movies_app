import 'package:flutter/material.dart';
import 'package:movies_app/common/common.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool isFilled;
  final double? radius;
  final Widget? suffix;
  final Widget? prefix;
  final Color? fillColor;
  final Function()? onTap;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    this.label,
    this.hint,
    this.validator,
    required this.obscureText,
    required this.isFilled,
    this.radius,
    this.suffix,
    this.prefix,
    this.fillColor,
    this.onTap,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool isObscure;

  @override
  void initState() {
    isObscure = widget.obscureText;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
          TextFormField(
            controller: widget.controller,
            obscureText: isObscure,
            validator: widget.validator,
            onTap: widget.onTap,
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.hint,
              suffixIcon: widget.suffix ??
                  (widget.obscureText
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(
                            isObscure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 14,
                          ),
                        )
                      : null),
              prefixIcon: widget.prefix,
              filled: widget.isFilled,
              fillColor: widget.fillColor,
              border: widget.isFilled
                  ? OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                        widget.radius ?? 16,
                      ),
                    )
                  : null,
            ),
          ),
        ]
    );
  }
}
