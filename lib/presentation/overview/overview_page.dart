import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_delosi_app/application/rotate_matrix/rotate_matrix_actor_bloc/rotate_matrix_actor_bloc.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RotateMatrixActorBloc, RotateMatrixActorState>(
      listenWhen: (p, c) => (c as RotateMatrixActorUniqueState).canRotate,
      listener: (context, state) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                """La matriz anterior es: ${(state as RotateMatrixActorUniqueState).pastInput} """),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Rotar matriz DELOSI'),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1.0),
                            ),
                            labelText: 'Introduce una matriz',
                            hintText: 'ejem: [[1,2],[3,4]]',
                          ),
                          onChanged: (str) {
                            context
                                .read<RotateMatrixActorBloc>()
                                .add(MatrixInputEvent(str));
                          },
                          onFieldSubmitted: (str) {
                            context
                                .read<RotateMatrixActorBloc>()
                                .add(CreateMatrixEvent());
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      BlocBuilder<RotateMatrixActorBloc,
                          RotateMatrixActorState>(
                        builder: (context, state) {
                          final canRotate =
                              (state as RotateMatrixActorUniqueState).canRotate;

                          return ElevatedButton(
                            onPressed: () {
                              if (canRotate) {
                                context
                                    .read<RotateMatrixActorBloc>()
                                    .add(RotateMatrixEvent());
                              } else {
                                context
                                    .read<RotateMatrixActorBloc>()
                                    .add(CreateMatrixEvent());
                              }
                              FocusScope.of(context).unfocus();
                            },
                            child: Text(canRotate ? ' Rotar ' : 'Ingresar'),
                          );
                        },
                      )
                    ],
                  ),

                  const SizedBox(height: 20),
                  BlocBuilder<RotateMatrixActorBloc, RotateMatrixActorState>(
                    builder: (context, state) {
                      final matrix =
                          (state as RotateMatrixActorUniqueState).matrix;
                      if (matrix.isEmpty) return const SizedBox();
                      return AspectRatio(
                        aspectRatio: 1.0,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.0)),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: matrix.length,
                            ),
                            itemBuilder: (context, index) {
                              int n = matrix.length;
                              int x, y = 0;
                              x = (index / n).floor();
                              y = (index % n);
                              return GridTile(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 0.5)),
                                  child: Center(
                                      child: Text(matrix[x][y].toString())),
                                ),
                              );
                            },
                            itemCount: matrix.length * matrix.length,
                          ),
                        ),
                      );
                    },
                  ),

                  //Mostrar la matriz
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
