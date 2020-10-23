library flutter_responsive_grid;
import 'package:flutter/material.dart';

class ResponsiveGrid extends StatelessWidget {
  final int columns;
  final List<Widget> children;
  final double sizeBetween;

  const ResponsiveGrid(
      {Key key,
        @required this.children,
        this.columns = 2,
        this.sizeBetween = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final space = sizeBetween / 2;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: space),
        for (int i = 0; i < columns; i++)
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: space),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int j = i; j < children.length; j += columns)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: space),
                      child: children[j],
                    ),
                ],
              ),
            ),
          ),
        SizedBox(width: space),
      ],
    );
  }
}
