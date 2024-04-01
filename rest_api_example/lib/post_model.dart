class PostModel {
  List<GetPost>? getPost;

  PostModel({this.getPost});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json['getPost'] != null) {
      getPost = <GetPost>[];
      json['getPost'].forEach((v) {
        getPost!.add(GetPost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getPost != null) {
      data['getPost'] = getPost!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetPost {
  String? sId;
  String? name;
  String? description;
  int? stock;
  String? date;
  int? iV;

  GetPost(
      {this.sId, this.name, this.description, this.stock, this.date, this.iV});

  GetPost.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    stock = json['stock'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['stock'] = stock;
    data['date'] = date;
    data['__v'] = iV;
    return data;
  }
}
