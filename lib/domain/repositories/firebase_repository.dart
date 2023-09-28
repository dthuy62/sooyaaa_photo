import '../../common/either.dart';
import '../../common/error.dart';
import '../../models/domain/user.dart';

abstract interface class FirebaseRepository {
  Future<Either<DataSourceError, User?>> signInWithGoogle();
}
