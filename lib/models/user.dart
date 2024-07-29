import '../helpers/loading_widget.dart';

class User {
  final String token;

  User({
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    try {
      return User(
        token: json['token'],
      );
    } catch (e) {
      Lt.toast('model user block 001 : $e');
      throw Exception('Failed to parse User from JSON');
    }
  }

  Map<String, dynamic> toJson() {
    try {
      return {
        'token': token,
      };
    } catch (e) {
      Lt.toast('model user block 002 : $e');
      throw Exception('Failed to convert User to JSON');
    }
  }
}
