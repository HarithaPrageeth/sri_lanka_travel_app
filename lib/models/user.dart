class UserModel {
  final String uid;
  final String email;
  final String name;
  final String? photoUrl;
  final DateTime? createdAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.photoUrl,
    this.createdAt,
  });

  // Create from Firebase User
  factory UserModel.fromFirebase(User firebaseUser) {
    return UserModel(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      name: firebaseUser.displayName ?? 'Traveler',
      photoUrl: firebaseUser.photoURL,
      createdAt: firebaseUser.metadata.creationTime,
    );
  }
}