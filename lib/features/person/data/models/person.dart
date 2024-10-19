class UserProfile {
  final String email;
  final String coverImageUrl;
  final String profileImageUrl;

  UserProfile({
    required this.email,
    required this.coverImageUrl,
    required this.profileImageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'coverImageUrl': coverImageUrl,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      email: map['email'],
      coverImageUrl: map['coverImageUrl'],
      profileImageUrl: map['profileImageUrl'],
    );
  }
}
