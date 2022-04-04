import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/validate_email_model.dart';
import '../repositories/validation_repository.dart';

class ValidateEmail
    implements UseCase<ValidateEmailModel, ValidateEmailParams> {
  final ValidationRepository validationRepository;
  const ValidateEmail({required this.validationRepository});
  @override
  Future<Either<Failure, ValidateEmailModel>> call(ValidateEmailParams params) {
    return validationRepository.checkValidateEmail(params.email);
  }
}

class ValidateEmailParams extends Equatable {
  final String email;
  const ValidateEmailParams({required this.email});
  @override
  List<Object?> get props => [email];
}
