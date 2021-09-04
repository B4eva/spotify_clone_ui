import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      /*Theme.of(context).primaryColor,*/
      height: double.infinity,
      width: 280.0,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/spotify_logo.png',
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuIconTab(
            iconData: Icons.home,
            onTap: () {},
            title: 'Home',
          ),
          _SideMenuIconTab(
            iconData: Icons.search,
            onTap: () {},
            title: 'Search',
          ),
          _SideMenuIconTab(
            iconData: Icons.audiotrack,
            onTap: () {},
            title: 'Radio',
          ),
          const SizedBox(
            height: 12.0,
          ),
          _LibraryPlayList(),
        ],
      ),
    );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  const _SideMenuIconTab({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.white,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
        /*Theme.of(context).textTheme.bodyText1,*/
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlayList extends StatefulWidget {
  const _LibraryPlayList({Key? key}) : super(key: key);

  @override
  __LibraryPlayListState createState() => __LibraryPlayListState();
}

class __LibraryPlayListState extends State<_LibraryPlayList> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thickness: 10,
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                  child: Text(
                    'YOUR LIBRARY',
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary
                    .map((e) => ListTile(
                          dense: true,
                          title: Text(
                            e,
                            style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.0),
                          ),
                          onTap: () {
                            print(e);
                          },
                        ))
                    .toList(),
              ],
            ),
            const SizedBox(height: 24.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                  child: Text(
                    'PLAYLIST',
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists
                    .map((e) => ListTile(
                          dense: true,
                          title: Text(
                            e,
                            style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.0),
                          ),
                          onTap: () {
                            print(e);
                          },
                        ))
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
