import 'package:flutter/material.dart';
class ShowOkAlertDialog {
  static void show(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }
}

class ConfirmDialog extends StatelessWidget {

  String title;
  String content;
  VoidCallback continueCallBack;

  ConfirmDialog(this.title, this.content, this.continueCallBack);
  TextStyle textStyle = TextStyle (color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: new Text(title,style: textStyle,),
      content: new Text(content, style: textStyle,),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text("Chấp nhận"),
          onPressed: () {
            continueCallBack();
          },
        ),
        new ElevatedButton(
          child: Text("Huỷ"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}


class TextDialog extends StatelessWidget {

  String title;
  String content;
  VoidCallback continueCallBack;
  Widget _widget;

  TextDialog(this.title, this.content,this._widget, this.continueCallBack);
  TextStyle textStyle = TextStyle (color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 5,left: 20,bottom: 15,right: 20),

      title: new Text(title.toUpperCase(),style: textStyle,),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          (content!=''?new Text(content, style: textStyle):Container()),
          _widget

        ],
      ),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text("Xác nhận"),
          onPressed: () {
            continueCallBack();
          },
        ),
        new ElevatedButton(
          child: Text("Huỷ"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}