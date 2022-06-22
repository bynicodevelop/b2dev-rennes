import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  List<String> products = [];

  // async _loadData() {} <== En JS
  Future<List<String>> _loadData() async {
    setState(() {
      _isLoading = false;
    });
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
  void initState() {
    super.initState();

    print("Je suis dans initState");

    _loadData().then((value) {
      setState(() {
        products = value;
        _isLoading = true;
      });
    });

    // await _loadData(); // /!\
  }

  @override
  Widget build(BuildContext context) {
    print("Je suis dans le build");

    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () {
            return _loadData().then((value) {
              setState(() {
                products = value;
                _isLoading = true;
              });
            });
          },
          child: _isLoading
              ? products.isNotEmpty
                  ? ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(products[index]),
                        );
                      },
                    )
                  : const Center(
                      child: Text("Aucun produit"),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
