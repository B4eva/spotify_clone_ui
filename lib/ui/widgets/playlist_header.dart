import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist? playlist;
  const PlaylistHeader({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Image.asset(
              playlist!.imageURL,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'playlist'.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .overline!
                          .copyWith(fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      playlist!.name,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      playlist!.description,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                        'Created by ${playlist!.creator} ${playlist!.songs.length} songs, ${playlist!.duration}',
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        PlaylistButtons(followers: playlist!.followers)
      ],
    );
  }
}

class PlaylistButtons extends StatelessWidget {
  const PlaylistButtons({Key? key, this.followers}) : super(key: key);
  final String? followers;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 48.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                backgroundColor: Colors.green[400],
                primary: Colors.white,
                textStyle: TextStyle(fontSize: 12.0, letterSpacing: 2.0)),
            child: Text('Play')),
        const SizedBox(
          width: 8.0,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border, color: Colors.white),
          iconSize: 30.0,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
          iconSize: 30.0,
        ),
        Spacer(),
        Text(
          'FOLLOWERS\n$followers',
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 12.0, color: Colors.white),
        ),
      ],
    );
  }
}
