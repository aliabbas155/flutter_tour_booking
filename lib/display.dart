import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('User data').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Display a loading indicator while waiting for data.
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final userData = documents[index].data() as Map<String, dynamic>;

              return ListTile(
                title: Text(
                    'Name: ${userData['firstName']} ${userData['lastName']}'),
                subtitle: Text('Email: ${userData['userEmail']}'),
                // Add more fields as needed.
              );
            },
          );
        },
      ),
    );
  }
}
