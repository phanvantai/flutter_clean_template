import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/validata_repassword_model.dart';
import '../repositories/validation_repository.dart';

class ValidateRepassword
    implements UseCase<ValidateRepasswordModel, ValidateRePasswordParams> {
  final ValidationRepository validationRepository;

  const ValidateRepassword({required this.validationRepository});
  @override
  Future<Either<Failure, ValidateRepasswordModel>> call(
      ValidateRePasswordParams params) {
    return validationRepository.checkValidateRePassword(
        params.password, params.repassword);
  }
}

class ValidateRePasswordParams extends Equatable {
  final String password;
  final String repassword;

  const ValidateRePasswordParams(
      {required this.password, required this.repassword});
  @override
  List<Object?> get props => [password, repassword];
}
