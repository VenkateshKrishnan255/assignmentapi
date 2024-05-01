class Items{

  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Items(int postId, int id, String name, String email, String body){
    this.postId = postId;
    this.id = id;
    this.name = name;
    this.email = email;
    this.body = body;
  }

  Items.fromJson(Map<String, dynamic> json){
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //final data = <String, dynamic>{};
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    return data;
  }
}