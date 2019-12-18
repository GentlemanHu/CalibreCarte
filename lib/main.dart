import 'package:calibre_carte/homepage.dart';
import 'package:calibre_carte/providers/book_details_navigation_provider.dart';
import 'package:calibre_carte/providers/color_theme_provider.dart';
import 'package:calibre_carte/providers/update_provider.dart';
import 'package:calibre_carte/screens/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool tokenExists;
  bool darkMode;
  String searchFilter;
  Future myFuture;

  Future<void> getTokenAndSearchFromPreferences() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    tokenExists = sp.containsKey('token');
    searchFilter = sp.getString('searchFilter') ?? 'title';
    darkMode=sp.getBool('darkMode')??false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFuture = getTokenAndSearchFromPreferences();
  }

  @override
  Widget build(BuildContext context) {
//    print("REBUILDING APP");
    return FutureBuilder(
      future: myFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => Update(tokenExists, searchFilter),
              ),
              ChangeNotifierProvider(
                create: (_) => BookDetailsNavigation(),
              ),
              ChangeNotifierProvider(create: (_)=>ColorTheme(darkMode),)
            ],
            child: MaterialApp(
              title: "Calibre Carte",
              theme: ThemeData(primarySwatch: Colors.blueGrey, dividerColor: Colors.transparent),
              home: MyHomePage(),
              routes: {
                BookDetailsScreen.routeName: (ctx) => BookDetailsScreen(),
              },
            ),
          );
        } else {
          return Container(
              color: Colors.white, child: CircularProgressIndicator());
        }
      },
    );
  }
}
