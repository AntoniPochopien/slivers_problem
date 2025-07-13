import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  double _listTopPadding = kToolbarHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Add background gradient
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.amber, Colors.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        //Make scaffold transparent to show gradient
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: Colors
                    .transparent, //Make appbar transparent tho show gradient
                forceMaterialTransparency: true,
                pinned: true,
                expandedHeight: 200,
                collapsedHeight: kToolbarHeight,
                flexibleSpace: FlexibleSpaceBar(
                  //Add some content
                  title: Center(child: Text('Felxible space')),
                ),
              ),
            ],
            body: Padding(
              padding: EdgeInsets.only(top: _listTopPadding),
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 75,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            if (_listTopPadding > 0) {
              _listTopPadding = 0;
            } else {
              _listTopPadding = kToolbarHeight;
            }
          }),
        ),
      ),
    );
  }
}
