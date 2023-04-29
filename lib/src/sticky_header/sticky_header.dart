import 'package:flutter/material.dart';

class MyStickyHeader extends StatefulWidget {
  const MyStickyHeader({Key? key}) : super(key: key);

  @override
  State<MyStickyHeader> createState() => _MyStickyHeaderState();
}

class _MyStickyHeaderState extends State<MyStickyHeader> {
  late ScrollController controller;
  final key1 = GlobalKey();
  final key2 = GlobalKey();
  final key3 = GlobalKey();
  late Offset offset;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: controller,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              snap: false,
              stretch: true,
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text('Sticky Headers'),
                background: Image.asset(
                  'assets/1.jfif',
                  fit: BoxFit.cover,
                ),
              ),
              title: SizedBox(
                  height: kToolbarHeight,
                  child: InkWell(
                    onTap: () {
                      Scrollable.ensureVisible(
                        key1.currentContext!,
                        duration: const Duration(seconds: 1),
                      );
                    },
                  )),
            ),
            SliverList(
              key: key1,
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final color =
                      Colors.primaries[index % Colors.primaries.length];
                  return Card(
                    color: color,
                    child: const SizedBox(
                      height: 100,
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              title: SizedBox(
                  height: kToolbarHeight,
                  child: InkWell(
                    onTap: () {
                      Scrollable.ensureVisible(
                        key2.currentContext!,
                        duration: const Duration(seconds: 1),
                      );
                    },
                    child: const Center(child: Text('Section A')),
                  )),
            ),
            SliverList(
              key: key2,
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final color =
                      Colors.primaries[index % Colors.primaries.length];
                  return Card(
                    color: color,
                    child: const SizedBox(
                      height: 100,
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              title: SizedBox(
                  height: kToolbarHeight,
                  child: InkWell(
                    onTap: () {
                      Scrollable.ensureVisible(
                        key3.currentContext!,
                        duration: const Duration(seconds: 1),
                      );
                    },
                    child: const Center(child: Text('Section B')),
                  )),
            ),
            SliverList(
              key: key3,
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final color =
                      Colors.primaries[index % Colors.primaries.length];
                  return Card(
                    color: color,
                    child: const SizedBox(
                      height: 100,
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final color =
                      Colors.primaries[index % Colors.primaries.length];
                  return Card(
                    color: color,
                    child: const SizedBox(
                      height: 100,
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Expandable Section')));
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
