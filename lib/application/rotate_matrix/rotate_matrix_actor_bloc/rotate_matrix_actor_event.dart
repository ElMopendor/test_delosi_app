part of 'rotate_matrix_actor_bloc.dart';

@immutable
sealed class RotateMatrixActorEvent {}

class MatrixInputEvent extends RotateMatrixActorEvent {
  final String inputStr;

  MatrixInputEvent(this.inputStr);
}

class CreateMatrixEvent extends RotateMatrixActorEvent {}

class RotateMatrixEvent extends RotateMatrixActorEvent {}
