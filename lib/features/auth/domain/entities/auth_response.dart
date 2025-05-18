import 'user.dart';

class AuthResponse {
  final User user;
  final String token;

  AuthResponse({
    required this.user,
    required this.token,
  });
  
  AuthResponse copyWith({
    User? user,
    String? token,
  }) {
    return AuthResponse(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}
