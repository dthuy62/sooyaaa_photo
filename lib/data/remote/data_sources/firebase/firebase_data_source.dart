import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/dtos/user_dto.dart';

abstract class FirebaseDataSource {
  Future<Either<DataSourceError, UserJson>> signInWithGoogle();
}
