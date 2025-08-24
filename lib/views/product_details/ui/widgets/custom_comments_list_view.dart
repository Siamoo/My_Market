import 'package:flutter/material.dart';

class CustomCommentsListView extends StatelessWidget {
  const CustomCommentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Adjust height as needed to fit your design
      child: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          final comment = comments[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(comment['image']!),
            ),
            title: Text(comment['name']!, style: TextStyle(fontSize: 14)),
            subtitle: Text(comment['comment']!, style: TextStyle(fontSize: 12)),
          );
        },
      ),
    );
  }
}

final List<Map<String, String>> comments = [
  {
    'name': 'Walid siam',
    'comment': 'This is a comment.',
    'image': 'assets/images/profile.jpeg',
  },
  {
    'name': 'Ahmed Ali',
    'comment': 'This is another comment.',
    'image': 'assets/images/profile.jpeg',
  },
  // Add more comments as needed
];
