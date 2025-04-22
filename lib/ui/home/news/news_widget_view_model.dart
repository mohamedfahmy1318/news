import 'package:flutter/material.dart';
import 'package:news_App/api/api_manager.dart';
import 'package:news_App/model/NewsResponse.dart';

class NewsWidgetViewModel extends ChangeNotifier {
  //todo: hold data - handle logic
  List<News>? newsList;

  String? errorMessage;

  void getNewsBySourceId(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        errorMessage = response!.message!;
      } else {
        newsList = response!.articles!;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
