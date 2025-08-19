import 'package:flutter/material.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 96,
        height: 96,
        child: ClipOval(
          child: Image.network(
            'https://lh3.googleusercontent.com/a/ACg8ocLrE7IW4-NHs77q5X31C2Eg2eJaAu4_ExuSvNZLRw1d4JhBfvZ7VQ=s288-c-no',
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) =>
                Center(child: Icon(Icons.error, size: 40, color: Colors.red)),
          ),
        ),
      ),
    );
  }
}
