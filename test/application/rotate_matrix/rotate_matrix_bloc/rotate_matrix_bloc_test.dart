import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_delosi_app/application/rotate_matrix/rotate_matrix_actor_bloc/rotate_matrix_actor_bloc.dart';

void main() {
  group('RotateMatrixActorBloc', () {
    const inputStr = '[[1,2],[3,4]]';

    blocTest<RotateMatrixActorBloc, RotateMatrixActorState>(
      'emits [RotateMatrixActorUniqueState] when MatrixInputEvent is added.',
      build: () => RotateMatrixActorBloc(),
      act: (bloc) => bloc.add(MatrixInputEvent(inputStr)),
      expect: () => [
        RotateMatrixActorUniqueState(
            matrix: const [],
            canRotate: false,
            pastInput: inputStr,
            actualInput: inputStr)
      ],
    );
    blocTest<RotateMatrixActorBloc, RotateMatrixActorState>(
      'emits [RotateMatrixActorUniqueState] when CreateMatrixEvent is added.',
      build: () => RotateMatrixActorBloc(),
      act: (bloc) => bloc
        ..add(MatrixInputEvent(inputStr))
        ..add(CreateMatrixEvent()),
      skip: 1,
      expect: () => [
        RotateMatrixActorUniqueState(
          matrix: const [
            [1, 2],
            [3, 4]
          ],
          canRotate: true,
          pastInput: inputStr,
          actualInput: inputStr,
        )
      ],
    );
    blocTest<RotateMatrixActorBloc, RotateMatrixActorState>(
      'emits [RotateMatrixActorUniqueState] when RotateMatrixEvent is added.',
      build: () => RotateMatrixActorBloc(),
      act: (bloc) => bloc
        ..add(MatrixInputEvent(inputStr))
        ..add(CreateMatrixEvent())
        ..add(RotateMatrixEvent()),
      skip: 2,
      expect: () => [
        RotateMatrixActorUniqueState(
          matrix: const [
            [2, 4],
            [1, 3]
          ],
          canRotate: true,
          pastInput: inputStr,
          actualInput: '[[2,4],[1,3]]',
        )
      ],
    );
  });
}
