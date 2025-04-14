import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String name;
  final String company;
  final String location;
  final double amount;
  final int timeAgo;
  final Color avatarColor;
  final Color amountBackgroundColor;
  final bool showDivider;

  const ContactItem({
    super.key,
    required this.name,
    required this.company,
    required this.location,
    required this.amount,
    required this.timeAgo,
    this.avatarColor = Colors.blue,
    this.amountBackgroundColor = const Color(0xFFE0E0E0),
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: avatarColor,
            child: const Icon(Icons.person, color: Colors.white, size: 35),
            radius: 40,
          ),
          title: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                location,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: amountBackgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: Text(
                  "\$" + amount.toStringAsFixed(2),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "$timeAgo" + "d",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        if (showDivider)
          const Center(
            child: Divider(
              height: 1,
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
              color: Colors.grey,
            ),
          ),
      ],
    );
  }
}
