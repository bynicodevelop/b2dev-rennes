import 'package:flutter/material.dart';

class HomeFuturBuilderScreen extends StatefulWidget {
  const HomeFuturBuilderScreen({Key? key}) : super(key: key);

  @override
  State<HomeFuturBuilderScreen> createState() => _HomeFuturBuilderScreenState();
}

class _HomeFuturBuilderScreenState extends State<HomeFuturBuilderScreen> {
  Future<List<String>> _loadData() async {
    print("Chargement de la donnée en cours...");

    // Code qui faire appel à un serveur de données (API)
    await Future.delayed(const Duration(
      seconds: 2,
    ));

    print("Donnée chargée.");

    return [
      "Product 1",
      "Product 2",
      "Product 3",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: _loadData(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Aucun produit"),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index]),
              );
            },
          );
          // }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {});
      //   },
      //   child: const Icon(Icons.refresh),
      // ),
    );
  }
}
