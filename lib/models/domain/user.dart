import 'package:equatable/equatable.dart';

import '../dtos/user_dto.dart';

class User extends Equatable {
  final String id, displayName, email, photoUrl;

  const User(
    this.id,
    this.displayName,
    this.email,
    this.photoUrl,
  );

  @override
  List<Object?> get props => [
        id,
        displayName,
        email,
        photoUrl,
      ];

  factory User.fromDTO(UserJson dto) => User(
        dto.id,
        dto.displayName,
        dto.email,
        dto.photoUrl,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        json['id'] as String,
        json['displayName'] as String,
        json['email'] as String,
        json['photoUrl'] as String,
      );
}
