import '../../common/either.dart';
import '../../common/error.dart';

abstract interface class AuthRepository {
  Future<Either<DataSourceError, void>> signInWithGoogle();
}
