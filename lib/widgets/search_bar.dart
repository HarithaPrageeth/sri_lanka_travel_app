import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  final VoidCallback onClear;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    required this.onSearch,
    required this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onSearch,
        decoration: InputDecoration(
          hintText: 'Search places by name or location...',
          hintStyle: TextStyle(
            color: AppColors.text.withOpacity(0.5),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.accent,
          ),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.text.withOpacity(0.5),
                  ),
                  onPressed: () {
                    controller.clear();
                    onClear();
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}