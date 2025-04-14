import 'package:flutter/material.dart';

class ContactSearchItem extends StatelessWidget {
  final String name;
  final String email;
  final Color? avatarColor;
  final TextStyle? nameStyle;
  final TextStyle? emailStyle;

  const ContactSearchItem({
    super.key,
    required this.name,
    required this.email,
    this.avatarColor,
    this.nameStyle,
    this.emailStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: avatarColor ?? Colors.blue,
        child: const Icon(Icons.person, color: Colors.white),
      ),
      title: Text(
        name,
        style: nameStyle ?? const TextStyle(fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        email,
        style: emailStyle ?? const TextStyle(color: Colors.grey),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
