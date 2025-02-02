import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:codi/data/globals.dart' as globals;
import 'package:codi/models/models.dart' as models;

final selectedTitleProvider = StateProvider<models.Title?>((ref) => globals.codiUser.selected_title);

final codiUserProvider = StateProvider<models.User>((ref) => globals.codiUser);
