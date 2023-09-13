import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/features/home%20screen/presentation/manager/home%20page%20cubit.dart';

import '../../features/home screen/data/song model.dart';
import '../../features/song details screen/presentation/manager/song details cubit/song details cubit.dart';
import '../../features/song details screen/presentation/views/song details page.dart';
import 'get image.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key,required this.id});
final int id;


  @override
  Widget build(BuildContext context) {
    Song song = BlocProvider.of<HomePageCubit>(context).songs.firstWhere((element) => element.id == id);
    //int index = ;
    //Song song = BlocProvider.of<SongDetailsCubit>(context).songs[index];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SongDetailsPage(
        id: id,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Colors.grey,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
                image: DecorationImage(
                  image: getImage(song.image),
                  fit: BoxFit.fill,
                  onError: (exception, stackTrace) => Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title ?? 'No name',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    song.artist ?? 'Unknown',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.play_arrow,
              size: 30,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
