import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/poem_widget.dart';
import '../widgets/profile_widget.dart';

class PoemListScreen extends StatefulWidget {
  final List<Poem> poems;
  final Function(int) onDelete;
  final Function(int) onFavorite;
  final List<Poem> favoritePoems;

  const PoemListScreen({
    super.key,
    required this.poems,
    required this.onDelete,
    required this.onFavorite,
    required this.favoritePoems,
  });
  @override
  State<StatefulWidget> createState() {
    return _PoemListScreenState();
  }
}

class _PoemListScreenState extends State<PoemListScreen> {
  bool isFavorite(Poem poem) {
    return widget.favoritePoems.contains(poem);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Profile(),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: widget.poems.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final poem = widget.poems[index];
                return Poems(
                  poemTitle: '${index + 1}',
                  pubDate: poem.author,
                  onPressedDelete: () {
                    widget.onDelete(index);
                  },
                  onPressedFavorite: () {
                    widget.onFavorite(index);
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoemDetailScreen(
                          poem: poem,
                          filteredPoems: [],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Poem {
  final String title;
  final String author;
  final String genre;
  final String content;

  Poem(
      {required this.title,
      required this.author,
      required this.content,
      required this.genre});
}

class PoemDetailScreen extends StatelessWidget {
  final Poem poem;
  final List filteredPoems;

  const PoemDetailScreen(
      {Key? key, required this.poem, required this.filteredPoems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Read Poem',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                        child: Text(
                          poem.author,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                        child: Text(
                          poem.content,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        'Comments',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      CommentWidget(
                          author: 'User1', comment: 'Beautiful poem!'),
                      CommentWidget(author: 'User2', comment: 'I love it!'),
                      CommentWidget(author: 'User3', comment: 'Amazing!'),
                      AddComment(comment: 'comment', author: 'author')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  final String author;
  final String comment;

  const CommentWidget({Key? key, required this.author, required this.comment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              Text(comment, style: TextStyle(fontSize: 15)),
            ],
          )
        ],
      ),
    );
  }
}

class AddComment extends StatefulWidget {
  final String comment;
  final String author;

  const AddComment({Key? key, required this.comment, required this.author})
      : super(key: key);

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          TextField(
            controller: _commentController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              fillColor: Colors.white,
              labelText: 'Your Comment',
              border: OutlineInputBorder(),
            ),
          ),
          Text(
            'Comment by ${widget.author}',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              final newComment = _commentController.text;
              if (newComment.isNotEmpty) {
                print('New Comment: $newComment');
              }
              _commentController.clear();
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
