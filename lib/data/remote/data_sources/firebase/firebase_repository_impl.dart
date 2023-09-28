import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../domain/repositories/firebase_repository.dart';
import '../../../../models/domain/user.dart';
import 'firebase_data_source.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseDataSource firebaseDataSource;

  const FirebaseRepositoryImpl(this.firebaseDataSource);

  @override
  Future<Either<DataSourceError, User?>> signInWithGoogle() async =>
      (await firebaseDataSource.signInWithGoogle())
          .map((value) => User.fromDTO(value));
}
