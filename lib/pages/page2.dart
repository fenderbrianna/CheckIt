import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Page2 extends StatefulWidget {
  const Page2({super.key, required this.title});

  final String title;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final videoURL = "https://www.youtube.com/watch?v=xvFZjo5PgG0";
  //final _controller = YoutubePlayerController();
  late YoutubePlayerController _controller;
  //YoutubePlayerController? _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        loop: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('CheckIt'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, right: 20, left: 20,),
              alignment: Alignment.center,
              child: Text(
                "Surprise!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 30,

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment.center,
              child: Text(
                "Today's special moments are tomorrow's memories. -Genie",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,

                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20, left: 20, right: 20,),
              alignment: Alignment.center,
              child: Text(
                "Even more than checking it off your to-do list, remember life is lived in every moment and no list can contain the true magic in living right here, right now.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              bottomActions: [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                  colors: const ProgressBarColors(
                    playedColor: Colors.green,
                    handleColor: Colors.greenAccent,
                  ),
                ),
                const PlaybackSpeedButton(),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 20,),
              child: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 75,
              ),
            ),
            const Text(
              "CheckIt",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,

                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(5.0, 5.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(50, 0, 0, 0),

                  ),
                ],
              ),
            ),

          ],
        ),

      ),

    );
  }
}

