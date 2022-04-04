import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/validata_repassword_model.dart';
import '../entities/validate_email_model.dart';
import '../entities/validate_password_model.dart';

abstract class ValidationRepository {
  Future<Either<Failure, ValidateEmailModel>> checkValidateEmail(String email);
  Future<Either<Failure, ValidatePasswordModel>> checkValidatePassword(
      String password);
  Future<Either<Failure, ValidateRepasswordModel>> checkValidateRePassword(
      String password, String repassword);
}
