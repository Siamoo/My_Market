import 'package:e_commerce/views/home/widgets/categorie_view_body.dart';
import 'package:flutter/material.dart';

class CategorieView extends StatelessWidget {
  const CategorieView({super.key, required this.categorie});
  final String categorie;
  @override
  Widget build(BuildContext context) {
    return CategorieViewBody(categorie: categorie);
  }
}
