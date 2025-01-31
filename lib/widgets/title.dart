import 'package:codi/data/custom_icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;

class TitlesWidget extends StatefulWidget {
  final models.Title title;
  final models.User user;

  const TitlesWidget({
    super.key,
    required this.title,
    required this.user,
  });

  @override
  State<TitlesWidget> createState() => _TitlesWidgetState();
}

class _TitlesWidgetState extends State<TitlesWidget> {
  // bool selected = false;

  @override
  void initState() {
    super.initState();
    // selected = widget.user.selected_title?.title_id == widget.title.title_id;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.user.user_id == globals.codiUser.user_id) {
          setState(() {
            // selected = true;
            globals.codiUser.selected_title = widget.title;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
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
                    width: 90,
                    height: 90,
                  ),
                ),
                Text(
                  '${widget.title.count}장',
                  style: TextStyle(
                    color: widget.title.count >= 5 ? globals.Colors.sub3 : const Color(0xFF3906A6),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            if (widget.user.user_id == globals.codiUser.user_id && globals.codiUser.selected_title?.title_id == widget.title.title_id)
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
  }
}
