import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/validata_repassword_model.dart';
import '../../domain/entities/validate_email_model.dart';
import '../../domain/entities/validate_password_model.dart';
import '../../domain/repositories/validation_repository.dart';

class ValidationRepositoryImpl implements ValidationRepository {
  @override
  Future<Either<Failure, ValidateEmailModel>> checkValidateEmail(
      String email) async {
    return Right(
      ValidateEmailModel(
        isValid: RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email),
      ),
    );
  }

  @override
  Future<Either<Failure, ValidatePasswordModel>> checkValidatePassword(
      String password) async {
    bool isValidLength = password.length >= 6;
    return Right(
      ValidatePasswordModel(
        isValidLength: isValidLength,
        isValidRegex: true,
      ),
    );
  }

  @override
  Future<Either<Failure, ValidateRepasswordModel>> checkValidateRePassword(
      String password, String repassword) async {
    return Right(ValidateRepasswordModel(isMatch: password == repassword));
  }
}
