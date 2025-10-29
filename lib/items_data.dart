import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:logo_task/item_model.dart';

class ItemsData {
  static Future<List<ItemModel>> readDataFromJson() async {
    final jsonString = await rootBundle.loadString('trips_mock.json');
    final data = jsonDecode(jsonString);

    if (data is Map<String, dynamic> && data['trips'] is List) {
      return (data['trips'] as List)
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw Exception('Invalid JSON structure in trips_mock.json');
  }
}