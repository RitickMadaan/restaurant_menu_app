import 'package:flutter/material.dart';
import 'screens/categories.dart';
import 'screens/best_seller.dart';
import 'screens/random_pics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static int _page = 0;
  PageController _c;

  @override
  void initState() {
    _c = PageController(
      initialPage: _page,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Restaurant Menu App',
        theme: ThemeData.light(),
        home: Scaffold(
          body: Container(
            child: Stack(
              children: <Widget>[
                PageView(
                  controller: _c,
                  onPageChanged: (newPage) {
                    setState(() {
                      _page = newPage;
                    });
                  },
                  children: [categories(), bestSeller(), randomPics()],
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                    decoration: BoxDecoration(
                      // color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(100.0),
                      // border: Border.all(color: Colors.black12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: BottomNavigationBar(
                        backgroundColor: Colors.black87,
                        showUnselectedLabels: true,
                        elevation: 0,
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                              icon: Icon(Icons.category),
                              title: Text('Category')),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.star),
                              title: Text('Best Seller')),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.casino), title: Text('Random')),
                        ],
                        onTap: (index) {
                          this._c.animateToPage(index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        currentIndex: _page,
                        selectedItemColor: Colors.yellow[200],
                        unselectedItemColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
