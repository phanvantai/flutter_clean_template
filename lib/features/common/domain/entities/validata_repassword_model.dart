import 'package:equatable/equatable.dart';

class ValidateRepasswordModel extends Equatable {
  final bool isMatch;

  const ValidateRepasswordModel({required this.isMatch});
  @override
  List<Object?> get props => [isMatch];
}
