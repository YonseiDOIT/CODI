import 'package:flutter/material.dart';

// data
import 'package:codi/data/theme.dart';
import 'package:codi/data/custom_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(),
      theme: mainTheme,
      home: const Main(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8),
          padding: const EdgeInsets.all(5),
          children: [
            Icon(
              Custom_Icons.home,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.chatbubbles,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.award_1,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.profile_1,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.profile_2,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.message,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.lock,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.search,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.notification,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.notificationNew,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.skillTitle,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.award_2,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.calender,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.send,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.sending,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.microphone,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.add,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.chevronDown,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.bookmark,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.edit,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.filter,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.left,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Icon(
              Custom_Icons.right,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
