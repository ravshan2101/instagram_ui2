import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_ui2/main.dart';
import 'package:instagram_ui2/model/post.dart';
import 'package:instagram_ui2/model/story_model.dart';

class FeddPage extends StatefulWidget {
  const FeddPage({Key? key}) : super(key: key);

  @override
  State<FeddPage> createState() => _FeddPageState();
}

class _FeddPageState extends State<FeddPage> {
  List<Story> _storylist = [
    Story('assets/images/story_1.jpeg', 'Javakhir'),
    Story('assets/images/story_2.jpeg', 'Salim'),
    Story('assets/images/story_3.jpeg', 'Farrux'),
    Story('assets/images/story_4.jpeg', 'Ravshan'),
    Story('assets/images/story_5.jpeg', 'Rasul'),
  ];

  List<Post> _postlist = [
    Post('Rasul', 'assets/images/story_5.jpeg', 'assets/images/feed_5.jpeg',
        'Hammasi yaxshi boladi...'),
    Post('Salim', 'assets/images/story_2.jpeg', 'assets/images/feed_2.jpeg',
        'Hammasi yaxshi boladi...'),
    Post('Javakhir', 'assets/images/story_5.jpeg', 'assets/images/feed_1.jpeg',
        'Hammasi yaxshi boladi...'),
    Post('Farrux', 'assets/images/story_5.jpeg', 'assets/images/feed_3.jpeg',
        'Hammasi yaxshi boladi...'),
    Post('Ravshan', 'assets/images/story_4.jpeg', 'assets/images/feed_4.jpeg',
        'Hammasi yaxshi boladi...'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            //stories and watch all
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Stories',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text('Watch All',
                      style: TextStyle(color: Colors.grey, fontSize: 14))
                ],
              ),
            )
            // story
            ,
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 110,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: _storylist.map((story) {
                    return _itemOfStory(story);
                  }).toList()),
            )
            // post
            ,
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _postlist.length,
                itemBuilder: (context, index) {
                  return _itempost(_postlist[index]);
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}

Widget _itempost(Post post) {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(
                      image: AssetImage(post.userimage),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(post.username)
                ],
              ),
              Icon(Icons.more_horiz)
            ],
          ),
        ),
        FadeInImage(
            placeholder: AssetImage('assets/images/story_1.jpeg'),
            image: AssetImage(post.postimage)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.heart)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.chat_bubble_outline)),
                IconButton(onPressed: () {}, icon: Icon(Icons.send))
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_outline))
          ],
        ),
        //text
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.symmetric(horizontal: 14),
          child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(children: [
                TextSpan(
                    text: 'Liked By ',
                    style: TextStyle(
                      color: Colors.black,
                    )),
                TextSpan(
                    text: 'Diana ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: 'Farrux ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: 'Sardor ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: 'and ',
                    style: TextStyle(
                      color: Colors.black,
                    )),
                TextSpan(
                    text: '1233 others',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ])),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: RichText(
              overflow: TextOverflow.visible,
              softWrap: true,
              text: TextSpan(children: [
                TextSpan(
                    text: post.username,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(
                    text: post.capition,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))
              ])),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 14,
          ),
          alignment: Alignment.topLeft,
          child: Text('2022 Februal'),
        )
      ],
    ),
  );
}

Widget _itemOfStory(Story story) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(right: 10, left: 10),
        child: CircleAvatar(
          radius: 38,
          backgroundColor: Color(0xFF8e44ad),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 33,
              backgroundImage: AssetImage(story.image),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(story.name)
    ],
  );
}
