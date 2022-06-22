import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/post_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PostScreen extends StatelessWidget {
  final PostModel post;

  const PostScreen({
    Key? key,
    required this.post,
  }) : super(key: key);

  Future<Map<String, dynamic>> _loadImage(int id) async {
    final Response response =
        await Dio().get("https://jsonplaceholder.typicode.com/photos/$id");

    return Map<String, dynamic>.from(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog 2 Dev - Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22.0,
          vertical: 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<Map<String, dynamic>>(
              future: _loadImage(post.id),
              builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitThreeBounce(
                      color: Colors.blue,
                      size: 30.0,
                    ),
                  );
                }

                return Image.network(
                  snapshot.data!['url'],
                  fit: BoxFit.cover,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Text(
                post.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Text(
              post.body,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
