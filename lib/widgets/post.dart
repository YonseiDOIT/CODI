import 'package:codi/data/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(5),
      //   border: Border.all(
      //     color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      //     // color: Colors.amberAccent,
      //   ),
      // ),
      height: 280,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: [
            Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 241,
                    // aspectRatio: 16 / 9,
                    // enlargeCenterPage: true,
                    viewportFraction: 1.02,
                    // aspectRatio: 2.0,
                  ),
                  items: imgList
                      .map((item) => Image.network(
                            item,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height,
                          ))
                      .toList(),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(5)),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                      // color: Colors.amberAccent,
                    ),
                  ),
                  height: 37,
                  padding: const EdgeInsets.only(left: 63, right: 11),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("username"),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Icon(Icons.favorite_rounded),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text("123"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Icon(Icons.remove_red_eye_rounded),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 11),
                            child: Text("456"),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 10,
              left: 8,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 3,
                  ),
                  //set border radius to 50% of square height and width
                  image: const DecorationImage(
                    image: NetworkImage("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                    fit: BoxFit.cover, //change image fill type
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
