import 'package:calibre_carte/helpers/text_style.dart';
import 'package:calibre_carte/screens/book_details_Ekansh.dart';
import 'package:calibre_carte/widgets/book_details_cover_image.dart';
import 'package:calibre_carte/widgets/download_icon.dart';
import 'package:flutter/material.dart';

class CoolTile extends StatelessWidget {
  final index;
  final books;

  CoolTile(this.index, this.books);

  void viewBookDetails(int bookId, BuildContext context) {
//      print(bookId);
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return BookDetailsScreenEkansh(
        bookId: bookId,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => viewBookDetails(books[index].id, context),
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        decoration: new BoxDecoration(
          color: index % 2 == 0 ? Colors.white : Colors.white70,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              child: Container(
                child: BookDetailsCoverImage(
                    books[index].id,
                    books[index].path,
                    MediaQuery.of(context).size.height / 5,
                    MediaQuery.of(context).size.width / 3.7),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(height: 20.0),
                  Text(
                    books[index].title,
                    style: TextStyling.headerTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Container(height: 10.0),
                  Text(
                    books[index].author_sort,
                    style: TextStyling.subHeaderTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    height: 2.0,
                    width: 18.0,
                    color: Color(0xff00c6ff),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DownloadIcon(books[index].id),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
