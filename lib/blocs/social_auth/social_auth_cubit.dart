import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/firebase_repository.dart';
import '../../models/domain/user.dart';

class SocialAuthCubit extends Cubit<User?> {
  SocialAuthCubit(this._firebaseRepository) : super(null);

  final FirebaseRepository _firebaseRepository;

  Future<void> signInWithGoogle() async {
    (await _firebaseRepository.signInWithGoogle()).fold(
        ifLeft: (error) {},
        ifRight: (user) {
          emit(user);
        });
  }
}
