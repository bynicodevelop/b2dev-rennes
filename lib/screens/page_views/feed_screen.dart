import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/post_screen.dart';
import 'package:flutter_application_2/widgets/card_feed_widget.dart';

const List<Map<String, dynamic>> posts = [
  {
    'title': 'Post 1',
    'description': 'This is a post',
    'image': 'https://picsum.photos/id/1/300/200',
    'likes': 10,
    'shares': 2,
  },
  {
    'title': 'Post 2',
    'description': 'This is a post',
    'image': 'https://picsum.photos/id/2/300/200',
    'likes': 20,
    'shares': 3,
  },
  {
    'title': 'Post 3',
    'description': 'This is a post',
    'image': 'https://picsum.photos/id/3/300/200',
    'likes': 30,
    'shares': 4,
  },
  {
    'title': 'Post 4',
    'description': 'This is a post',
    'image': 'https://picsum.photos/id/4/300/200',
    'likes': 40,
    'shares': 5,
  },
  {
    'title': 'Post 5',
    'description': 'This is a post',
    'image': 'https://picsum.photos/id/5/300/200',
    'likes': 50,
    'shares': 6,
  },
  {
    'title': 'Post 6',
    'description': 'This is a post',
    'image': 'https://picsum.photos/id/6/300/200',
    'likes': 60,
    'shares': 7,
  },
  {
    'title': 'Post 7',
    'description': 'This is a post',
    'image': 'https://picsum.photos/id/7/300/200',
    'likes': 70,
    'shares': 8,
  },
  {
    'title': 'Post 8',
    'description': 'This is a post',
    'image': 'https://picsum.photos/id/8/300/200',
    'likes': 80,
    'shares': 9,
  },
  {
    'title': 'Post 9',
    'description': 'This is a post',
    'image': 'https://picsum.photos/id/9/300/200',
    'likes': 90,
    'shares': 10,
  },
  {
    'title': 'Post 10',
    'description': 'This is a post',
    'image': 'https://picsum.photos/id/10/300/200',
    'likes': 100,
    'shares': 10,
  },
];

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostScreen(
                  post: posts[index],
                ),
              ),
            );
          },
          child: CardFeedWidget(
            post: posts[index],
          ),
        );

        // ListTile(
        //   title: Text(posts[index]['title']),
        //   subtitle: Text(posts[index]['description']),
        // );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 16.0,
      ),
    );
  }
}
