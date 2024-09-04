import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_delosi_app/application/rotate_matrix/rotate_matrix_actor_bloc/rotate_matrix_actor_bloc.dart';

class ActionElevatedButton extends StatelessWidget {
  const ActionElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RotateMatrixActorBloc, RotateMatrixActorState>(
      builder: (context, state) {
        final canRotate = (state as RotateMatrixActorUniqueState).canRotate;

        return ElevatedButton(
          onPressed: () {
            if (canRotate) {
              context.read<RotateMatrixActorBloc>().add(RotateMatrixEvent());
            } else {
              context.read<RotateMatrixActorBloc>().add(CreateMatrixEvent());
            }
            FocusScope.of(context).unfocus();
          },
          child: Text(canRotate ? ' Rotar ' : 'Ingresar'),
        );
      },
    );
  }
}
