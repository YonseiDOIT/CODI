import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:codi/data/custom_icons.dart';
import 'package:codi/data/globals.dart' as globals;

import 'package:codi/widgets/segmented_button_slide.dart';

class CustomTopBar extends StatefulWidget {
  const CustomTopBar({super.key});

  @override
  State<CustomTopBar> createState() => _CustomTopBarState();
}

class _CustomTopBarState extends State<CustomTopBar> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 72,
      height: 112,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 24,
              left: 20,
            ),
            child: const Icon(
              CustomIcons.search,
              size: 24,
            ),
          ),
          ToggleDropdown(entries: ["리스트", "팀 모집"]),
          Container(
            margin: const EdgeInsets.only(
              top: 24,
              right: 20,
            ),
            child: const Icon(
              CustomIcons.notification,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class ToggleDropdown extends StatefulWidget {
  final List<String> entries;
  const ToggleDropdown({super.key, required this.entries});

  @override
  State<ToggleDropdown> createState() => _ToggleDropdownState(entries: entries);
}

class _ToggleDropdownState extends State<ToggleDropdown> {
  final List<String> entries;
  static const int animateDuration = 200;
  int selectedIndex = 0;
  bool isDropdownOpen = false;

  _ToggleDropdownState({required this.entries});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: animateDuration),
      height: !isDropdownOpen ? 72 : 112,
      width: globals.ScreenSize.width - 88,
      child: Stack(
        children: [
          AnimatedPositioned(
            top: !isDropdownOpen ? 0 : 60,
            duration: const Duration(milliseconds: animateDuration),
            curve: Curves.decelerate,
            child: SizedBox(
              height: 52,
              width: globals.ScreenSize.width - 88,
              // color: Theme.of(context).colorScheme.secondary,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("추천순"),
                  Text("최신순"),
                  Text("조회순"),
                  Text("평가순"),
                ],
              ),
            ),
          ),
          LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              color: Theme.of(context).colorScheme.background,
              child: Container(
                margin: const EdgeInsets.only(left: 36, right: 36, top: 12),
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      left: selectedIndex * ((constraints.maxWidth - 72) / entries.length),
                      duration: const Duration(milliseconds: animateDuration),
                      curve: Curves.decelerate,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                        width: (constraints.maxWidth - 72) / entries.length - 12,
                        height: 34,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(48),
                        ),
                      ),
                    ),
                    Row(
                      children: List.generate(
                        entries.length,
                        (index) => GestureDetector(
                          onTap: () {
                            if (selectedIndex != index) {
                              setState(() {
                                selectedIndex = index;
                                isDropdownOpen = false;
                              });
                            } else {
                              setState(() {
                                isDropdownOpen = true;
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: const BoxDecoration(color: Colors.transparent),
                            width: (constraints.maxWidth - 72) / entries.length - 1,
                            child: Row(
                              children: [
                                Container(
                                  // margin: EdgeInsets.only(left: constraints.maxWidth / entries.length / 4),
                                  width: (constraints.maxWidth - 72) / entries.length / 2,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    entries[index],
                                    style: selectedIndex == index ? TextStyle(color: Theme.of(context).colorScheme.onSecondary) : null,
                                  ),
                                ),
                                selectedIndex == index
                                    ? Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Icon(
                                          CustomIcons.chevronDown,
                                          size: 10,
                                          color: Theme.of(context).colorScheme.onSecondary,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ),
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
