import 'package:flutter/cupertino.dart';

class PageIndexProvider extends ChangeNotifier {
  int pageIndex = 0;
  int get getCurrentIndex {
    return pageIndex;
  }

  void updatePageIndex(int newIndex) {
    pageIndex = newIndex;
    notifyListeners();
  }
}