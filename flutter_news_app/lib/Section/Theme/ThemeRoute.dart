import 'package:flutter/material.dart';

class ThemeRoute extends StatefulWidget {
  const ThemeRoute({Key? key}) : super(key: key);

  @override
  _ThemeRouteState createState() => _ThemeRouteState();
}

class _ThemeRouteState extends State<ThemeRoute> {
  Color _themeColor = Colors.teal;
  
  Color c1 = Color(int.parse("dc380d", radix: 16)|0xFF000000);
  Color c2 = Color(int.parse("ee22e0",radix: 16)).withAlpha(255);
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
        data: ThemeData(
            primaryColor: _themeColor,
            iconTheme: IconThemeData(color: _themeColor)),
        child: Scaffold(
          appBar: AppBar(
            title: Text("ThemeRoute"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("颜色跟做主题"),
                  ],
                ),

               Theme(
                 data: themeData.copyWith(
                   iconTheme: themeData.iconTheme.copyWith(
                      color: Colors.black
                   )
                 ),
                 child:  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(Icons.favorite),
                     Icon(Icons.airport_shuttle),
                     Text("颜色固定"),
                   ],
                 ),
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: c1,
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      width: 10,
                    ),
                    Container(
                      color: c2,
                      width: 50,
                      height: 50,
                    )
                  ],
                )
              ],
            ),
          ),
          floatingActionButton: TextButton(
            child: Text("改变主题"),
            onPressed: (){
              setState(() {
               _themeColor=  (_themeColor == Colors.teal ? Colors.blue : Colors.teal);
              });
            },
          ),
        ));
  }
}
