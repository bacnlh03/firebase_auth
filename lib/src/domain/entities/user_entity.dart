import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String username;
  final String password;

  const UserEntity({
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        username,
        password,
      ];
}
