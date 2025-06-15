
class AccountModel {
  final String name;
  final String id;
  final String platform;
  final String username;
  final int followers;
  final int following;
  final int posts;
  final int friends;
  final int likes;
  final String whatsappId;
  final String profileImageUrl;
  final bool isVerified;
  final String location;
  final int age;
  final String email;
  final DateTime joinedDate;
  final DateTime lastSeen;
  final DateTime lastPost;

  AccountModel({
    required this.name,
    required this.id,
    required this.platform,
    required this.username,
    this.followers = 0,
    this.following = 0,
    this.posts = 0,
    this.friends = 0,
    this.likes = 0,
    this.whatsappId = '',
    required this.profileImageUrl,
    this.isVerified = false,
    this.location = '',
    this.age = 0,
    this.email = '',
    required this.joinedDate,
    required this.lastSeen,
    required this.lastPost,
  });
}
