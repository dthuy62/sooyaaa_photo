import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../di/service_locator.dart';
import '../../../../models/dtos/user_dto.dart';
import '../../data_sources/firebase/firebase_data_source.dart';
import '../api.dart';

class FirebaseAuthApi extends Api implements FirebaseDataSource {
  FirebaseAuthApi(
    super.dio,
  );
  final _auth = ServiceLocator.instance.inject<FirebaseAuth>();

  @override
  Future<Either<DataSourceError, UserJson>> signInWithGoogle() =>
      withTimeoutRequest(() async {
        final googleUser = await GoogleSignIn().signIn();
        late final UserCredential userCredential;
        if (googleUser == null) {
          log('Google Sign-In cancelled by user.');
        } else {
          final googleAuth = await googleUser.authentication;
          final credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          );
          userCredential = await _auth.signInWithCredential(credential);
        }
        return UserJson(
          id: userCredential.user?.uid ?? '',
          displayName: userCredential.user?.displayName ?? '',
          email: userCredential.user?.email ?? '',
          photoUrl: userCredential.user?.photoURL ?? '',
        );
      });
}
