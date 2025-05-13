import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/textfield/search_textfield.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final searchCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Filter the search items based on the query

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        centerTitle: false,
        title: SearchTextField(
          controller: searchCntrl,
          autoFocus: true,
          cursorColor: AppColors.faintText,
          borderColor: AppColors.btnBorder,
          hintText: 'Search...',
        ),
      ),
    );
  }
}
