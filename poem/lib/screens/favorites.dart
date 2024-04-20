import 'package:flutter/material.dart';
import '../widgets/poem_widget.dart';
import 'poem_page.dart';
import '../widgets/poem_widget.dart';

class MyFavoritesScreen extends StatelessWidget {
  final List<Poem> favoritePoems;

  const MyFavoritesScreen({Key? key, required this.favoritePoems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Poems'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: favoritePoems.length,
          itemBuilder: (context, index) {
            final poem = favoritePoems[index];
            return Poems(
              poemTitle: poem.title,
              pubDate: poem.author,
              onPressedDelete: () {
                favoritePoems.remove(poem);
              },
              onPressedFavorite: () {
                favoritePoems.add(poem);
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
          separatorBuilder: (context, index) => Divider(),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Poems'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: 'My Favorite')
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pop(context); // Return to the previous screen
        }
      },
    );
  }
}
