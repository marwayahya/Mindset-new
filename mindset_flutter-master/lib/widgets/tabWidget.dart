import 'package:flutter/material.dart';


class MyTabbedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabbed Screen'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Contents of Tab 1
            Center(
              child: Text('Tab 1 Content'),
            ),

            // Contents of Tab 2
            Center(
              child: Text('Tab 2 Content'),
            ),
          ],
        ),
      ),
    );
  }
}
