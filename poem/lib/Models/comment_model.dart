class Comment {
  final int id;
  final String comment;
  final int peomId;
  final int username;

  Comment({required this.id, required this.comment, required this.peomId, required this.username});
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      comment: json['comment'],
      peomId: json['peomId'],
      username: json['username'],
    );
  }
}