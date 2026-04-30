import 'package:flutter/material.dart';
import '../models/review.dart';
import '../utils/constants.dart';
import 'rating_stars.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Row
          Row(
            children: [
              // User Avatar
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(review.userImage),
                onBackgroundImageError: (_, __) {},
                child: Container(
                  color: AppColors.accent,
                  child: Text(
                    review.userName[0].toUpperCase(),
                    style: const TextStyle(color: AppColors.white),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // User Name and Date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      review.formattedDate,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.text.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              // Rating Stars
              RatingStars(rating: review.rating, size: 16),
            ],
          ),
          const SizedBox(height: 12),
          // Review Comment
          Text(
            review.comment,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: AppColors.text.withOpacity(0.8),
            ),
          ),
          // Review Images (if any)
          if (review.images != null && review.images!.isNotEmpty)
            const SizedBox(height: 12),
          if (review.images != null && review.images!.isNotEmpty)
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: review.images!.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.secondary,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        review.images![index],
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.image),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}