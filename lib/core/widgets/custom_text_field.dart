import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String? hint, label;
  final Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Color? borderColor;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField({
    super.key,
    this.hint,
    this.validator,
    this.controller,
    this.onChanged,
    this.label,
    this.borderColor,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool error = false;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: TextFormField(
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onFieldSubmitted,
            focusNode: widget.focusNode,
            onChanged: widget.onChanged,
            controller: widget.controller,
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
                  color: widget.borderColor ?? Colors.grey[800]!,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.grey[800]!,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[800]!),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              suffixIcon: error
                  ? AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: error ? 1 : 0,
                      child: const Icon(
                        Icons.error_outline_outlined,
                        color: Colors.red,
                      ),
                    )
                  : null,
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
            errorText ?? "",
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }
}
