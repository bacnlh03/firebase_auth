import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uid;
  final String? email;
  final String? username;
  final String? password;

  const UserEntity({
    this.uid,
    this.email,
    this.username,
    this.password,
  });

  @override
  List<Object?> get props => [
        uid,
        email,
        username,
        password,
      ];
}
