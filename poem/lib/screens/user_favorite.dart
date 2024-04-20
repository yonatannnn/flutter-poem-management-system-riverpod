import 'package:flutter/material.dart';
import 'package:poem/screens/user_poem.dart';
import 'package:poem/widgets/user_poem_widget.dart';

class UserFavorites extends StatelessWidget {
  final List<UserPoems> favoritePoems;

  const UserFavorites({Key? key, required this.favoritePoems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Poems'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: favoritePoems.length,
          itemBuilder: (context, index) {
            final poem = favoritePoems[index];
            return PoemUser(
              poemIndex: '${index + 1}',
              poemTitle: poem.title,
              poemAuth: poem.author,
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
          separatorBuilder: (context, index) => const Divider(),
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
