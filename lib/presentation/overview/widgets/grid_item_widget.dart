import 'package:flutter/material.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({super.key, required this.value});
  final String value;
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
        child: Center(child: Text(value)),
      ),
    );
  }
}
