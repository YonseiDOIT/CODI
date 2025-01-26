import 'package:flutter/material.dart';

import 'package:codi/data/custom_icons.dart';
import 'package:codi/data/globals.dart' as globals;

class CustomTopBar extends StatefulWidget {
  final int tabIndex;
  final TabController? controller;
  const CustomTopBar({super.key, required this.tabIndex, this.controller});

  @override
  State<CustomTopBar> createState() => _CustomTopBarState();
}

class _CustomTopBarState extends State<CustomTopBar> {
  int selectedOption = 0;
  static const int animateDuration = 200;
  bool showSortOptions = false;
  late String selectedSortOption;

  @override
  void initState() {
    super.initState();
    if (widget.tabIndex != 1) {
      selectedSortOption = displayText[widget.tabIndex][0]["sort"][0];
    }
  }

  void setShowSort(bool value) {
    setState(() {
      showSortOptions = value;
    });
  }

  List<List<Map>> displayText = [
    [
      {
        "option": "개발자",
        "sort": ["추천순", "최신순", "조회순", "평가순"],
      },
      {
        "option": "디자이너",
        "sort": ["추천순", "최신순", "조회순", "평가순"],
      },
    ],
    [
      {"option": "채팅"},
    ],
    [
      {
        "option": "리스트",
        "sort": ["최신순", "조회순", "관심순", "마감순"],
      },
      {
        "option": "팀 모집",
        "sort": ["최신순", "마감순"],
      },
    ],
    []
  ];

  List<Map> displayIcon = [
    {
      "left": CustomIcons.search,
      "right": [CustomIcons.notification, CustomIcons.notificationNew],
    },
    {
      "left": CustomIcons.filter,
      "right": CustomIcons.send,
    },
    {
      "left": CustomIcons.search,
      "right": CustomIcons.bookmark,
    },
    {},
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: animateDuration),
      // height: 72,
      height: showSortOptions ? 112 : 72,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 24,
              left: 20,
            ),
            child: Icon(
              displayIcon[widget.tabIndex]["left"],
              size: 24,
            ),
          ),
          widget.tabIndex != 1
              ? ToggleDropdown(
                  entries: displayText[widget.tabIndex],
                  setShowSort: setShowSort,
                  controller: widget.controller,
                )
              : Center(
                  child: Text(
                    displayText[widget.tabIndex][0]["option"],
                    style: const TextStyle(
                      color: globals.Colors.point2,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
          Container(
            margin: const EdgeInsets.only(
              top: 24,
              right: 20,
            ),
            child: Icon(
              widget.tabIndex != 0
                  ? displayIcon[widget.tabIndex]["right"]
                  : displayIcon[widget.tabIndex]["right"][0],
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class ToggleDropdown extends StatefulWidget {
  final List<Map> entries;
  Function setShowSort;
  final TabController? controller;
  ToggleDropdown({super.key, required this.entries, required this.setShowSort, this.controller});

  @override
  State<ToggleDropdown> createState() => _ToggleDropdownState();
}

class _ToggleDropdownState extends State<ToggleDropdown> {
  static const int animateDuration = 200;
  int selectedIndex = 0;
  int selectedSortIndex = 0;
  bool isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    // debugPrint("coditest${widget.entries}");
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: animateDuration),
      height: isDropdownOpen ? 112 : 72,
      width: globals.ScreenSize.width - 88,
      child: Stack(
        children: [
          AnimatedPositioned(
            top: isDropdownOpen ? 60 : 0,
            duration: const Duration(milliseconds: animateDuration),
            curve: Curves.decelerate,
            child: SizedBox(
              height: 52,
              width: globals.ScreenSize.width - 88,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.entries[selectedIndex]["sort"].length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSortIndex = index;
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        child: Text(
                          widget.entries[selectedIndex]["sort"][index],
                          style: selectedSortIndex == index
                              ? const TextStyle(
                                  color: globals.Colors.point1,
                                  fontWeight: FontWeight.w700)
                              : TextStyle(
                                  color: globals.Colors.point2.withOpacity(0.3),
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              color: globals.Colors.sub3,
              child: Container(
                margin: const EdgeInsets.only(left: 36, right: 36, top: 12),
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: globals.Colors.point2.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(30),
                  color: globals.Colors.sub3,
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      left: selectedIndex *
                          ((constraints.maxWidth - 72) / widget.entries.length),
                      duration: const Duration(milliseconds: animateDuration),
                      curve: Curves.decelerate,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 6),
                        width: (constraints.maxWidth - 72) /
                                widget.entries.length -
                            12,
                        height: 34,
                        decoration: BoxDecoration(
                          color: globals.Colors.point2,
                          borderRadius: BorderRadius.circular(48),
                        ),
                      ),
                    ),
                    Row(
                      children: List.generate(
                        widget.entries.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              if (selectedIndex != index) {
                                setState(() {
                                  selectedIndex = index;
                                  isDropdownOpen = false;
                                  widget.setShowSort(false);
                                  widget.controller!.animateTo(index);
                                });
                              } else {
                                setState(() {
                                  isDropdownOpen = !isDropdownOpen;
                                  widget.setShowSort(isDropdownOpen);
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              width: (constraints.maxWidth - 72) /
                                      widget.entries.length -
                                  1,
                              child: Row(
                                children: [
                                  Container(
                                    // margin: EdgeInsets.only(left: constraints.maxWidth / entries.length / 4),
                                    width: (constraints.maxWidth - 72) /
                                        widget.entries.length /
                                        2,
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      widget.entries[index]["option"],
                                      style: selectedIndex == index
                                          ? const TextStyle(
                                              color: globals.Colors.sub3)
                                          : null,
                                    ),
                                  ),
                                  selectedIndex == index
                                      ? Container(
                                          margin:
                                              const EdgeInsets.only(left: 5),
                                          child: const Icon(
                                            CustomIcons.chevronDown,
                                            size: 10,
                                            color: globals.Colors.sub3,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
