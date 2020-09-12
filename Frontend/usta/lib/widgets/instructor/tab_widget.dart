import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final String tabName;
  final IconData tabIcon;
  final String summery;

  const TabWidget({Key key, this.tabName, this.tabIcon, this.summery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Icon(tabIcon,color: Color(0xFFDDB644)),
                Text(tabName,style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 10.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),),
                Text(summery),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
