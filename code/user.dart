class User {
  final String id;
  final String username;
  final String email;
  final String? profileImage;
  final DateTime createdAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.profileImage,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profileImage: json['profile_image'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'profile_image': profileImage,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
