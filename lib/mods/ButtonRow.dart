import 'package:flutter/material.dart';

class ButtonRowData {
  IconData icon;
  String label;

  ButtonRowData({ this.icon, this.label });
}

class ButtonRow extends StatelessWidget {
  final Color color;
  final List<ButtonRowData> dataSource;

  ButtonRow({ this.color, this.dataSource });

  @override
  Widget build(BuildContext context) {
    Color renderColor = this.color ?? Theme.of(context).primaryColor;

    return (
      Container(
        margin: EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: this.dataSource.map((item) {
            return ButtonCell(color: renderColor, icon: item.icon, label: item.label);
          }).toList(),
        ),
      )
    );
  }
}

class ButtonCell extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  ButtonCell({ this.icon, this.color, this.label });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(this.icon, color: this.color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            this.label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: this.color
            )
          ),
        )
      ],
    );
  }
}
