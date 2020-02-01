import 'package:flutter/material.dart';
import './FavoriteWidget.dart' show FavoriteWidget;

class TitleRow extends StatelessWidget {
  final int number;
  final String title;
  final String subTitle;

  TitleRow({ this.number, this.title, this.subTitle });

  @override
  Widget build(BuildContext context) {
    return (
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      this.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    this.subTitle,
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            FavoriteWidget()
          ],
        ),
      )
    );
  }
}
