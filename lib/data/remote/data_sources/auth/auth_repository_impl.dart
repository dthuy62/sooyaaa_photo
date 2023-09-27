import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _auth = FirebaseAuth.instance;

  @override
  Future<Either<DataSourceError, void>> signInWithGoogle() async {
    final gUser = await GoogleSignIn().signIn();
    final gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
