import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ICPMap extends StatelessWidget {
  const ICPMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: PhotoView(
                imageProvider: const AssetImage("assets/images/firstFloorMap.png"),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: PhotoView(
                imageProvider: const AssetImage("assets/images/groundFloorMap.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
