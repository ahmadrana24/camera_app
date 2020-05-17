import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  ImageInput({Key key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No image found'),
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.camera),
          label: Text('Take Picture',textAlign: TextAlign.center,),
          textColor: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
