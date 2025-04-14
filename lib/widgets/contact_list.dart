import 'package:flutter/material.dart';
import 'package:micrm_demo/models/contact.dart';
import 'package:micrm_demo/widgets/contact_item.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts;
  final EdgeInsets padding;

  const ContactList({
    Key? key,
    required this.contacts,
    this.padding = const EdgeInsets.only(
      bottom: 40,
      left: 10,
      right: 10,
      top: 15,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding,
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ContactItem(
          name: contact.name,
          company: contact.company,
          location: contact.location,
          amount: contact.amount,
          timeAgo: contact.timeAgo,
        );
      },
    );
  }
}
