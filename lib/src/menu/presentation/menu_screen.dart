import 'package:flutter/material.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: const Text("Large Title"),
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
        },
      )
    );
  }
}