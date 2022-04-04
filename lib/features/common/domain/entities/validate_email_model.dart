import 'package:equatable/equatable.dart';

class ValidateEmailModel extends Equatable {
  final bool isValid;

  const ValidateEmailModel({required this.isValid});

  @override
  List<Object?> get props => [isValid];
}
