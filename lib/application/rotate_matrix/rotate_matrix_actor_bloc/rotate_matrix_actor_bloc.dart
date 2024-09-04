import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'rotate_matrix_actor_event.dart';
part 'rotate_matrix_actor_state.dart';

class RotateMatrixActorBloc
    extends Bloc<RotateMatrixActorEvent, RotateMatrixActorState> {
  RotateMatrixActorBloc() : super(RotateMatrixActorUniqueState.initial()) {
    on<MatrixInputEvent>(_matrixInputEvent);
    on<CreateMatrixEvent>(_createMatrixEvent);
    on<RotateMatrixEvent>(_rotateMatrixEvent);
  }

  void _matrixInputEvent(
      MatrixInputEvent event, Emitter<RotateMatrixActorState> emit) {
    // guardar el input ingresado en el estado
    emit(
      (state as RotateMatrixActorUniqueState).copyWith(
        null,
        false,
        event.inputStr,
        event.inputStr,
      ),
    );
  }

  void _createMatrixEvent(
      CreateMatrixEvent event, Emitter<RotateMatrixActorState> emit) {
    //
    // recuperamos el input del estado previamente guardado
    final inputStr = (state as RotateMatrixActorUniqueState).actualInput;

    // remover los brackets de los costados del input
    String firstStr = inputStr.substring(1, inputStr.length - 1).trim();

    // RegExp para extraer el contenido de los brackets de dentro
    RegExp regExp = RegExp(r'\[([^\]]*)\]');

    // Encontrar encontrar todas las filas
    Iterable<Match> rows = regExp.allMatches(firstStr);

    // Añadir las filas a la matriz
    List<List<int>> matrix = rows.map((match) {
      // Extraer los matches y separarlos por comas
      String innerArrayString = match.group(1) ?? '';
      List<int> row = innerArrayString.split(',').map(int.parse).toList();
      return row;
    }).toList();

    //mostrar el estado
    emit(
      (state as RotateMatrixActorUniqueState).copyWith(
        matrix,
        true,
        inputStr,
        inputStr,
      ),
    );
  }

  void _rotateMatrixEvent(
      RotateMatrixEvent event, Emitter<RotateMatrixActorState> emit) {
    //Dado que este ejercicio está realizado en el happy path no tomaremos en cuenta matrices que no sean cuadradas

    //obtenemos el estado inicial
    final initialState = (state as RotateMatrixActorUniqueState);

    //verificamos si la matriz está construida
    if (!initialState.canRotate) return;

    final matrixToRotate = initialState.matrix;
    final length = matrixToRotate.length;
    // inicializamos la nueva matriz resultante
    List<List<int>> rotatedMatrix =
        List.generate(length, (i) => List.filled(length, 0));

    // Completamos la matrix con los valores rotados

    for (int i = 0; i < length; i++) {
      for (int j = 0; j < length; j++) {
        rotatedMatrix[length - j - 1][i] = matrixToRotate[i][j];
      }
    }

    // creamos el nuevo texto a mostrar en el snack
    String actualInput = "[";
    for (int i = 0; i < length; i++) {
      actualInput += "[";
      for (int j = 0; j < length; j++) {
        actualInput += "${rotatedMatrix[i][j].toString()},";
      }
      actualInput = actualInput.substring(0, actualInput.length - 1);
      actualInput += "],";
    }
    actualInput = actualInput.substring(0, actualInput.length - 1);
    actualInput += "]";

    //actualizamos el estado
    emit(initialState.copyWith(
        rotatedMatrix, true, initialState.actualInput, actualInput));
  }
}
