import 'package:flutter/material.dart';

class MySliverTabBar extends StatelessWidget {
  const MySliverTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: const Text('Sliver TabBar'),
                  expandedHeight: 200,
                  centerTitle: true,
                  floating: true,
                  snap: true,
                  pinned: true,
                  stretch: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: DecoratedBox(
                      position: DecorationPosition.foreground,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black87, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.center),
                      ),
                      child: Image.asset('assets/1.jfif', fit: BoxFit.cover),
                    ),
                  ),
                  bottom: const TabBar(
                    indicatorWeight: 5,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.mail),
                        text: 'Calls',
                      ),
                      Tab(
                        icon: Icon(Icons.person),
                        text: 'Contacts',
                      ),
                      Tab(
                        icon: Icon(Icons.mail),
                        text: 'Mails',
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    var color =
                        Colors.primaries[index % Colors.primaries.length];
                    return Card(
                      color: color,
                    );
                  },
                ),
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    var color =
                        Colors.primaries[index % Colors.primaries.length];
                    return Card(
                      color: color,
                    );
                  },
                ),
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    var color =
                        Colors.primaries[index % Colors.primaries.length];
                    return Card(
                      color: color,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
