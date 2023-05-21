class LangModel {
  String title;
  String code;

  LangModel({required this.title, required this.code});
}

final List<LangModel> languages = [
  LangModel(title: "English", code: "en"),
  LangModel(title: "Spanish", code: "es"),
];
