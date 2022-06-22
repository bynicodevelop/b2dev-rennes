import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/card_feed_widget.dart';

class PostScreen extends StatelessWidget {
  final Map<String, dynamic> post;

  const PostScreen({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Post'),
      ),
      body: CardFeedWidget(
        post: post,
      ),
    );
  }
}
