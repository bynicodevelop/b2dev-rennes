import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/post_model.dart';
import 'package:flutter_application_2/screens/post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<PostModel>> _loadPosts() async {
    Response response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');

    return List<PostModel>.from(
      response.data.map((d) => PostModel.fromJson(d)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog 2 Dev"),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: _loadPosts(),
        builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              // child: LinearProgressIndicator(),
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          final List<PostModel> posts = snapshot.data!;

          if (posts.isEmpty) {
            return const Center(
              child: Text("No posts found"),
            );
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final PostModel post = posts[index];

              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostScreen(
                          post: post,
                        ),
                      ),
                    );
                  },
                  title: Text(post.title),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
