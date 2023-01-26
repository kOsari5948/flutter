import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Floating App Bar';

    return MaterialApp(
      theme: ThemeData(
        //테마 설정

        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        brightness: Brightness.dark, //전체 색상
        primaryColor: Colors.black, //타이틀 색상
      ),
      title: title,
      home: Scaffold(
        // No appbar provided to the Scaffold, only a body with a
        // CustomScrollView.
        body: CustomScrollView(
          slivers: [
            // Add the app bar to the CustomScrollView.
            const SliverAppBar(
              // Provide a standard title.
              title: Text(title),
              // Allows the user to reveal the app bar if they begin scrolling
              // back up the list of items.
              floating: true,
              backgroundColor: Colors.transparent,
              // Display a placeholder widget to visualize the shrinking size.
              flexibleSpace: FlexibleSpaceBar(),
              // Make the initial height of the SliverAppBar larger than normal.
              expandedHeight: 200,
            ),

            // Next, create a SliverList
            SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
                // The builder function returns a ListTile with a title that
                // displays the index of the current item.
                (context, index) => ListTile(
                    title: Container(
                  child: Column(children: <Widget>[Text("data"), Text("data")]),
                )),
                // Builds 1000 ListTiles
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
