# flutter_responsive_grid

A new Flutter package to create a responsive gridview list with a dynamic number of columns

## Screenshots

<img src="ss1.png" height="300em"/>   <img src="ss2.png" height="300em"/>

## Usage

[Example] https://github.com/abdallah-odeh/Responsive-GridView/tree/master/example/main.dart

### To use this package:

    1- Add this code to a new .dart file
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


    2- Import the file you just created and Simply invoke it inside your widget tree and pass the **children** as a list of widget, **number of columns** as an integer and the **size between each child** as a double [default is 8.0]
       Scaffold(
         appBar: AppBar(),
         body: SingleChildScrollView(
           child: ResponsiveGrid(
             children: children,
             columns: 3,
             sizeBetween: 8.0
           ),
         ),
       )