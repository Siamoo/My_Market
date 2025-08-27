import 'package:e_commerce/core/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomCommentsListView extends StatelessWidget {
  const CustomCommentsListView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: hight * 0.3,
      child: StreamBuilder(
        stream: Supabase.instance.client
            .from('comments_table')
            .stream(primaryKey: ['id'])
            .eq('for_product', product.id!)
            .order('created_at', ascending: false),

        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (asyncSnapshot.hasError) {
            return Center(child: Text('Error: ${asyncSnapshot.error}'));
          }
          if (!asyncSnapshot.hasData || asyncSnapshot.data!.isEmpty) {
            return const Center(child: Text('No comments available.'));
          }
          if (asyncSnapshot.hasData) {
            List<Map<String, dynamic>> comments = asyncSnapshot.data!;
          }
          return ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return ListTile(
                title: Text(comment['name']!, style: TextStyle(fontSize: 16)),
                subtitle: Text(
                  comment['comment']!,
                  style: TextStyle(fontSize: 12),
                ),
              );
            },
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
