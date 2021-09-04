import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';
import 'package:spotify_ui/models/current_track_model.dart';
import 'package:provider/provider.dart';

class TracksList extends StatelessWidget {
  final List<Song>? tracks;
  const TracksList({Key? key, this.tracks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: TextStyle(
        fontSize: 12.0,
      ),
      dataRowHeight: 54.0,
      showCheckboxColumn: false,
      columns: const [
        DataColumn(
            label: Text(
          'TITLE',
          style: TextStyle(color: Colors.white),
        )),
        DataColumn(
            label: Text('ARTIST', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('ALBUM', style: TextStyle(color: Colors.white))),
        DataColumn(
            label: Icon(
          Icons.access_time,
          color: Colors.white,
        ))
      ],
      rows: tracks!.map((e) {
        final selected =
            context.watch<CurrentTrackModel>().selected?.id == e.id;
        final textStyle =
            TextStyle(color: selected ? Colors.green : Colors.white);
        return DataRow(
          cells: [
            DataCell(Text(
              e.title,
              style: textStyle,
            )),
            DataCell(Text(
              e.artist,
              style: textStyle,
            )),
            DataCell(Text(
              e.album,
              style: textStyle,
            )),
            DataCell(Text(
              e.duration,
              style: textStyle,
            )),
          ],
          selected: selected,
          onSelectChanged: (_) =>
              context.read<CurrentTrackModel>().selectedTrack(e),
        );
      }).toList(),
    );
  }
}
