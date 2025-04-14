import 'package:flutter/material.dart';
import 'package:micrm_demo/models/contact.dart';
import 'package:micrm_demo/widgets/appbar_widget.dart';
import 'package:micrm_demo/widgets/contact_list.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                CustomAppBar(title: "My Contacts"),

                Expanded(child: ContactList(contacts: Contact.sampleContacts)),
              ],
            ),
          ),

          Positioned(
            right: 16,
            bottom: 5,
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Theme.of(context).primaryColor,
              shape: CircleBorder(),
              constraints: BoxConstraints.tightFor(
                width: 40.0, // Kích thước tùy ý
                height: 40.0,
              ),
              child: Icon(Icons.add_outlined, size: 35.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
