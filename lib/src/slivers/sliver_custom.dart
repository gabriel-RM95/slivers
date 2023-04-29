import 'package:flutter/material.dart';

import '../widgets/my_gridview.dart';

class MySliverCustom extends StatelessWidget {
  const MySliverCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              delegate: CustomSliverAppBarDelegate(),
              pinned: true,
              floating: true,
            ),
            const MySliverGridView(),
          ],
        ),
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset);
    return Container(
      color: Theme.of(context).primaryColor,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/1.jfif',
            fit: BoxFit.cover,
          ),
          Opacity(
            opacity: shrinkOffset / (kToolbarHeight + 150),
            child: AppBar(
              title: const Text('Sliver Custom'),
              centerTitle: true,
            ),
          ),
          Positioned(
            top: kToolbarHeight + 120 - shrinkOffset,
            left: 20,
            right: 20,
            height: 60,
            child: Opacity(
              opacity: 1 - shrinkOffset / (kToolbarHeight + 150),
              child: Card(
                elevation: 4,
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.share),
                              Text('Share'),
                            ],
                          )),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.thumb_up),
                              Text('Like'),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight + 150;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
