import 'dart:math';
import 'package:flutter/material.dart';
import '../tweet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final seed = Random().nextInt(100000);
    final avatarUrl = 'https://api.dicebear.com/9.x/avataaars/png?seed=$seed';

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
            ),
          ),
          title: Image.asset('assets/x-logo.png', height: 30),
          backgroundColor: Colors.black,
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            dividerColor: Colors.grey.shade800,
            tabs: const [
              Tab(text: 'Pour vous'),
              Tab(text: 'Abonnements'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('Tweet no. #$index'),
                    subtitle: Text('Contenu du tweet #$index'),
                  ),
                );
              },
            ),
            const Center(
              child: Text('Abonnements', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}