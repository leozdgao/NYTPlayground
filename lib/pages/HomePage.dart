import 'package:NYTPlayground/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../mods/TitleRow.dart' show TitleRow;
import '../mods/ButtonRow.dart' show ButtonRow, ButtonRowData;
import '../constants.dart';

List<ButtonRowData> buttonRowDataSource = [
  ButtonRowData(label: 'CALL', icon: Icons.call),
  ButtonRowData(label: 'ROUTE', icon: Icons.near_me),
  ButtonRowData(label: 'SHARE', icon: Icons.share),
];

class HomePage extends StatelessWidget {
  GestureTapCallback handleClick(BuildContext context) {
    return () async {
      String loginUrl = Uri(scheme: 'https', host: 'github.com', path: '/login/oauth/authorize', queryParameters: {
        'client_id': GITHUB_CLIENT_ID
      }).toString();
      String authToken = await Navigator.push(
        context, 
        MaterialPageRoute<String>(builder: (context) => LoginPage(url: loginUrl))
      );
      print('get token $authToken');
    };
  }

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        appBar: AppBar(
          title: Text('Flutter Layout Demo'),
        ),
        body: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: this.handleClick(context),
              child: Image.asset(
                'images/lake.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            TitleRow(
              title: 'Oeschinen Lake Campground',
              subTitle: 'Kandersteg, Switzerland',
              number: 41,
            ),
            ButtonRow(dataSource: buttonRowDataSource),
            Container(
              padding: const EdgeInsets.all(28),
              child: Text(
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                  'Alps. Situated 1,578 meters above sea level, it is one of the '
                  'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                  'half-hour walk through pastures and pine forest, leads you to the '
                  'lake, which warms to 20 degrees Celsius in the summer. Activities '
                  'enjoyed here include rowing, and riding the summer toboggan run.',
                softWrap: true,
              ),
            )
          ],
        ),
      )
    );
  }
}
