import 'package:flutter/material.dart';
import 'package:codi/widgets/profile_circle.dart';

import 'package:codi/models/models.dart' as models;

class ChatProfiles extends StatelessWidget {
  final List<models.User> users;
  final double maxSize;

  const ChatProfiles({
    super.key,
    required this.users,
    required this.maxSize,
  });

  @override
  Widget build(BuildContext context) {
    int count = users.length > 5 ? 5 : users.length;
    double size = maxSize;
    if (count == 1) {
      size -= 4;
    }

    final double overlap = size / 2 * 0.25;

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: Stack(
        children: List.generate(
          count,
          (index) {
            switch (count) {
              case 1:
                return Positioned(
                  left: 0,
                  top: 0,
                  child: ProfileCircle(user: users[index], size: size),
                );
              case 2:
                return Positioned(
                  left: index * (size / 2 - overlap) + overlap / 2,
                  top: size / 4,
                  child: ProfileCircle(user: users[index], size: size / 2),
                );
              case 3:
                return Positioned(
                  left: index == 0 ? 15 : (index - 1) * (size / 2 - overlap) + overlap / 2,
                  top: index == 0 ? overlap / 2 : size / 2 - overlap / 2,
                  child: ProfileCircle(user: users[index], size: size / 2),
                );
              case 4:
                return Positioned(
                  left: (index % 2) * (size / 2 - overlap) + overlap / 2,
                  top: (index ~/ 2) * (size / 2 - overlap) + overlap / 2,
                  child: ProfileCircle(user: users[index], size: size / 2),
                );
              case 5:
                if (index < 3) {
                  return Positioned(
                    left: (index % 2) * (size / 2 - overlap) + overlap / 2,
                    top: (index ~/ 2) * (size / 2 - overlap) + overlap / 2,
                    child: ProfileCircle(user: users[index], size: size / 2),
                  );
                } else if (index == 3) {
                  return Positioned(
                    left: (index % 2) * (size / 2 - overlap) + overlap / 2,
                    top: (index ~/ 2) * (size / 2 - overlap) + overlap / 2,
                    child: Container(
                      height: size / 2,
                      width: size / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.red[900]!,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.30),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                        color: Colors.grey[300],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "+${users.length - 3}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size / 5,
                          letterSpacing: -0.7,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
