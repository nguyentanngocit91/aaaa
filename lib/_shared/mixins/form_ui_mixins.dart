import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

mixin FormUIMixins{

  Widget lableTextForm(String title){
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
    );
  }

  Widget titleForm(BuildContext context,{required String title}){
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          FaIcon(FontAwesomeIcons.fileContract, color: Theme.of(context).primaryColor, size: 18,),
          const SizedBox(width: 10,),
          Text(title.toUpperCase(), style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16, fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }

  Widget bodyForm({required Widget child, Color? backgroundColor}){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: child,
    );
  }
}