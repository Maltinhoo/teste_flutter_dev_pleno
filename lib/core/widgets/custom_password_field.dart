import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final String? hint;
  final Function(String?)? validator;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  const CustomPasswordField({
    super.key,
    this.hint,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool error = false;
  String? errorText;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          cursorColor: Colors.grey[800],
          style: const TextStyle(
            fontSize: 14,
            decorationThickness: 0,
          ),
          validator: (value) {
            if (widget.validator != null) {
              errorText = widget.validator?.call(value);
              if (errorText != null && errorText!.isNotEmpty) {
                setState(() {
                  error = true;
                });
                return widget.validator?.call(value);
              } else {
                setState(() {
                  error = false;
                  errorText = null;
                });
              }
            }
            return null;
          },
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10.5,
            ),
            isDense: true,
            errorMaxLines: 1,
            errorText: errorText,
            errorStyle: const TextStyle(
              color: Colors.transparent,
              fontSize: 0,
            ),
            hintText: widget.hint,
            hintStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[800]!,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[800]!,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[800]!,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            suffixIcon: IconButton(
              padding:
                  const EdgeInsets.symmetric(horizontal: 11, vertical: 10.5),
              constraints: const BoxConstraints(maxHeight: 40, maxWidth: 40),
              icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
              color: Colors.black,
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
          ),
        ),
        AnimatedContainer(
          height:
              (error && (errorText != null && errorText!.isNotEmpty)) ? 30 : 0,
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.red[50],
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Text(
            errorText ?? '',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
