import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';
import 'package:spotify_ui/ui/widgets/widgets.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist? playlist;
  const PlaylistScreen({Key? key, this.playlist}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          leadingWidth: 140.0,
          elevation: 0,
          backgroundColor: Color(0xFFAF1018),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.chevron_left, size: 28.0),
                    )),
                const SizedBox(
                  width: 16.0,
                ),
                InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.chevron_right, size: 28.0),
                    )),
              ],
            ),
          ),
          actions: [
            TextButton.icon(
              style: TextButton.styleFrom(primary: Colors.white),
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 30.0,
              ),
              label: const Text('Efuet Bright'),
            ),
            SizedBox(
              width: 8.0,
            ),
            IconButton(
                padding: EdgeInsets.only(),
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                )),
            SizedBox(
              width: 20.0,
            ),
          ]),
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                const Color(0xFFAF1018),
                const Color(0xFF121212),
              ],
                  stops: [
                0,
                0.4
              ])),
          child: Scrollbar(
            controller: _scrollController,
            isAlwaysShown: true,
            child: ListView(
              controller: _scrollController,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
              children: <Widget>[PlaylistHeader(playlist: widget.playlist)],
            ),
          )),
    );
  }
}
