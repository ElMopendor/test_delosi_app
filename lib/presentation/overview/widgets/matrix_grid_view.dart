import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_delosi_app/application/rotate_matrix/rotate_matrix_actor_bloc/rotate_matrix_actor_bloc.dart';
import 'package:test_delosi_app/presentation/overview/widgets/grid_item_widget.dart';

class GridViewMatrixWidget extends StatelessWidget {
  const GridViewMatrixWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RotateMatrixActorBloc, RotateMatrixActorState>(
      builder: (context, state) {
        final matrix = (state as RotateMatrixActorUniqueState).matrix;
        if (matrix.isEmpty) return const SizedBox();
        return AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0)),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: matrix.length,
              ),
              itemBuilder: (context, index) {
                int n = matrix.length;
                int x, y = 0;
                x = (index / n).floor();
                y = (index % n);
                return GridItemWidget(value: matrix[x][y].toString());
              },
              itemCount: matrix.length * matrix.length,
            ),
          ),
        );
      },
    );
  }
}
