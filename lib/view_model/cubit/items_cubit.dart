import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:logo_task/model/item_model.dart';

part 'items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit() : super(ItemsInitial());

  Future<void> loadData() async {
    try {
      emit(ItemsLoading());
      final jsonString = await rootBundle.loadString('assets/data/trips_mock.json');
      final data = jsonDecode(jsonString);

      if (data is Map<String, dynamic> && data['trips'] is List) {
        List<ItemModel> items = (data['trips'] as List).map((e) => ItemModel.fromJson(e as Map<String, dynamic>)).toList();
        emit(ItemsLoaded(items: items));
      } else {
        emit(ItemsError(message: 'Faild to load data'));
      }
    } catch (e) {
      emit(ItemsError(message: 'Faild to load data $e'));
    }
  }
}