class Poem {
  String title;
  String author;
  String content;

  Poem({required this.title, required this.author, required this.content});

  factory Poem.fromJson(Map<String, dynamic> json) {
    return Poem(
      title: json['title'],
      author: json['author'],
      content: json['content'],
    );
  }
}
