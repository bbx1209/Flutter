import 'package:flutter/material.dart';

class FlexRoute extends StatefulWidget {
  const FlexRoute({Key? key}) : super(key: key);

  @override
  _FlexRouteState createState() => _FlexRouteState();
}

class _FlexRouteState extends State<FlexRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FlexRoute"),
        ),
        body: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Container(
                    height: 30,
                    color: Colors.blue,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    height: 30,
                    color: Colors.red,
                  ),
                  flex: 1,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 100,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.green,
                      ),
                      flex: 2,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(child: Container(color: Colors.red,),
                    flex: 1,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
