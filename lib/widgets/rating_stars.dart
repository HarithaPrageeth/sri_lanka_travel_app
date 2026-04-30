import 'package:flutter/material.dart';
import '../utils/constants.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final bool showLabel;

  const RatingStars({
    Key? key,
    required this.rating,
    this.size = 20,
    this.showLabel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(fullStars, (index) {
          return Icon(Icons.star, color: Colors.amber, size: size);
        }),
        if (hasHalfStar)
          Icon(Icons.star_half, color: Colors.amber, size: size),
        ...List.generate(5 - fullStars - (hasHalfStar ? 1 : 0), (index) {
          return Icon(Icons.star_border, color: Colors.amber, size: size);
        }),
        if (showLabel)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              rating.toString(),
              style: TextStyle(
                fontSize: size * 0.8,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
          ),
      ],
    );
  }
}