import 'package:flutter/material.dart';

class Poems extends StatefulWidget {
  final String poemTitle;
  final String pubDate;
  final VoidCallback onPressedDelete;
  final VoidCallback onPressedFavorite;
  final VoidCallback onTap;

  const Poems({
    Key? key,
    required this.poemTitle,
    required this.pubDate,
    required this.onPressedDelete,
    required this.onPressedFavorite,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Poems> createState() => _PoemsState();
}

class _PoemsState extends State<Poems> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 20, 5),
      decoration: BoxDecoration(
          color: Colors.blue[400], borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: widget.onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.poemTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Text(
                  widget.pubDate,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: widget.onPressedDelete,
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    size: 40,
                    color: isFavorite ? Colors.red : Colors.grey[300],
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    widget.onPressedFavorite();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
