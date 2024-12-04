import 'package:flutter/material.dart';

import 'package:codi/data/globals.dart' as globals;

class ContestWidget extends StatelessWidget {
  const ContestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 236,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 194,
            padding: const EdgeInsets.only(left: 16, top: 15, bottom: 11),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                    ),
                  ),
                  child: Image.network(
                    "https://allforyoung-homepage-maycan.s3.ap-northeast-2.amazonaws.com/uploads/post_photos/2023/04/11/3428258a320942e59137252d83c95ec2.jpg",
                    height: 168,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromRGBO(48, 52, 55, 0.2),
                            ),
                            child: const Text("tag1"),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromRGBO(48, 52, 55, 0.2),
                            ),
                            child: const Text("길이 다른 tag2"),
                          ),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Contest Title"),
                          Text("hosting_organization"),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Text("참가대상"),
                          ),
                          Text("참가대상 data"),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Text("접수기간"),
                          ),
                          Text("접수기간 data"),
                        ],
                      ),
                      Text("D-00")
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 42,
            child: Row(
              children: [
                Container(
                  width: globals.ScreenSize.width / 2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Theme.of(context).colorScheme.secondary.withOpacity(0.1), width: 1),
                      right: BorderSide(color: Theme.of(context).colorScheme.secondary.withOpacity(0.1), width: 0.5),
                    ),
                  ),
                  child: const Text("접수하기"),
                ),
                Container(
                  width: globals.ScreenSize.width / 2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Theme.of(context).colorScheme.secondary.withOpacity(0.1), width: 1),
                      left: BorderSide(color: Theme.of(context).colorScheme.secondary.withOpacity(0.1), width: 0.5),
                    ),
                  ),
                  child: const Text("팀 찾기"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
