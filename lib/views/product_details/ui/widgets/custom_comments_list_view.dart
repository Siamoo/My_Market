import 'package:flutter/material.dart';

class CustomCommentsListView extends StatelessWidget {
  const CustomCommentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: hight * 0.3,
      child: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          final comment = comments[index];
          return ListTile(
            title: Text(comment['name']!, style: TextStyle(fontSize: 16)),
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
  {
    'name': 'Waal siam',
    'comment': 'This a comment.',
    'image': 'assets/images/profile.jpeg',
  },
  {
    'name': 'Ali Ahmed',
    'comment': 'This is a comment.',
    'image': 'assets/images/profile.jpeg',
  },
  {
    'name': 'Mohamed Hassan',
    'comment': 'This is a comment.',
    'image': 'assets/images/profile.jpeg',
  },
  {
    'name': 'Sara Ibrahim',
    'comment': 'This is a comment.',
    'image': 'assets/images/profile.jpeg',
  },
  {
    'name': 'Laila Youssef',
    'comment': 'This is a comment.',
    'image': 'assets/images/profile.jpeg',
  },
  {
    'name': 'Omar Khaled',
    'comment': 'This is a comment.',
    'image': 'assets/images/profile.jpeg',
  },
  {
    'name': 'Nourhan Adel',
    'comment': 'This is a comment.',
    'image': 'assets/images/profile.jpeg',
  },
  {
    'name': 'Youssef Samir',
    'comment': 'This is a comment.',
    'image': 'assets/images/profile.jpeg',
  },
  // Add more comments as needed
];
