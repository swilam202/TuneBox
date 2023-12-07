import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../home screen/data/song model.dart';
import '../../controller/song details controller.dart';
import 'control row.dart';

class SongDetailsBody extends StatefulWidget {
  const SongDetailsBody({super.key, required this.song});

  final Song song;

  @override
  State<SongDetailsBody> createState() => _SongDetailsBodyState();
}

class _SongDetailsBodyState extends State<SongDetailsBody> {
  SongDetailsController controller = Get.put(SongDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.checkIfFavorite(songId: widget.song.id!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: AspectRatio(
                aspectRatio: 2 / 1,
                child: Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: QueryArtworkWidget(
                      id: widget.song.songId, type: ArtworkType.AUDIO),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              widget.song.title ?? 'No name',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              widget.song.artist ?? 'Unknown',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.7),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 30),
            StreamBuilder<Duration>(
              stream: controller.player.value.positionStream,
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Slider(
                      value: snapshot.data?.inMilliseconds.toDouble() ?? 0.0,
                      onChanged: (val) async {
                        Duration newPosition =
                            Duration(milliseconds: val.round());
                        await controller.player.value.seek(newPosition);
                      },
                      min: 0.0,
                      max: controller.player.value.duration?.inMilliseconds
                              .toDouble() ??
                          0.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getDuration(snapshot.data?.inSeconds ?? 0),
                          ),
                          Text(
                            getDuration(
                                controller.player.value.duration?.inSeconds ??
                                    0),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 30),
            SongDetailsControlRow(song: widget.song),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  String getDuration(num position) {
    int minutes = 0;
    while (position.toInt() >= 60) {
      minutes += 1;
      position -= 60;
    }
    if (position.toInt() < 10) {
      return '$minutes:0$position';
    } else {
      return '$minutes:$position';
    }
  }
}
