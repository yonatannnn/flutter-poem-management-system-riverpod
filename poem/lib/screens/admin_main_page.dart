import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poem/screens/welcome_page.dart';

import 'about.dart';
import 'add_poem.dart';
import 'contacts.dart';
import 'favorites.dart';
import 'poet_poem.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poem Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              centerTitle: true,
              shadowColor: Colors.black,
              toolbarHeight: 70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
          primarySwatch: Colors.yellow,
          useMaterial3: true,
          fontFamily: 'Georgia',
          scaffoldBackgroundColor: Colors.grey[200]),
      home: const MyHomePage(),
      routes: {
        '/about': (context) => const About(),
        '/contact': (context) => const Contact(),
        '/welcome': (context) => const Welcome(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  File? pickedImage;
  String email = 'adeyeshi@gmail.com';
  late final Function(int) onDelete;
  late final Function(int) onFavorite;
  final ImagePicker imagePicker = ImagePicker();
  List<Poem> poems = [
    Poem(
        title: 'Poem 1',
        author: 'Author 1',
        genre: 'narrative',
        content: 'Content 1'),
    Poem(
        title: 'Poem 2',
        author: 'Author 2',
        genre: 'lyric',
        content: 'Content 2'),
    Poem(
        title: 'Poem 3',
        author: 'Author 3',
        genre: 'dramatic',
        content: 'Content 3'),
  ];
  List<Poem> favoritePoems = [];

  Future _getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void deletePoem(int index) {
    setState(() {
      poems.removeAt(index);
    });
  }

  List<Poem> _filteredPoems = [];
  void searchByTitle(String query) {
    setState(() {
      _filteredPoems = poems
          .where(
              (poem) => poem.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void addToFavorites(int index) {
    setState(() {
      final poem = poems[index];
      if (favoritePoems.contains(poem)) {
        favoritePoems.remove(poem);
      } else {
        favoritePoems.add(poem);
      }
    });
  }

  void editPoem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditPoemDialog(
          initialPoem: poems[index],
          onEdit: (editedPoem) {
            setState(() {
              poems[index] = editedPoem;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        }),
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            hintText: 'Search by title...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              // Border
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          onChanged: searchByTitle,
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.lightGreenAccent,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Yonatan Yeshi'),
              accountEmail: Text(email),
              currentAccountPicture: GestureDetector(
                onTap: _getImage,
                child: CircleAvatar(
                  backgroundImage:
                      _image != null ? Image.file(_image!).image : null,
                  child: _image == null ? const Icon(Icons.add_a_photo) : null,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
              ),
              title: const Text('About us'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.contact_mail,
              ),
              title: const Text('Contact us'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
                title: const Text('Log Out'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Welcome()));
                },
                leading: const Icon(Icons.logout))
          ],
        ),
      ),
      body: PoemListScreen(
        poems: _filteredPoems.isNotEmpty ? _filteredPoems : poems,
        onDelete: deletePoem,
        onFavorite: addToFavorites,
        onEdit: editPoem,
        favoritePoems: favoritePoems,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add a poem',
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddPoemDialog(
                onSave: (title, author, genre, content) {
                  setState(() {
                    poems.add(Poem(
                        title: title,
                        author: author,
                        genre: genre,
                        content: content));
                  });
                },
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
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
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            label: 'My Favorite')
      ],
      onTap: (index) {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MyFavoritesScreen(favoritePoems: favoritePoems)),
          );
        }
      },
    );
  }
}

class EditPoemDialog extends StatefulWidget {
  final Poem initialPoem;
  final void Function(Poem) onEdit;

  const EditPoemDialog(
      {Key? key, required this.initialPoem, required this.onEdit})
      : super(key: key);

  @override
  _EditPoemDialogState createState() => _EditPoemDialogState();
}

class _EditPoemDialogState extends State<EditPoemDialog> {
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _genreController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialPoem.title);
    _authorController = TextEditingController(text: widget.initialPoem.author);
    _genreController = TextEditingController(text: widget.initialPoem.genre);
    _contentController =
        TextEditingController(text: widget.initialPoem.content);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Poem'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Author'),
            ),
            TextField(
              controller: _genreController,
              decoration: const InputDecoration(labelText: 'Genre'),
            ),
            TextFormField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'Content'),
              maxLines: null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: () {
            final editedPoem = Poem(
              title: _titleController.text,
              author: _authorController.text,
              genre: _genreController.text,
              content: _contentController.text,
            );
            widget.onEdit(editedPoem);
            Navigator.of(context).pop();
          },
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _genreController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
