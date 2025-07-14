import 'package:equatable/equatable.dart';

class AddToFavoriteEntity extends Equatable {
  final String message;

  const AddToFavoriteEntity({required this.message});

  @override
  List<Object?> get props => [message];
}
