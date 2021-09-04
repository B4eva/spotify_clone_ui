import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_ui/models/current_track_model.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            _TrackInfo(),
            const Spacer(),
            _PlayerControls(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(children: <Widget>[
      Image.asset(
        'assets/lofigirl.jpg',
        height: 60.0,
        width: 60.0,
        fit: BoxFit.cover,
      ),
      const SizedBox(
        width: 12.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            selected.title,
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 4.0),
          Text(
            selected.artist,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      const SizedBox(
        width: 12.0,
      ),
      IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
          color: Colors.white)
    ]);
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    // if(selected == );
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(
                Icons.shuffle,
                color: Colors.white,
              ),
              iconSize: 20.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(
                Icons.skip_previous_outlined,
                color: Colors.white,
              ),
              iconSize: 20.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(
                Icons.play_circle_outline,
                color: Colors.white,
              ),
              iconSize: 20.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(
                Icons.skip_next_outlined,
                color: Colors.white,
              ),
              iconSize: 20.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(
                Icons.repeat,
                color: Colors.white,
              ),
              iconSize: 20.0,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 1.0,
        ),
        Row(
          children: <Widget>[
            Text(
              '0.00',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(2.5)),
                height: 5.0,
                width: MediaQuery.of(context).size.width * 0.3),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              selected?.duration ?? '0.00',
              style: TextStyle(color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.devices_outlined, color: Colors.white, size: 20),
      ),
      Row(
        children: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_up_outlined,
                color: Colors.white,
              )),
          Container(
            height: 5.0,
            width: 70.0,
            decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5)),
          )
        ],
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.fullscreen_outlined,
          color: Colors.white,
        ),
      ),
    ]);
  }
}
