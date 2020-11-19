import 'package:flutter_gok_curso/model/tagsHistory.dart';

extension TagsHistoryExt on TagsHistory {

  static const historyMap = {
    TagsHistory.FOOD: "Comida",
    TagsHistory.COLD: "Frio",
    TagsHistory.HEALTH: "Saúde",
    TagsHistory.HOT: "Calor",
    TagsHistory.MONEY: "Dinheiro",
  };

  void console() {
    print("${this.index} ${this.about}");
  }

  String get about => historyMap[this];
}