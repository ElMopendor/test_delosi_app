import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_delosi_app/application/rotate_matrix/rotate_matrix_actor_bloc/rotate_matrix_actor_bloc.dart';

class InputMatrixTextFormField extends StatelessWidget {
  const InputMatrixTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
        labelText: 'Introduce una matriz',
        hintText: 'ejem: [[1,2],[3,4]]',
      ),
      onChanged: (str) {
        context.read<RotateMatrixActorBloc>().add(MatrixInputEvent(str));
      },
      onFieldSubmitted: (str) {
        context.read<RotateMatrixActorBloc>().add(CreateMatrixEvent());
      },
    );
  }
}
