import 'package:flutter/material.dart';
import '../models/review.dart';
import '../utils/constants.dart';
import 'review_card.dart';
import 'rating_stars.dart';

class ReviewsSection extends StatelessWidget {
  final List<Review> reviews;
  final VoidCallback onAddReview;

  const ReviewsSection({
    Key? key,
    required this.reviews,
    required this.onAddReview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate average rating
    double averageRating = reviews.isEmpty
        ? 0
        : reviews.map((r) => r.rating).reduce((a, b) => a + b) / reviews.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rating Summary
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              // Average Rating
              Expanded(
                child: Column(
                  children: [
                    Text(
                      averageRating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RatingStars(rating: averageRating, size: 20),
                    const SizedBox(height: 8),
                    Text(
                      '${reviews.length} ${reviews.length == 1 ? 'review' : 'reviews'}',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.text.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              // Rating Distribution (simplified)
              Expanded(
                child: Column(
                  children: [
                    _buildRatingBar(5, reviews.where((r) => r.rating >= 4.5).length),
                    _buildRatingBar(4, reviews.where((r) => r.rating >= 3.5 && r.rating < 4.5).length),
                    _buildRatingBar(3, reviews.where((r) => r.rating >= 2.5 && r.rating < 3.5).length),
                    _buildRatingBar(2, reviews.where((r) => r.rating >= 1.5 && r.rating < 2.5).length),
                    _buildRatingBar(1, reviews.where((r) => r.rating < 1.5).length),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Write Review Button
        ElevatedButton.icon(
          onPressed: onAddReview,
          icon: const Icon(Icons.rate_review),
          label: const Text('Write a Review'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            minimumSize: const Size(double.infinity, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Reviews List
        const Text(
          'User Reviews',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
        ),
        const SizedBox(height: 16),
        reviews.isEmpty
            ? Container(
                padding: const EdgeInsets.all(40),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Icon(
                      Icons.rate_review_outlined,
                      size: 60,
                      color: AppColors.text.withOpacity(0.3),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'No reviews yet',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.text.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Be the first to review!',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.text.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return ReviewCard(review: reviews[index]);
                },
              ),
      ],
    );
  }

  Widget _buildRatingBar(int stars, int count) {
    int totalReviews = reviews.length;
    double percentage = totalReviews > 0 ? count / totalReviews : 0;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            '$stars ★',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.text.withOpacity(0.7),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: AppColors.text.withOpacity(0.1),
              color: Colors.amber,
              minHeight: 6,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 12,
              color: AppColors.text.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}