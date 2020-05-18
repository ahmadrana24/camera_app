import 'package:camera_app/helpers/db_helper.dart';

import '../models/place.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class GreaatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: pickedImage,
        location: null,
        title: pickedTitle);

    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((item) => Place(
            id: item['id'],
            image: File(item['image']),
            location: null,
            title: item['title']))
        .toList();
    notifyListeners(); 
  }
}
