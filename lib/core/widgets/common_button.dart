import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final Color? color;
  final double? width;
  final Color? labelColor;
  final BoxBorder? border;
  final bool enabled;
  const CommonButton({
    super.key,
    required this.label,
    this.onTap,
    this.color,
    this.width,
    this.labelColor,
    this.border,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enabled,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 16),
          decoration: BoxDecoration(
            color: enabled ? color ?? Colors.lightGreen : Colors.grey[300],
            borderRadius: BorderRadius.circular(100),
            border: border,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: enabled ? labelColor ?? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
