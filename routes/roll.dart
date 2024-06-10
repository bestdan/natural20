import 'package:dart_frog/dart_frog.dart';

import '../models/dice.dart';

int intOrZero(String? input) {
  return int.tryParse(input ?? '') ?? 0;
}

Response onRequest(RequestContext context) {
  final request = context.request.uri.queryParameters;

  // Pull the d4 to d20 query parameters off the request
  final nd20 = intOrZero(request['d20']);
  final d20s = List<Die>.generate(nd20, (index) => Die.d20());
  final rolls = d20s.map((e) => e.roll);
  final result = rolls.fold<String>(
      'You rolled: ',
      (previousValue, element) =>
          previousValue + 'and ' + element.toString() + ' ');
  //'You rolled:  ', {
  //previousValue, element) => previousValue + element);
  // final rolls = <String, int>{};
  // for (final element in Dice.values) {
  //   final val = intOrZero(request[element.toString()]);
  //   rolls.addEntries([MapEntry(element.toString(), val)]);
  // }

  return Response(body: '$result');
}
