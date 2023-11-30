class recipeModel {
  List<Results>? results;
  int? offset;
  int? number;
  int? totalResults;

  recipeModel({required this.results, required this.offset, required this.number, required this.totalResults});

  recipeModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      this.results = <Results>[];
      json['results'].forEach((element) {
        this.results!.add(Results.fromJson(element));
      });
    }
    this.offset = json['offset'];
    this.number = json['number'];
    this.totalResults = json['totalResults'];
  }

  Map<String, dynamic> toJson() {
    List<Map> l2 = [];
    this.results!.forEach((element) { 
      l2.add(element.toJson());
    });
    Map<String,dynamic> data = {
      'results' : l2,
      'offset' : offset,
      'number' : number,
      'totalResults' : totalResults
    };
    return data;
  }
}



class Results {
  int? id;
  String? title;
  String? image;
  String? imageType;

  Results({required this.id, required this.title, required this.image, required this.imageType});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'id' : id,
      'title' : title,
      'image' : image,
      'imageType' : imageType
    };
    
    return data;
  }
}