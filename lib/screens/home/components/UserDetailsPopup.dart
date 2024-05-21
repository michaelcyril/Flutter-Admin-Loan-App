import 'package:flutter/material.dart';

class UserDetailsPopup extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserDetailsPopup({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("USER INFORMATION"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Phone: ${user['phone_number']}'),
          Text('Email: ${user['email']}'),
          Text('User Type: ${user['usertype']}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
