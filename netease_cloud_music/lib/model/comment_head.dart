/// 用于传给评论页面
class CommentHead{
  String img;
  String title;
  String author;
  int count;
  int id;

  CommentHead(this.img, this.title, this.author, this.count, this.id);



  CommentHead.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    title = json['title'];
    author = json['author'];
    count = json['count'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['title'] = this.title;
    data['author'] = this.author;
    data['count'] = this.count;
    data['id'] = this.id;
    return data;
  }
}