class Song {
  int id; // 歌曲id
  String name; // 歌曲名称
  String artists; // 演唱者
  String picUrl; // 歌曲图片

  Song(this.id, {this.name, this.artists, this.picUrl});

  Song.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        artists = json['artists'],
        picUrl = json['picUrl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'artists': artists,
        'picUrl': picUrl,
      };

  @override
  String toString() {
    return 'Song{id: $id, name: $name, artists: $artists}';
  }
}
