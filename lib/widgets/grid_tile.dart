import 'package:calibre_carte/models/books.dart';
import 'package:calibre_carte/screens/book_details_screen.dart';
import 'package:calibre_carte/widgets/book_details_cover_image.dart';
import 'package:flutter/material.dart';

class CalibreGridTile extends StatelessWidget {
  final Books book;

  CalibreGridTile(this.book);

  @override
  Widget build(BuildContext context) {
    void viewBookDetails(int bookId) {
      print(bookId);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return BookDetailsScreen(
          bookId: bookId,
        );
      }));
    }

    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: Stack(
        fit: StackFit.expand,
        children: [
          BookDetailsCoverImage(book.id, book.path, null, null),
//          _TextualInfo(event),
//          Positioned(
//            top: 10.0,
//            child: Visibility(
//              visible: showReleaseDateInformation,
//              child: EventReleaseDateInformation(event),
//            ),
//          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => viewBookDetails(book.id),
              child: Container(),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: BoxDecoration(
//                border: Border.all(),
                borderRadius: BorderRadius.circular(1),
                color: Colors.black.withOpacity(0.6),
              ),
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height / 15,
//              width: MediaQuery.of(context).size.width / 2.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  book.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//GestureDetector(
//onTap: () => viewBookDetails(book.id),
//child: Card(
//color: Colors.transparent,
//margin: const EdgeInsets.symmetric(
//vertical: 7,
//horizontal: 5,
//),
//elevation: 10,
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Container(
//decoration: BoxDecoration(
//color: Colors.black.withOpacity(0.5),
//borderRadius: BorderRadius.circular(10),
//),
//padding: EdgeInsets.all(0),
//height: MediaQuery.of(context).size.height / 4,
//width: MediaQuery.of(context).size.width / 3,
//child: Container(key:Key(book.title), child: BookDetailsCoverImage(book.id, book.path)),
//),
//
//],
//)),
//);
