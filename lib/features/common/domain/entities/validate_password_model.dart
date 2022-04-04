import 'package:equatable/equatable.dart';

class ValidatePasswordModel extends Equatable {
  final bool isValidLength;
  final bool isValidRegex;

  const ValidatePasswordModel(
      {required this.isValidLength, required this.isValidRegex});
  @override
  List<Object?> get props => [isValidLength, isValidRegex];
}
