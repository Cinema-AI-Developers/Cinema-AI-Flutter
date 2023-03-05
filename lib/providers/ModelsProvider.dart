import 'package:cinema_ai/Models/AIModel.dart';
import 'package:cinema_ai/api/AIResponse.dart';
import 'package:flutter/cupertino.dart';

class ModelsProvider with ChangeNotifier {
  //maybe well needed in film descriptions
  String currentModel = "text-davinci-003";
  //String currentModel = "gpt-3.5-turbo-0301";

  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  List<AIModel> modelsList = [];

  List<AIModel> get getModelsList {
    return modelsList;
  }

  Future<List<AIModel>> getAllModels() async {
    modelsList = await AIModelResponse.getModel();
    return modelsList;
  }
}
