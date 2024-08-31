import 'package:flutter/material.dart';

class DetailUserPage extends StatelessWidget {
  final int id;
  const DetailUserPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Detail User ke-$id',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                "https://picsum.photos/200/200?random=$id",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Name: User $id'),
          Text('Email: user$id@example.com'),
          const Text('Address: Street 1, City, State, Zipcode'),
          const Text('Phone: 123-456-7890'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
