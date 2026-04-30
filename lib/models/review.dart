class Review {
  final String id;
  final String userId;
  final String userName;
  final String userImage;
  final double rating;
  final String comment;
  final DateTime date;
  final List<String>? images;

  Review({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.comment,
    required this.date,
    this.images,
  });

  // Get formatted date
  String get formattedDate {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  // Sample reviews for each place
  static List<Review> getReviewsForPlace(String placeId) {
    Map<String, List<Review>> allReviews = {
      '1': [ // Sigiriya reviews
        Review(
          id: 'r1',
          userId: 'u1',
          userName: 'Sarah Johnson',
          userImage: 'https://randomuser.me/api/portraits/women/1.jpg',
          rating: 5.0,
          comment: 'Absolutely breathtaking! The climb was worth every step. The views from the top are incredible. A must-visit in Sri Lanka!',
          date: DateTime.now().subtract(const Duration(days: 5)),
        ),
        Review(
          id: 'r2',
          userId: 'u2',
          userName: 'Michael Chen',
          userImage: 'https://randomuser.me/api/portraits/men/2.jpg',
          rating: 4.5,
          comment: 'Amazing historical site. The frescoes and the mirror wall are fascinating. Go early morning to avoid crowds and heat.',
          date: DateTime.now().subtract(const Duration(days: 12)),
        ),
        Review(
          id: 'r3',
          userId: 'u3',
          userName: 'Emma Watson',
          userImage: 'https://randomuser.me/api/portraits/women/3.jpg',
          rating: 5.0,
          comment: 'UNESCO World Heritage site at its best! The lion\'s paw entrance and the palace ruins on top are spectacular.',
          date: DateTime.now().subtract(const Duration(days: 25)),
        ),
      ],
      '2': [ // Temple of the Tooth reviews
        Review(
          id: 'r4',
          userId: 'u4',
          userName: 'David Kumar',
          userImage: 'https://randomuser.me/api/portraits/men/4.jpg',
          rating: 5.0,
          comment: 'Sacred and peaceful place. The architecture is stunning and the atmosphere is very spiritual.',
          date: DateTime.now().subtract(const Duration(days: 3)),
        ),
        Review(
          id: 'r5',
          userId: 'u5',
          userName: 'Lisa Anderson',
          userImage: 'https://randomuser.me/api/portraits/women/5.jpg',
          rating: 4.5,
          comment: 'Beautiful temple with rich history. The evening rituals are mesmerizing.',
          date: DateTime.now().subtract(const Duration(days: 18)),
        ),
      ],
      '3': [ // Mirissa Beach reviews
        Review(
          id: 'r6',
          userId: 'u6',
          userName: 'James Wilson',
          userImage: 'https://randomuser.me/api/portraits/men/6.jpg',
          rating: 5.0,
          comment: 'Paradise on earth! Clean beach, perfect waves, and amazing sunset views.',
          date: DateTime.now().subtract(const Duration(days: 2)),
        ),
        Review(
          id: 'r7',
          userId: 'u7',
          userName: 'Priya Sharma',
          userImage: 'https://randomuser.me/api/portraits/women/7.jpg',
          rating: 4.5,
          comment: 'Great for swimming and relaxing. Lots of good restaurants nearby.',
          date: DateTime.now().subtract(const Duration(days: 9)),
        ),
      ],
      '4': [ // Train Ride reviews
        Review(
          id: 'r8',
          userId: 'u8',
          userName: 'Robert Brown',
          userImage: 'https://randomuser.me/api/portraits/men/8.jpg',
          rating: 5.0,
          comment: 'Most scenic train journey ever! Tea plantations, mountains, and waterfalls.',
          date: DateTime.now().subtract(const Duration(days: 7)),
        ),
      ],
      '5': [ // Tea Plantations reviews
        Review(
          id: 'r9',
          userId: 'u9',
          userName: 'Nimal Perera',
          userImage: 'https://randomuser.me/api/portraits/men/9.jpg',
          rating: 4.5,
          comment: 'Beautiful tea estates. Learned a lot about tea production. The tea tasting was amazing!',
          date: DateTime.now().subtract(const Duration(days: 14)),
        ),
      ],
    };
    
    return allReviews[placeId] ?? [];
  }
}