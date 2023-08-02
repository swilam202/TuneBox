import 'package:flutter/material.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/views/song%20details%20page.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SongDetailsPage(),),);
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
                color: Colors.red,
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/test2.jpg',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 20),
             Expanded(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   'title',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Taylor swift',
                    style: TextStyle(
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
            ),
          ],
        ),
      ),
    );
  }
}