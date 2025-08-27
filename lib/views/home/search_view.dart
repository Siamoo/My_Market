import 'package:e_commerce/views/home/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.searchQuery});
  final String searchQuery;
  @override
  Widget build(BuildContext context) {
    return  SearchViewBody(searchQuery: searchQuery);
  }
}