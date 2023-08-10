import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../_shared/app_config/app.dart';

 class PTButtonDownload extends StatefulWidget {
   const PTButtonDownload({Key? key,required this.urlPath, required this.fileName,required this.title,this.width=200, required this.icon,this.color=Colors.white}) : super(key: key);
   final String urlPath;
   final String fileName;
   final String title;
   final Icon icon;
   final Color color;
   final double width;

   @override
   State<PTButtonDownload> createState() => _PTButtonDownloadState();
 }
 class _PTButtonDownloadState extends State<PTButtonDownload> {

   /// checking to show CircularProgressIndicator
   bool downloading = false;
   /// Display the downloaded percentage value
   String progressString = '';
   Future<void> _downloadFile(BuildContext context) async {
     String? result = await FilePicker.platform.getDirectoryPath();
     if (result != null) {
       Directory selectedDirectory = Directory(result);
       String fileName = widget.fileName;
       var downloadedPath = '${selectedDirectory.path}/$fileName';
       try {
         await App.dioClient.download(
             widget.urlPath,
             downloadedPath,
             onReceiveProgress: (rec, total) {
               setState(() {
                 downloading = true;
                 progressString = "...";
               });
             }
         );
         // Delay to show that the download is complete
         await Future.delayed(const Duration(seconds: 3));
         _noDiplayLoadding();
       } catch (e) {
         print(e);
       }
     }
   }
   void _noDiplayLoadding() {
     setState(() {
       downloading = false;
       progressString = "COMPLETED";
     });
   }

   @override
   Widget build(BuildContext context) {
     return SizedBox(
       width: widget.width,
       child: (downloading)?ElevatedButton(
         style: TextButton.styleFrom(
             padding: const EdgeInsets.all(10),
             backgroundColor:const Color(0xff0783A2)
         ),
         onPressed: () {},
         child: Row(
           mainAxisAlignment:MainAxisAlignment.center,
           children: [
             Text('Đang tải$progressString',style: TextStyle(color: widget.color),),
           ],
         )):ElevatedButton(
         style: TextButton.styleFrom(
             padding: const EdgeInsets.all(10),
             backgroundColor:const Color(0xff0783A2)
         ),
         onPressed: () =>_downloadFile(context),
         child: Row(
           mainAxisAlignment:MainAxisAlignment.center,
           children: [
             widget.icon,
             const SizedBox(width: 5,),
             Text(widget.title,style: TextStyle(color: widget.color),),
           ],
         ))
     );
   }
 }

