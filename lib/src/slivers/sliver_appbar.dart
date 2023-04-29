import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sliver_appbar/src/widgets/my_gridview.dart';

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {
  bool load = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              centerTitle: true,
              floating: true,
              snap: true,
              pinned: false,
              stretch: true,
              // collapsedHeight: 100,
              expandedHeight: 250,
              onStretchTrigger: () async {
                SchedulerBinding.instance.addPostFrameCallback(
                  (timeStamp) {
                    setState(() {
                      load = true;
                    });
                  },
                );
                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    setState(() {
                      load = false;
                    });
                  },
                );
              },
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: load
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const SizedBox.shrink(),
                  ),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Sliver Appbar',
                ),
                centerTitle: true,
                background: DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.transparent],
                        // stops: [0.0, 0.75],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                      ),
                    ),
                    child: Image.asset('assets/1.jfif', fit: BoxFit.cover)),
              ),
            ),
            const MySliverGridView(),
          ],
        ),
      ),
    );
  }
}
