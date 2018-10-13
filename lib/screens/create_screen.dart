import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
            ),
          );
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        onIndexChanged: (index) {
          print(index);
        },
        controller: SwiperController(

        ),
      ),
    );
  }
}
