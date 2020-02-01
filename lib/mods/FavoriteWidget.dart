import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteWidgeState();
}

class _FavoriteWidgeState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (this._isFavorited) {
        this._favoriteCount -= 1;
        this._isFavorited = false;
      } else {
        this._favoriteCount += 1;
        this._isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: _isFavorited ? Icon(Icons.star) : Icon(Icons.star_border),
            color: Colors.red[500],
            onPressed: this._toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('${this._favoriteCount}'),
          ),
        )
      ],
    );
  }
}
