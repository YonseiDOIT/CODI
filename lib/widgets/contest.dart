import 'package:flutter/material.dart';

import 'package:codi/data/globals.dart' as globals;

class ContestWidget extends StatelessWidget {
  final Map item;

  ContestWidget({
    super.key,
    required this.item,
  });

  late List tags;
  late int dDay;

  @override
  Widget build(BuildContext context) {
    tags = item["tags"].toString().split(", ");
    dDay = DateTime.now().difference(DateTime.parse(item["registration_end_date"])).inDays;

    return Container(
      // height: 236,
      width: globals.ScreenSize.width,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            // width: 1,
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
                    item["poster_image_link"],
                    height: 168,
                    width: 119,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: globals.ScreenSize.width - 119 - 16 - 12,
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: List.generate(tags.length, (index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              margin: const EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color.fromRGBO(48, 52, 55, 0.2),
                              ),
                              child: Text(
                                tags[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).colorScheme.secondary,
                                  fontSize: 10,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["name"],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            item["hosting_organization"],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: const Text(
                              "참가대상",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            item["entry_requirements"],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: const Text(
                              "접수기간",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            "${item["registration_start_date"]} ~ ${item["registration_end_date"]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      if (dDay > 10)
                        Text(
                          "D-$dDay",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        )
                      else if (10 >= dDay && dDay >= 0)
                        Text(
                          "D-$dDay",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )
                      else
                        Text(
                          "접수 종료됨",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                          ),
                        )
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
                  child: const Text(
                    "접수하기",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
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
                  child: const Text(
                    "팀 찾기",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
