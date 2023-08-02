import 'package:flutter/material.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/views/widgets/control%20row.dart';

class SongDetailsBody extends StatelessWidget {
  SongDetailsBody({super.key});

  double sliderVal = 0;

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
                    Icons.arrow_downward_rounded,
                    size: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/test2.jpg',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Shake it',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              'Taylor Swift',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.7),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 30),
            Slider(value: sliderVal, onChanged: (val) => sliderVal = val),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('00:00'),
                  Text('04:14'),
                ],
              ),
            ),
            const Expanded(child: SongDetailsControlRow())
          ],
        ),
      ),
    );
  }
}
