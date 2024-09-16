import 'package:flutter/material.dart';

class RoleRadio extends StatelessWidget {
  final String role;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const RoleRadio({
    super.key,
    required this.role,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: role,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(role),
      ],
    );
  }
}
