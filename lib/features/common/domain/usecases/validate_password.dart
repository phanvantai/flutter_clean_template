import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/validate_password_model.dart';
import '../repositories/validation_repository.dart';

class ValidatePassword
    implements UseCase<ValidatePasswordModel, ValidatePasswordParams> {
  final ValidationRepository validationRepository;

  const ValidatePassword({required this.validationRepository});
  @override
  Future<Either<Failure, ValidatePasswordModel>> call(
      ValidatePasswordParams params) {
    return validationRepository.checkValidatePassword(params.password);
  }
}

class ValidatePasswordParams extends Equatable {
  final String password;

  const ValidatePasswordParams({required this.password});
  @override
  List<Object?> get props => [password];
}
