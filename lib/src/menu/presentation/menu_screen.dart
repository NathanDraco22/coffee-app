import 'package:flutter/material.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 0.0,
            pinned: true,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              background: FlutterLogo(),
              centerTitle: true,
              title: Text("Menu"),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) =>  const MenuExpandedTile(),
            )
          ),
        ],
      )
    );
  }
}

class MenuListView extends StatelessWidget {
  const MenuListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return MenuExpandedTile();
      },
    );
  }
}

class MenuExpandedTile extends StatelessWidget {
  const MenuExpandedTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text("Large Title about a menu item"),
      tilePadding: const EdgeInsets.all(20),
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
              width: 140,
              child: const Placeholder(
                fallbackHeight: 300,
              )),
          ),
        )
      ],
    );
  }
}