import 'package:flutter/material.dart';

class PoemUser extends StatefulWidget {
  final String poemTitle;
  final String poemAuth;
  final String poemIndex;

  final VoidCallback onPressedFavorite;
  final VoidCallback onTap;

  const PoemUser({
    Key? key,
    required this.poemIndex,
    required this.poemTitle,
    required this.poemAuth,
    required this.onPressedFavorite,
    required this.onTap,
  }) : super(key: key);

  @override
  State<PoemUser> createState() => _PoemsState();
}

class _PoemsState extends State<PoemUser> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 20, 5),
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
                Row(
                  children: [
                    Text(
                      widget.poemIndex,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.poemTitle,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Text(
                  widget.poemAuth,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
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
