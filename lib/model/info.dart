class infoModel {
  int? extendedIngredients;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? image;
  String? imageType;
  String? instructions;

  infoModel(
      {required this.extendedIngredients,
      required this.title,
      required this.readyInMinutes,
      required this.servings,
      required this.image,
      required this.imageType,
      required this.instructions});

  infoModel.fromJson(Map<String, dynamic> json) {
    extendedIngredients = json['extendedIngredients'].length;
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    image = json['image'];
    imageType = json['imageType'];
    instructions = json['instructions'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'extendedIngredients' : extendedIngredients,  // not correct , because it is the length
      'title' : title,
      'readyInMinutes' : readyInMinutes,
      'servings' : servings,
      'image' : image,
      'imageType' : imageType,
      'instructions' : instructions
    };
    return data;
  }
}