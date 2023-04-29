import 'package:flutter/material.dart';

class MySliverGridView extends StatelessWidget {
  const MySliverGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var color = Colors.primaries[index % Colors.primaries.length];
          return Card(
            color: color,
          );
        },
        childCount: 15,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
