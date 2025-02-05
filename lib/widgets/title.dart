import 'package:flutter/material.dart';

import 'package:codi/data/custom_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:codi/providers/codi_user_provider.dart';
import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;
import 'package:codi/data/api_wrapper.dart' as api;

class TitlesWidget extends ConsumerStatefulWidget {
  final models.Title title;
  final models.User user;
  bool isprofile = true;

  TitlesWidget({
    super.key,
    required this.title,
    required this.user,
    required this.isprofile,
  });

  @override
  _TitlesWidgetState createState() => _TitlesWidgetState();
}

class _TitlesWidgetState extends ConsumerState<TitlesWidget> {
  bool isSelected = false;
  Future<void> _onTap() async {
    if (widget.isprofile) {
      if (widget.user.user_id == globals.codiUser.user_id &&
          widget.title.count > 0) {
        setState(() {
          isSelected = true;
        });
        var result = await api.User.updateUser(
          user_id: widget.user.user_id,
          selected_title_id: widget.title.title_id,
        );

        // print(result["message"]);
        if (result["message"] == "User updated successfully") {
          ref.read(selectedTitleProvider.notifier).state = widget.title;
          globals.codiUser.selected_title =
              widget.title; // Update global state if needed
        }

        setState(() {
          isSelected = false;
        });
      }
    } else {
      setState(() {
        isSelected = !isSelected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedTitle = ref.watch(selectedTitleProvider);
    // isSelected = selectedTitle?.title_id == widget.title.title_id;
    if (widget.isprofile) {
      return GestureDetector(
        onTap: _onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          width: 150,
          height: 203,
          decoration: BoxDecoration(
            color: globals.Colors.point1,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title.title,
                    style: const TextStyle(
                      color: globals.Colors.sub3,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Flexible(
                    child: SvgPicture.asset(
                      widget.title.count >= 5
                          ? 'assets/vectors/${widget.title.image_name}_on.svg'
                          : 'assets/vectors/${widget.title.image_name}_off.svg',
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      width: widget.isprofile ? 90 : 70,
                      height: widget.isprofile ? 90 : 70,
                    ),
                  ),
                  if (widget.isprofile)
                    Text(
                      '${widget.title.count}장',
                      style: TextStyle(
                        color: widget.title.count >= 5
                            ? globals.Colors.sub3
                            : const Color(0xFF3906A6),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                ],
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Icon(
                  CustomIcons.checkCircle,
                  color: globals.Colors.sub3.withOpacity(0.5),
                  size: 24,
                ),
              ),
              if (selectedTitle?.title_id == widget.title.title_id)
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: Icon(
                    CustomIcons.checkCircle,
                    color: globals.Colors.sub3,
                    size: 24,
                  ),
                ),
            ],
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: _onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            color: globals.Colors.point1,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title.title,
                    style: const TextStyle(
                      color: globals.Colors.sub3,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Flexible(
                    child: SvgPicture.asset(
                      isSelected
                          ? 'assets/vectors/${widget.title.image_name}_on.svg'
                          : 'assets/vectors/${widget.title.image_name}_off.svg',
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ],
              ),
              if (isSelected)
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Icon(
                    CustomIcons.checkCircle,
                    color: globals.Colors.sub3.withOpacity(0.5),
                    size: 24,
                  ),
                ),
              // if (selectedTitle?.title_id == widget.title.title_id)
              //   const Positioned(
              //     bottom: 10,
              //     right: 10,
              //     child: Icon(
              //       CustomIcons.checkCircle,
              //       color: globals.Colors.sub3,
              //       size: 24,
              //     ),
              //   ),
            ],
          ),
        ),
      );
    }
  }
}



// class TitlesWidget extends ConsumerWidget {
//   final models.Title title;
//   final models.User user;

//   const TitlesWidget({
//     super.key,
//     required this.title,
//     required this.user,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedTitle = ref.watch(selectedTitleProvider);

//     return GestureDetector(
//       onTap: () async {
//         if (user.user_id == globals.codiUser.user_id && title.count >= 0) {
//           ref.read(selectedTitleProvider.notifier).state = title;
//           var result = await api.User.updateUser(
//             user_id: user.user_id,
//             selected_title_id: title.title_id,
//           );

//           print(result["message"]);
//           if (result["message"] == "User updated successfully") {
//             globals.codiUser.selected_title = title; // Update global state if needed
//           }
//         }
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//         width: 150,
//         height: 203,
//         decoration: BoxDecoration(
//           color: globals.Colors.point1,
//           borderRadius: BorderRadius.circular(6),
//         ),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   title.title,
//                   style: const TextStyle(
//                     color: globals.Colors.sub3,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 Flexible(
//                   child: SvgPicture.asset(
//                     title.count >= 5 ? 'assets/vectors/${title.image_name}_on.svg' : 'assets/vectors/${title.image_name}_off.svg',
//                     alignment: Alignment.center,
//                     fit: BoxFit.cover,
//                     width: 90,
//                     height: 90,
//                   ),
//                 ),
//                 Text(
//                   '${title.count}장',
//                   style: TextStyle(
//                     color: title.count >= 5 ? globals.Colors.sub3 : const Color(0xFF3906A6),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ],
//             ),
//             if (selectedTitle?.title_id == title.title_id)
//               Positioned(
//                 bottom: 10,
//                 right: 10,
//                 child: Icon(
//                   CustomIcons.checkCircle,
//                   color: globals.Colors.sub3.withOpacity(0.5),
//                   size: 24,
//                 ),
//               ),
//             if (globals.codiUser.selected_title?.title_id == title.title_id)
//               const Positioned(
//                 bottom: 10,
//                 right: 10,
//                 child: Icon(
//                   CustomIcons.checkCircle,
//                   color: globals.Colors.sub3,
//                   size: 24,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// class TitlesWidget extends StatefulWidget {
//   final models.Title title;
//   final models.User user;

//   const TitlesWidget({
//     super.key,
//     required this.title,
//     required this.user,
//   });

//   @override
//   State<TitlesWidget> createState() => _TitlesWidgetState();
// }

// class _TitlesWidgetState extends State<TitlesWidget> {
//   // bool selected = false;

//   @override
//   void initState() {
//     super.initState();
//     // selected = widget.user.selected_title?.title_id == widget.title.title_id;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (widget.user.user_id == globals.codiUser.user_id) {
//           setState(() {
//             // selected = true;
//             globals.codiUser.selected_title = widget.title;
//           });
//         }
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(
//           horizontal: 5,
//           vertical: 5,
//         ),
//         width: 150,
//         height: 203,
//         decoration: BoxDecoration(
//           color: globals.Colors.point1,
//           borderRadius: BorderRadius.circular(6),
//         ),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   widget.title.title,
//                   style: const TextStyle(
//                     color: globals.Colors.sub3,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 Flexible(
//                   child: SvgPicture.asset(
//                     widget.title.count >= 5
//                         ? 'assets/vectors/${widget.title.image_name}_on.svg'
//                         : 'assets/vectors/${widget.title.image_name}_off.svg',
//                     alignment: Alignment.center,
//                     fit: BoxFit.cover,
//                     width: 90,
//                     height: 90,
//                   ),
//                 ),
//                 Text(
//                   '${widget.title.count}장',
//                   style: TextStyle(
//                     color: widget.title.count >= 5 ? globals.Colors.sub3 : const Color(0xFF3906A6),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ],
//             ),
//             if (widget.user.user_id == globals.codiUser.user_id && globals.codiUser.selected_title?.title_id == widget.title.title_id)
//               const Positioned(
//                 bottom: 10,
//                 right: 10,
//                 child: Icon(
//                   CustomIcons.checkCircle,
//                   color: globals.Colors.sub3,
//                   size: 24,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
