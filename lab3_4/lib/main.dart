import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LAB-03&04',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const MyHomePage(title: 'LAB-03&04'),
    );
  }
}

// The home page widget, containing the app bar and a list of tweets
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      // ListView.builder is used to generate a list of TweetWidgets
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return TweetWidget(
                userIcon: 'T',
                userShortName: 'TFT',
                userLongName: 'Teamfight Tactics',
                timeString: '2h ago',
                description: "Chibi Champions! Chibi Champions are bite-sized versions of their League of Legends counterparts, with all the team-fighting talent and portal-making power of Little Legends. Making their debut on the Convergence first? Chibi Ekko, Chibi Jinx, and Chibi Vi!",
                imageURL:"https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/bltd3a76db518246efb/6168ba3e892d6e03a88034e0/10182021-TFT_621_Chibi-Champs-Article-Header.jpg",
                numComments: 5421,
                numRetweets: 3098,
                numLikes: 16685,
              );
            case 1:
              return TweetWidget(
                userIcon: 'N',
                userShortName: 'NASA',
                userLongName: 'NASA',
                timeString: '4h ago',
                description: "MOON!",
                imageURL: 'https://www.nasa.gov/wp-content/uploads/2020/07/moon-near-side-lro.jpg?resize=768,768',
                numComments: 5036,
                numRetweets: 7801,
                numLikes: 25680,
              );
          }
        },
      ),
    );
  }
}

class TweetWidget extends StatelessWidget {
  final String userIcon;
  final String userShortName;
  final String userLongName;
  final String timeString;
  final String description;
  final String imageURL;
  final int numComments;
  final int numRetweets;
  final int numLikes;

  const TweetWidget({
    required this.userIcon,
    required this.userShortName,
    required this.userLongName,
    required this.timeString,
    required this.description,
    required this.imageURL,
    required this.numComments,
    required this.numRetweets,
    required this.numLikes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Function to determine the background color of the avatar based on the user
    Color determineAvatarColor() {
      if (userShortName == 'TFT') {
        return Colors.yellow;
      } else if (userShortName == 'NASA') {
        return Colors.blue;
      } else {
        return Colors.black;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: determineAvatarColor(),
            child: Text(userIcon), // Make the text transparent as we have an image.
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(userLongName, style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 6),
                    Text('@' + userShortName, style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 6),
                    Text(timeString, style: TextStyle(color: Colors.grey)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.expand_more))
                  ],
                ),
                Text(description),
                Image.network(imageURL, fit: BoxFit.cover),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.chat_bubble_outline)),
                    Text("$numComments"),
                    IconButton(onPressed: () {}, icon: Icon(Icons.repeat)),
                    Text("$numRetweets"),
                    IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
                    Text("$numLikes"),
                    IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
