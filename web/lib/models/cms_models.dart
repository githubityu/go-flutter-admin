class ArticleModel {
  ArticleModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.idChannel,
    required this.title,
    required this.content,
    required this.author,
    required this.img,
  });

  factory ArticleModel.fromJson(Map json) {
    return ArticleModel(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      idChannel: json['id_channel'],
      title: json['title'],
      content: json['content'],
      author: json['author'],
      img: json['img'],
    );
  }

  final int id;
  final String createdAt;
  final String updatedAt;
  final int idChannel;
  final String title;
  final String content;
  final String author;
  final String img;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'id_channel': idChannel,
      'title': title,
      'content': content,
      'author': author,
      'img': img,
    };
  }

  ArticleModel copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    int? idChannel,
    String? title,
    String? content,
    String? author,
    String? img,
  }) {
    return ArticleModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      idChannel: idChannel ?? this.idChannel,
      title: title ?? this.title,
      content: content ?? this.content,
      author: author ?? this.author,
      img: img ?? this.img,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ArticleModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              createdAt == other.createdAt &&
              updatedAt == other.updatedAt &&
              idChannel == other.idChannel &&
              title == other.title &&
              content == other.content &&
              author == other.author &&
              img == other.img;

  @override
  int get hashCode => Object.hashAll([
    id,
    createdAt,
    updatedAt,
    idChannel,
    title,
    content,
    author,
    img,
  ]);
}


class ChannelModel {
  ChannelModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.code,
    required this.name,
  });

  factory ChannelModel.fromJson(Map json) {
    return ChannelModel(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      code: json['code'],
      name: json['name'],
    );
  }

  final int id;
  final String createdAt;
  final String updatedAt;
  final String code;
  final String name;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'code': code,
      'name': name,
    };
  }

  ChannelModel copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? code,
    String? name,
  }) {
    return ChannelModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ChannelModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              createdAt == other.createdAt &&
              updatedAt == other.updatedAt &&
              code == other.code &&
              name == other.name;

  @override
  int get hashCode => Object.hashAll([
    id,
    createdAt,
    updatedAt,
    code,
    name,
  ]);
}

