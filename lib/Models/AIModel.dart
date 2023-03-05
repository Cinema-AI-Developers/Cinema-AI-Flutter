class AIModel {
  final String id;
  final int created;
  final String root;

  AIModel({
    required this.id,
    required this.root,
    required this.created,
  });

  factory AIModel.fromJson(Map<String, dynamic> json) => AIModel(
        id: json["id"],
        root: json["root"],
        created: json["created"],
      );

  static List<AIModel> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) => AIModel.fromJson(data)).toList();
  }
}
