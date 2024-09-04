part of 'rotate_matrix_actor_bloc.dart';

@immutable
sealed class RotateMatrixActorState extends Equatable {}

final class RotateMatrixActorUniqueState extends RotateMatrixActorState {
  final List<List<int>> matrix;
  final bool canRotate;
  final String pastInput;
  final String actualInput;

  RotateMatrixActorUniqueState({
    required this.matrix,
    required this.canRotate,
    required this.pastInput,
    required this.actualInput,
  });

  factory RotateMatrixActorUniqueState.initial() =>
      RotateMatrixActorUniqueState(
        matrix: const [],
        canRotate: false,
        pastInput: '',
        actualInput: '',
      );

  @override
  List<Object?> get props => [matrix, canRotate, pastInput, actualInput];

  RotateMatrixActorUniqueState copyWith(
    List<List<int>>? matrix,
    bool? canRotate,
    String? pastInput,
    String? actualInput,
  ) =>
      RotateMatrixActorUniqueState(
        matrix: matrix ?? this.matrix,
        canRotate: canRotate ?? this.canRotate,
        pastInput: pastInput ?? this.pastInput,
        actualInput: actualInput ?? this.actualInput,
      );
}
