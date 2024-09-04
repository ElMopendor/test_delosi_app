import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_delosi_app/application/rotate_matrix/rotate_matrix_actor_bloc/rotate_matrix_actor_bloc.dart';
import 'package:test_delosi_app/presentation/overview/widgets/action_elevated_button.dart';
import 'package:test_delosi_app/presentation/overview/widgets/input_matrix_text_form_field.dart';
import 'package:test_delosi_app/presentation/overview/widgets/matrix_grid_view.dart';

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
      child: const Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //titulo
                  Text('Rotar matriz DELOSI'),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      //input text
                      Expanded(child: InputMatrixTextFormField()),
                      SizedBox(width: 5),
                      //boton
                      ActionElevatedButton(),
                    ],
                  ),
                  SizedBox(height: 20),
                  //matrix construida
                  GridViewMatrixWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
