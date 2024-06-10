import 'dart:math';

enum Dice { d4, d6, d8, d10, d12, d20 }

class Die {
  Die({required this.sides});

  final int sides;

  factory Die.d4() {
    return Die(sides: 4);
  }
  factory Die.d6() {
    return Die(sides: 6);
  }
  factory Die.d8() {
    return Die(sides: 8);
  }
  factory Die.d10() {
    return Die(sides: 10);
  }
  factory Die.d20() {
    return Die(sides: 20);
  }

  int get roll {
    return Random().nextInt(sides) + 1;
  }
}

extension DiceRoll on List<Die> {
  int get total {
    return fold(0, (sum, die) => sum + die.roll);
  }

  String get result => 'You rolled a $total!';
}
