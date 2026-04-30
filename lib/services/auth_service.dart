import 'package:flutter/material.dart';

// Mock User class
class MockUser {
  final String uid;
  final String? displayName;
  final String? email;
  final String? photoURL;

  MockUser({
    required this.uid,
    this.displayName,
    this.email,
    this.photoURL,
  });
}

class AuthService {
  MockUser? _currentUser;
  
  // Demo users for testing
  final List<Map<String, String>> _demoUsers = [
    {
      'email': 'demo@example.com',
      'password': 'password123',
      'name': 'Demo User',
      'photoUrl': '',
    },
    {
      'email': 'amara@serendipity.lk',
      'password': 'password123',
      'name': 'Amara Perera',
      'photoUrl': '',
    },
    {
      'email': 'user@test.com',
      'password': '123456',
      'name': 'Test User',
      'photoUrl': '',
    },
  ];

  // Stream of auth state changes
  Stream<MockUser?> get user => Stream.value(_currentUser);

  // Get current user
  MockUser? get currentUser => _currentUser;

  // Sign in with Google (Mock)
  Future<MockUser?> signInWithGoogle() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      
      _currentUser = MockUser(
        uid: 'google_user_123',
        displayName: 'Google User',
        email: 'google@example.com',
        photoURL: 'https://randomuser.me/api/portraits/men/1.jpg',
      );
      
      return _currentUser;
    } catch (e) {
      print('Google Sign In Error: $e');
      return null;
    }
  }

  // Sign in with Email and Password
  Future<MockUser?> signInWithEmail(String email, String password) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Find user in demo list
      final user = _demoUsers.firstWhere(
        (u) => u['email'] == email && u['password'] == password,
        orElse: () => {},
      );
      
      if (user.isNotEmpty) {
        _currentUser = MockUser(
          uid: 'email_user_${DateTime.now().millisecondsSinceEpoch}',
          displayName: user['name'],
          email: user['email'],
          photoURL: user['photoUrl'],
        );
        return _currentUser;
      }
      
      return null;
    } catch (e) {
      print('Email Sign In Error: $e');
      return null;
    }
  }

  // Sign up with Email and Password
  Future<MockUser?> signUpWithEmail(String email, String password, String name) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Check if email already exists
      final existingUser = _demoUsers.any((u) => u['email'] == email);
      if (existingUser) {
        return null;
      }
      
      _currentUser = MockUser(
        uid: 'new_user_${DateTime.now().millisecondsSinceEpoch}',
        displayName: name,
        email: email,
        photoURL: '',
      );
      
      return _currentUser;
    } catch (e) {
      print('Email Sign Up Error: $e');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    _currentUser = null;
  }

  // Check if user is signed in
  bool isSignedIn() {
    return _currentUser != null;
  }

  // Get user display name
  String getUserName() {
    return _currentUser?.displayName ?? 'Traveler';
  }

  // Get user email
  String getUserEmail() {
    return _currentUser?.email ?? 'user@example.com';
  }

  // Get user photo URL
  String getUserPhotoUrl() {
    return _currentUser?.photoURL ?? '';
  }
}