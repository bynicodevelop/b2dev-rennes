import 'package:flutter/material.dart';

class CardFeedWidget extends StatelessWidget {
  final Map<String, dynamic> post;

  const CardFeedWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 16.0,
          ),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(
              post['image'],
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          post['title'],
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          post['description'],
          style: Theme.of(context).textTheme.caption,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
                Text(
                  "${post['likes']}",
                )
              ],
            ),
            const SizedBox(
              width: 16.0,
            ),
            Column(
              children: [
                const Icon(Icons.share),
                Text(
                  "${post['shares']}",
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
